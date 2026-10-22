// Solar-Powered Device Energy Manager
// Step 1: RTL Design
// Battery level is a simulated 2-bit category, not a physical voltage sensor.

module solar_energy_manager (
    input  wire       clk,
    input  wire       rst_n,              // Active-low reset
    input  wire [1:0] battery_level,      // 00=critical, 01=low, 10=medium, 11=high
    input  wire       solar_available,    // 1 when usable solar power is available

    output reg  [1:0] operating_mode,      // 00=normal, 01=power-save, 10=critical
    output reg        essential_load_enable,
    output reg        nonessential_load_enable,
    output reg        solar_charge_enable
);

    // Battery-level encodings
    localparam BATTERY_CRITICAL = 2'b00;
    localparam BATTERY_LOW      = 2'b01;
    localparam BATTERY_MEDIUM   = 2'b10;
    localparam BATTERY_HIGH     = 2'b11;

    // Operating-mode encodings
    localparam MODE_NORMAL   = 2'b00;
    localparam MODE_SAVE     = 2'b01;
    localparam MODE_CRITICAL = 2'b10;

    reg [1:0] next_mode;

    // State-transition logic
    always @(*) begin
        next_mode = operating_mode;

        case (operating_mode)
            MODE_NORMAL: begin
                if (battery_level == BATTERY_CRITICAL) begin
                    next_mode = MODE_CRITICAL;
                end else if ((battery_level == BATTERY_LOW) && !solar_available) begin
                    next_mode = MODE_SAVE;
                end else begin
                    next_mode = MODE_NORMAL;
                end
            end

            MODE_SAVE: begin
                if (battery_level == BATTERY_CRITICAL) begin
                    next_mode = MODE_CRITICAL;
                end else if (battery_level >= BATTERY_MEDIUM) begin
                    next_mode = MODE_NORMAL;
                end else if ((battery_level == BATTERY_LOW) && solar_available) begin
                    next_mode = MODE_NORMAL;
                end else begin
                    next_mode = MODE_SAVE;
                end
            end

            MODE_CRITICAL: begin
                if (battery_level >= BATTERY_MEDIUM) begin
                    next_mode = MODE_NORMAL;
                end else if (battery_level == BATTERY_LOW) begin
                    next_mode = MODE_SAVE;
                end else begin
                    next_mode = MODE_CRITICAL;
                end
            end

            default: begin
                next_mode = MODE_SAVE;
            end
        endcase
    end

    // State register
    // Reset starts in power-save mode so nonessential loads remain disabled.
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            operating_mode <= MODE_SAVE;
        else
            operating_mode <= next_mode;
    end

    // Output-control logic
    always @(*) begin
        // Essential functions are retained in every operating mode.
        essential_load_enable = 1'b1;

        // Nonessential loads operate only in normal mode.
        nonessential_load_enable = (operating_mode == MODE_NORMAL);

        // Charge whenever solar power is available and the battery is not full.
        solar_charge_enable = solar_available && (battery_level != BATTERY_HIGH);
    end

endmodule
