###############################################################################
# Created by write_sdc
# Fri Oct 23 06:24:17 2026
###############################################################################
current_design solar_energy_manager_top
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 20.0000 [get_ports {clk}]
set_clock_transition 0.1500 [get_clocks {clk}]
set_clock_uncertainty 0.2500 clk
set_input_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {battery_level[0]}]
set_input_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {battery_level[1]}]
set_input_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {clear_stats}]
set_input_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {rst_n}]
set_input_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {solar_available}]
set_input_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {stat_sel[0]}]
set_input_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {stat_sel[1]}]
set_output_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {critical_seen}]
set_output_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {essential_load_enable}]
set_output_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {nonessential_load_enable}]
set_output_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {operating_mode[0]}]
set_output_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {operating_mode[1]}]
set_output_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {solar_charge_enable}]
set_output_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {stat_out[0]}]
set_output_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {stat_out[1]}]
set_output_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {stat_out[2]}]
set_output_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {stat_out[3]}]
set_output_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {stat_out[4]}]
set_output_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {stat_out[5]}]
set_output_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {stat_out[6]}]
set_output_delay 4.0000 -clock [get_clocks {clk}] -add_delay [get_ports {stat_out[7]}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0334 [get_ports {critical_seen}]
set_load -pin_load 0.0334 [get_ports {essential_load_enable}]
set_load -pin_load 0.0334 [get_ports {nonessential_load_enable}]
set_load -pin_load 0.0334 [get_ports {solar_charge_enable}]
set_load -pin_load 0.0334 [get_ports {operating_mode[1]}]
set_load -pin_load 0.0334 [get_ports {operating_mode[0]}]
set_load -pin_load 0.0334 [get_ports {stat_out[7]}]
set_load -pin_load 0.0334 [get_ports {stat_out[6]}]
set_load -pin_load 0.0334 [get_ports {stat_out[5]}]
set_load -pin_load 0.0334 [get_ports {stat_out[4]}]
set_load -pin_load 0.0334 [get_ports {stat_out[3]}]
set_load -pin_load 0.0334 [get_ports {stat_out[2]}]
set_load -pin_load 0.0334 [get_ports {stat_out[1]}]
set_load -pin_load 0.0334 [get_ports {stat_out[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {clear_stats}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {clk}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {rst_n}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {solar_available}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {battery_level[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {battery_level[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {stat_sel[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {stat_sel[0]}]
set_timing_derate -early 0.9500
set_timing_derate -late 1.0500
###############################################################################
# Design Rules
###############################################################################
set_max_transition 0.7500 [current_design]
set_max_fanout 10.0000 [current_design]
