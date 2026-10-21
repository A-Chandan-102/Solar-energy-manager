// Solar Energy Manager - Top level with input conditioning and usage statistics
// Wraps the original solar_energy_manager FSM (unchanged).
//
// Added features:
//   1. 2-FF synchronizers on battery_level and solar_available
//   2. Debounce filter (input must be stable DEBOUNCE_CYCLES before it is accepted)
//   3. Registered (glitch-free) solar_charge_enable
//   4. Prescaled, saturating time-in-mode counters (normal / save / critical)
//   5. Sticky "critical_seen" flag
//   6. 4:1 statistics read mux (stat_sel) -> stat_out
//
// Area knobs: STAT_W (counter width) and DEBOUNCE_CYCLES (1..8).

module solar_energy_manager #(
    parameter STAT_W          = 8,
    parameter DEBOUNCE_CYCLES = 4      // must be 1..8 (3-bit counter)
)(
    input  wire             clk,
    input  wire             rst_n,
    input  wire [1:0]       battery_level,
    input  wire             solar_available,

    input  wire [1:0]       stat_sel,     // 00=normal, 01=save, 10=critical, 11=flags
    input  wire             clear_stats,  // synchronous clear of counters and flag

    output wire [1:0]       operating_mode,
    output wire             essential_load_enable,
    output wire             nonessential_load_enable,
    output reg              solar_charge_enable,
    output reg  [STAT_W-1:0] stat_out,
    output reg              critical_seen
);

    localparam MODE_NORMAL   = 2'b00;
    localparam MODE_SAVE     = 2'b01;
    localparam MODE_CRITICAL = 2'b10;

    // Reset value of inputs: battery low, no solar (matches power-save reset)
    localparam [2:0] INPUT_RESET = 3'b001;   // {solar, battery[1:0]}

    // ------------------------------------------------------------------
    // 1. Synchronizers
    // ------------------------------------------------------------------
    reg [2:0] sync1, sync2;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            sync1 <= INPUT_RESET;
            sync2 <= INPUT_RESET;
        end else begin
            sync1 <= {solar_available, battery_level};
            sync2 <= sync1;
        end
    end

    // ------------------------------------------------------------------
    // 2. Debounce filter
    // ------------------------------------------------------------------
    reg [2:0] prev, filt;
    reg [2:0] dcnt;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            prev <= INPUT_RESET;
            filt <= INPUT_RESET;
            dcnt <= 3'd0;
        end else begin
            if (sync2 != prev) begin
                prev <= sync2;             // input still moving: restart timer
                dcnt <= 3'd0;
            end else if (sync2 != filt) begin
                if (dcnt >= DEBOUNCE_CYCLES - 1) begin
                    filt <= sync2;         // stable long enough: accept
                    dcnt <= 3'd0;
                end else begin
                    dcnt <= dcnt + 3'd1;
                end
            end else begin
                dcnt <= 3'd0;
            end
        end
    end

    wire [1:0] battery_f = filt[1:0];
    wire       solar_f   = filt[2];

    // ------------------------------------------------------------------
    // 3. Original FSM core
    // ------------------------------------------------------------------
    wire core_charge;

    solar_energy_manager core (
        .clk(clk),
        .rst_n(rst_n),
        .battery_level(battery_f),
        .solar_available(solar_f),
        .operating_mode(operating_mode),
        .essential_load_enable(essential_load_enable),
        .nonessential_load_enable(nonessential_load_enable),
        .solar_charge_enable(core_charge)
    );

    // Registered charge enable (glitch-free)
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) solar_charge_enable <= 1'b0;
        else        solar_charge_enable <= core_charge;
    end

    // ------------------------------------------------------------------
    // 4. Time-in-mode statistics (prescaled, saturating)
    // ------------------------------------------------------------------
    reg [3:0]        presc;
    reg [STAT_W-1:0] t_norm, t_save, t_crit;
    wire             tick = &presc;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            presc  <= 4'd0;
            t_norm <= {STAT_W{1'b0}};
            t_save <= {STAT_W{1'b0}};
            t_crit <= {STAT_W{1'b0}};
        end else if (clear_stats) begin
            presc  <= 4'd0;
            t_norm <= {STAT_W{1'b0}};
            t_save <= {STAT_W{1'b0}};
            t_crit <= {STAT_W{1'b0}};
        end else begin
            presc <= presc + 4'd1;
            if (tick) begin
                if (operating_mode == MODE_NORMAL   && t_norm != {STAT_W{1'b1}})
                    t_norm <= t_norm + 1'b1;
                if (operating_mode == MODE_SAVE     && t_save != {STAT_W{1'b1}})
                    t_save <= t_save + 1'b1;
                if (operating_mode == MODE_CRITICAL && t_crit != {STAT_W{1'b1}})
                    t_crit <= t_crit + 1'b1;
            end
        end
    end

    // ------------------------------------------------------------------
    // 5. Sticky critical flag
    // ------------------------------------------------------------------
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)                              critical_seen <= 1'b0;
        else if (clear_stats)                    critical_seen <= 1'b0;
        else if (operating_mode == MODE_CRITICAL) critical_seen <= 1'b1;
    end

    // ------------------------------------------------------------------
    // 6. Statistics read mux
    // ------------------------------------------------------------------
    always @(*) begin
        case (stat_sel)
            2'b00:   stat_out = t_norm;
            2'b01:   stat_out = t_save;
            2'b10:   stat_out = t_crit;
            default: stat_out = {{(STAT_W-4){1'b0}}, critical_seen,
                                 solar_f, battery_f};
        endcase
    end

endmodule