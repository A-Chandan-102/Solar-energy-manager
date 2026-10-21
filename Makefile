RTL := solar_energy_manager.v
TB := tb_solar_energy_manager.v
BUILD_DIR := build
TOP := solar_energy_manager
TB_TOP := tb_solar_energy_manager

.PHONY: tools lint test sim wave synth netlists diagrams clean

tools:
	@bash scripts/check-tools.sh

lint:
	iverilog -g2012 -Wall -s $(TOP) -tnull $(RTL)
	verilator --lint-only -Wall -Wno-fatal --top-module $(TOP) $(RTL)

test: sim

sim:
	mkdir -p $(BUILD_DIR)
	iverilog -g2012 -Wall -s $(TB_TOP) -o $(BUILD_DIR)/$(TB_TOP).vvp $(RTL) $(TB)
	vvp $(BUILD_DIR)/$(TB_TOP).vvp

wave:
	$(MAKE) sim
	gtkwave $(BUILD_DIR)/$(TOP).vcd

synth:
	mkdir -p $(BUILD_DIR)
	yosys -Q -s scripts/yosys_flow.ys
	dot -Tsvg $(BUILD_DIR)/$(TOP)_pre_synth.dot -o $(BUILD_DIR)/$(TOP)_pre_synth.svg
	dot -Tsvg $(BUILD_DIR)/$(TOP)_post_synth.dot -o $(BUILD_DIR)/$(TOP)_post_synth.svg
	@echo "Generated pre/post-synthesis Verilog netlists, DOT graphs, SVG diagrams, and Yosys statistics in $(BUILD_DIR)/"

netlists diagrams: synth

clean:
	rm -rf $(BUILD_DIR) *.vcd *.vvp
