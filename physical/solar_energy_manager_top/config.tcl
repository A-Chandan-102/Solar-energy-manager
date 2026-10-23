set ::env(DESIGN_NAME) "solar_energy_manager_top"
set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/src/*.v]

set ::env(CLOCK_PORT) "clk"
set ::env(CLOCK_PERIOD) "20.0"

set ::env(FP_SIZING) "absolute"
set ::env(DIE_AREA) "0 0 100 100"
set ::env(PL_TARGET_DENSITY) 0.45

set ::env(DESIGN_IS_CORE) 0
set ::env(FP_PDN_MULTILAYER) 0
set ::env(FP_PDN_VPITCH) 25
set ::env(FP_PDN_HPITCH) 25
set ::env(FP_PDN_VOFFSET) 5
set ::env(FP_PDN_HOFFSET) 5
set ::env(RT_MAX_LAYER) "met4"
