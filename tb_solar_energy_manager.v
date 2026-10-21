`timescale 1ns/1ps

module tb_solar_energy_manager;
    reg clk;
    reg rst_n;
    reg [1:0] battery_level;
    reg solar_available;

    wire [1:0] operating_mode;
    wire essential_load_enable;
    wire nonessential_load_enable;
    wire solar_charge_enable;

    integer checks;
    integer errors;

    localparam MODE_NORMAL   = 2'b00;
    localparam MODE_SAVE     = 2'b01;
    localparam MODE_CRITICAL = 2'b10;

    solar_energy_manager dut (
        .clk(clk),
        .rst_n(rst_n),
        .battery_level(battery_level),
        .solar_available(solar_available),
        .operating_mode(operating_mode),
        .essential_load_enable(essential_load_enable),
        .nonessential_load_enable(nonessential_load_enable),
        .solar_charge_enable(solar_charge_enable)
    );

    // 10 ns clock period.
    always #5 clk = ~clk;

    task check_outputs;
        begin
            checks = checks + 1;

            if (essential_load_enable !== 1'b1) begin
                $display("FAIL at %0t: essential_load_enable must remain asserted", $time);
                errors = errors + 1;
            end

            if (nonessential_load_enable !== (operating_mode == MODE_NORMAL)) begin
                $display("FAIL at %0t: nonessential load does not match operating mode %b",
                         $time, operating_mode);
                errors = errors + 1;
            end

            if (solar_charge_enable !== (solar_available && (battery_level != 2'b11))) begin
                $display("FAIL at %0t: incorrect solar_charge_enable for battery=%b solar=%b",
                         $time, battery_level, solar_available);
                errors = errors + 1;
            end
        end
    endtask

    // Change inputs away from the active clock edge, then check the next state.
    task apply_cycle;
        input [1:0] new_battery_level;
        input       new_solar_available;
        input [1:0] expected_mode;
        begin
            @(negedge clk);
            battery_level = new_battery_level;
            solar_available = new_solar_available;
            #1;
            check_outputs();

            @(posedge clk);
            #1;
            checks = checks + 1;
            if (operating_mode !== expected_mode) begin
                $display("FAIL at %0t: battery=%b solar=%b expected mode=%b got=%b",
                         $time, battery_level, solar_available,
                         expected_mode, operating_mode);
                errors = errors + 1;
            end
            check_outputs();
        end
    endtask

    initial begin
        $dumpfile("build/solar_energy_manager.vcd");
        $dumpvars(0, tb_solar_energy_manager);

        clk = 1'b0;
        rst_n = 1'b1;
        battery_level = 2'b01;
        solar_available = 1'b0;
        checks = 0;
        errors = 0;

        // Assert reset after time zero to guarantee a clean active-low reset edge.
        #1 rst_n = 1'b0;
        #1;
        checks = checks + 1;
        if (operating_mode !== MODE_SAVE) begin
            $display("FAIL: reset should start the controller in power-save mode; got %b",
                     operating_mode);
            errors = errors + 1;
        end
        check_outputs();

        repeat (2) @(posedge clk);
        @(negedge clk);
        rst_n = 1'b1;

        // Power-save holds at low battery without solar; medium battery restores normal mode.
        apply_cycle(2'b01, 1'b0, MODE_SAVE);
        apply_cycle(2'b10, 1'b0, MODE_NORMAL);

        // Normal mode sheds nonessential loads when the battery becomes low without solar.
        apply_cycle(2'b01, 1'b0, MODE_SAVE);

        // Critical battery enters critical mode and remains there while still critical.
        apply_cycle(2'b00, 1'b0, MODE_CRITICAL);
        apply_cycle(2'b00, 1'b1, MODE_CRITICAL);

        // A low battery exits critical mode to power-save, then solar availability restores normal.
        apply_cycle(2'b01, 1'b1, MODE_SAVE);
        apply_cycle(2'b01, 1'b1, MODE_NORMAL);

        // Charging must be disabled when full, enabled below full if solar is available,
        // and disabled when solar is unavailable.
        apply_cycle(2'b11, 1'b1, MODE_NORMAL);
        apply_cycle(2'b10, 1'b1, MODE_NORMAL);
        apply_cycle(2'b10, 1'b0, MODE_NORMAL);
        apply_cycle(2'b01, 1'b0, MODE_SAVE);
        apply_cycle(2'b11, 1'b0, MODE_NORMAL);

        // Asynchronous reset must return to power-save without waiting for a clock edge.
        @(negedge clk);
        #2;
        rst_n = 1'b0;
        #1;
        checks = checks + 1;
        if (operating_mode !== MODE_SAVE) begin
            $display("FAIL: asynchronous reset did not restore power-save mode; got %b",
                     operating_mode);
            errors = errors + 1;
        end
        check_outputs();

        if (errors == 0) begin
            $display("PASS: Solar Energy Manager testbench completed (%0d checks).", checks);
            $finish;
        end else begin
            $display("FAIL: %0d errors across %0d checks.", errors, checks);
            $fatal(1);
        end
    end
endmodule
