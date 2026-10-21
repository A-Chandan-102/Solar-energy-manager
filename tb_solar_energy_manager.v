`timescale 1ns/1ps

// Testbench for solar_energy_manager
// Compile: iverilog -g2012 -o build/top_sim solar_energy_manager.v \
//              solar_energy_manager.v tb_solar_energy_manager.v
// Run:     vvp build/top_sim
//
// Input latency: 2 sync stages + debounce (4) + FSM register ~= 8 clocks, so every
// stimulus is held for SETTLE_CYCLES and the settled result is checked.

module tb_solar_energy_manager;

    localparam STAT_W          = 8;
    localparam DEBOUNCE_CYCLES = 4;
    localparam SETTLE_CYCLES   = 12;

    localparam MODE_NORMAL   = 2'b00;
    localparam MODE_SAVE     = 2'b01;
    localparam MODE_CRITICAL = 2'b10;

    reg        clk;
    reg        rst_n;
    reg [1:0]  battery_level;
    reg        solar_available;
    reg [1:0]  stat_sel;
    reg        clear_stats;

    wire [1:0]        operating_mode;
    wire              essential_load_enable;
    wire              nonessential_load_enable;
    wire              solar_charge_enable;
    wire [STAT_W-1:0] stat_out;
    wire              critical_seen;

    integer checks;
    integer errors;

    solar_energy_manager #(
        .STAT_W(STAT_W),
        .DEBOUNCE_CYCLES(DEBOUNCE_CYCLES)
    ) dut (
        .clk(clk),
        .rst_n(rst_n),
        .battery_level(battery_level),
        .solar_available(solar_available),
        .stat_sel(stat_sel),
        .clear_stats(clear_stats),
        .operating_mode(operating_mode),
        .essential_load_enable(essential_load_enable),
        .nonessential_load_enable(nonessential_load_enable),
        .solar_charge_enable(solar_charge_enable),
        .stat_out(stat_out),
        .critical_seen(critical_seen)
    );

    // 10 ns clock
    always #5 clk = ~clk;

    // ------------------------------------------------------------
    // Helpers
    // ------------------------------------------------------------
    task fail;
        input [8*48-1:0] msg;
        begin
            $display("FAIL at %0t: %0s", $time, msg);
            errors = errors + 1;
        end
    endtask

    // Check the outputs that must hold in every settled state
    task check_outputs;
        input [1:0] expected_mode;
        input [1:0] batt;
        input       solar;
        begin
            checks = checks + 1;
            if (operating_mode !== expected_mode) begin
                $display("FAIL at %0t: batt=%b solar=%b expected mode=%b got=%b",
                         $time, batt, solar, expected_mode, operating_mode);
                errors = errors + 1;
            end
            if (essential_load_enable !== 1'b1)
                fail("essential load must stay enabled");
            if (nonessential_load_enable !== (operating_mode == MODE_NORMAL))
                fail("nonessential load does not match mode");
            if (solar_charge_enable !== (solar && (batt != 2'b11))) begin
                $display("FAIL at %0t: charge=%b for batt=%b solar=%b",
                         $time, solar_charge_enable, batt, solar);
                errors = errors + 1;
            end
        end
    endtask

    // Apply inputs on a negedge, hold, then check the settled state
    task apply;
        input [1:0] batt;
        input       solar;
        input [1:0] expected_mode;
        begin
            @(negedge clk);
            battery_level   = batt;
            solar_available = solar;
            repeat (SETTLE_CYCLES) @(posedge clk);
            #1;
            check_outputs(expected_mode, batt, solar);
        end
    endtask

    task expect_stat;
        input [1:0]        sel;
        input [STAT_W-1:0] expected;
        begin
            stat_sel = sel;
            #1;
            checks = checks + 1;
            if (stat_out !== expected) begin
                $display("FAIL at %0t: stat_sel=%b expected %0d got %0d",
                         $time, sel, expected, stat_out);
                errors = errors + 1;
            end
        end
    endtask

    task pulse_clear;
        begin
            @(negedge clk);
            clear_stats = 1'b1;
            @(posedge clk);
            @(negedge clk);
            clear_stats = 1'b0;
        end
    endtask

    // ------------------------------------------------------------
    // Test sequence
    // ------------------------------------------------------------
    initial begin
        $dumpfile("build/solar_energy_manager.vcd");
        $dumpvars(0, tb_solar_energy_manager);

        clk             = 1'b0;
        rst_n           = 1'b1;
        battery_level   = 2'b01;
        solar_available = 1'b0;
        stat_sel        = 2'b00;
        clear_stats     = 1'b0;
        checks          = 0;
        errors          = 0;

        // ---- Reset ----
        #1 rst_n = 1'b0;
        #1;
        checks = checks + 1;
        if (operating_mode !== MODE_SAVE)
            fail("reset must start in power-save");
        if (critical_seen !== 1'b0)
            fail("critical_seen must be clear after reset");
        expect_stat(2'b00, 8'd0);
        expect_stat(2'b01, 8'd0);
        expect_stat(2'b10, 8'd0);

        repeat (2) @(posedge clk);
        @(negedge clk);
        rst_n = 1'b1;

        // ---- Mode transitions (settled results) ----
        apply(2'b01, 1'b0, MODE_SAVE);      // hold power-save
        apply(2'b10, 1'b0, MODE_NORMAL);    // medium battery -> normal
        apply(2'b01, 1'b0, MODE_SAVE);      // low, no solar -> save

        checks = checks + 1;
        if (critical_seen !== 1'b0)
            fail("critical_seen set before any critical event");

        apply(2'b00, 1'b0, MODE_CRITICAL);  // save -> critical directly
        apply(2'b00, 1'b1, MODE_CRITICAL);  // stays critical with solar
        apply(2'b01, 1'b1, MODE_NORMAL);    // critical -> save -> normal (chains)

        checks = checks + 1;
        if (critical_seen !== 1'b1)
            fail("critical_seen should be sticky-set");

        // ---- Charge enable ----
        apply(2'b11, 1'b1, MODE_NORMAL);    // full: no charge
        apply(2'b10, 1'b1, MODE_NORMAL);    // below full + solar: charge
        apply(2'b10, 1'b0, MODE_NORMAL);    // no solar: no charge

        // ---- Direct transitions ----
        apply(2'b00, 1'b0, MODE_CRITICAL);  // normal -> critical directly
        apply(2'b11, 1'b0, MODE_NORMAL);    // critical -> normal directly
        apply(2'b01, 1'b1, MODE_NORMAL);    // low + solar keeps normal
        apply(2'b01, 1'b0, MODE_SAVE);      // low, no solar -> save
        apply(2'b00, 1'b0, MODE_CRITICAL);  // save -> critical directly

        // ---- Debounce: short glitches must be ignored ----
        apply(2'b11, 1'b0, MODE_NORMAL);
        @(negedge clk);
        battery_level = 2'b00;              // 2-cycle glitch to critical
        repeat (2) @(negedge clk);
        battery_level = 2'b11;
        repeat (SETTLE_CYCLES) @(posedge clk);
        #1;
        check_outputs(MODE_NORMAL, 2'b11, 1'b0);

        @(negedge clk);
        solar_available = 1'b1;             // 1-cycle solar glitch
        @(negedge clk);
        solar_available = 1'b0;
        repeat (SETTLE_CYCLES) @(posedge clk);
        #1;
        check_outputs(MODE_NORMAL, 2'b11, 1'b0);

        // ---- Status flags via stat_sel = 11 ----
        apply(2'b00, 1'b0, MODE_CRITICAL);
        expect_stat(2'b11, 8'b0000_1000);   // {critical_seen, solar=0, batt=00}

        // ---- Statistics: clear, then exact prescaled count in critical ----
        pulse_clear;
        expect_stat(2'b00, 8'd0);
        expect_stat(2'b01, 8'd0);
        expect_stat(2'b10, 8'd0);
        repeat (80) @(posedge clk);         // 5 ticks (every 16 clocks)
        #1;
        expect_stat(2'b10, 8'd5);
        expect_stat(2'b00, 8'd0);
        expect_stat(2'b01, 8'd0);

        // ---- Save counter increments in power-save ----
        apply(2'b01, 1'b0, MODE_SAVE);
        repeat (64) @(posedge clk);
        #1;
        checks = checks + 1;
        stat_sel = 2'b01;
        #1;
        if (stat_out < 8'd3)
            fail("save counter did not increment");

        // ---- Saturation: counter must stop at all-ones ----
        repeat (4400) @(posedge clk);
        #1;
        expect_stat(2'b01, {STAT_W{1'b1}});
        repeat (100) @(posedge clk);
        #1;
        expect_stat(2'b01, {STAT_W{1'b1}});

        // ---- clear_stats clears counters and critical flag ----
        apply(2'b10, 1'b0, MODE_NORMAL);
        pulse_clear;
        expect_stat(2'b01, 8'd0);
        expect_stat(2'b11, 8'b0000_0010);   // flag clear, solar=0, batt=10

        // ---- Asynchronous reset mid-cycle ----
        @(negedge clk);
        #2;
        rst_n = 1'b0;
        #1;
        checks = checks + 1;
        if (operating_mode !== MODE_SAVE)
            fail("async reset did not restore power-save");
        if (solar_charge_enable !== 1'b0)
            fail("async reset did not clear charge enable");
        expect_stat(2'b00, 8'd0);
        expect_stat(2'b01, 8'd0);
        expect_stat(2'b10, 8'd0);

        if (errors == 0) begin
            $display("PASS: top-level testbench completed (%0d checks).", checks);
            $finish;
        end else begin
            $display("FAIL: %0d errors across %0d checks.", errors, checks);
            $fatal(1);
        end
    end

endmodule