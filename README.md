# Solar-Powered Device Energy Manager Using RTL Design

A synthesizable Verilog controller that manages simulated battery energy by selecting normal, power-save, and critical operating modes. Essential loads remain enabled while nonessential loads are disabled outside normal mode. Solar charging is enabled when solar power is available and the simulated battery is not full.

> **Scope note:** `battery_level` is a simulated 2-bit category, not a physical battery sensor or an analogue voltage measurement. This project currently models control logic only; it does not interface directly with solar panels, a battery, or power electronics.

## Project flow and status

- [x] Step 1 — RTL module
- [x] Step 2 — Testbench written
- [ ] Step 3 — Run RTL simulation and review waveform in Codespaces
- [ ] Step 4 — Run Yosys synthesis and inspect pre/post-synthesis netlists
- [ ] Step 5 — Static timing analysis
- [ ] Step 6 — Floorplanning
- [ ] Step 7 — Placement
- [ ] Step 8 — Clock-tree synthesis
- [ ] Step 9 — Routing
- [ ] Step 10 — RC extraction
- [ ] Step 11 — Post-layout timing analysis
- [ ] Step 12 — DRC and LVS
- [ ] Step 13 — GDSII generation

## Repository structure

```text
solar-energy-manager-rtl/
├── .devcontainer/
│   ├── devcontainer.json
│   └── post-create.sh
├── scripts/
│   ├── check-tools.sh
│   └── yosys_flow.ys
├── solar_energy_manager.v
├── tb_solar_energy_manager.v
├── Makefile
├── .gitignore
└── README.md
```

## Tools

- **Icarus Verilog (`iverilog`, `vvp`)** — compile and run the RTL testbench.
- **GTKWave** — review the generated VCD waveform. Browser-based Codespaces may not launch its desktop GUI directly; download the VCD and open it locally if needed.
- **Yosys** — elaborate and synthesize the RTL, write Verilog netlists and generate graph descriptions.
- **Graphviz (`dot`)** — convert Yosys DOT graphs into SVG diagrams that can be opened in the Codespaces editor.
- **Verilator** — additional lint checks.
- **Docker** — will be used later for the compatible OpenLane/Sky130 physical-design flow. It is not required for the current testbench or generic synthesis steps.

The full Sky130 physical-design environment is not downloaded automatically when the Codespace is created. It will be configured for the physical-design stage.

## 1. Check the tools

```bash
make tools
```

## 2. Lint the RTL

```bash
make lint
```

Lint checks syntax and common coding issues. It does **not** verify functional behavior, which is why the testbench is a separate step.

## 3. Run the testbench

```bash
make sim
```

The testbench checks reset behavior, state transitions, essential and nonessential load enables, and the solar-charge enable condition. It also writes a waveform file:

```text
build/solar_energy_manager.vcd
```

A successful simulation prints a `PASS` line. If an assertion fails, the testbench prints a failure message and exits with a nonzero status.

To open the waveform where a desktop GUI is available:

```bash
make wave
```

In browser-based Codespaces, use `make sim`, then download `build/solar_energy_manager.vcd` and open it in a local GTKWave installation if `gtkwave` cannot display a window.

## 4. Generate pre- and post-synthesis netlists with Yosys

```bash
make synth
```

The command runs `scripts/yosys_flow.ys` using Yosys and then converts the generated DOT graphs to SVG. Outputs are placed in `build/`:

| File | Meaning |
|---|---|
| `solar_energy_manager_pre_synth.v` | RTL after process lowering and basic optimization, before the full synthesis flow |
| `solar_energy_manager_pre_synth.dot` | Yosys graph description for the pre-synthesis view |
| `solar_energy_manager_pre_synth.svg` | Viewable pre-synthesis diagram |
| `solar_energy_manager_post_synth.v` | Generic logic netlist after Yosys synthesis and optimization |
| `solar_energy_manager_post_synth.dot` | Yosys graph description for the post-synthesis view |
| `solar_energy_manager_post_synth.svg` | Viewable post-synthesis diagram |

Open the SVG files from the Codespaces file explorer. You can also view the Yosys cell counts and design statistics in the terminal output.

**Important distinction:** this is generic synthesis, not Sky130 technology mapping. The post-synthesis netlist at this stage contains generic logic cells; it is not yet mapped to `sky130_fd_sc_hd` library cells. The Sky130-mapped netlist comes later in the ASIC flow.

If `make synth` reports that Yosys or `dot` is missing, run the Codespaces rebuild command so `.devcontainer/post-create.sh` can install the tools.

## Functional summary

| Signal | Description |
|---|---|
| `clk` | Clock |
| `rst_n` | Active-low asynchronous reset |
| `battery_level[1:0]` | `00` critical, `01` low, `10` medium, `11` high |
| `solar_available` | Indicates usable solar input is available |
| `operating_mode[1:0]` | `00` normal, `01` power-save, `10` critical |
| `essential_load_enable` | Remains enabled in every operating mode |
| `nonessential_load_enable` | Enabled only in normal mode |
| `solar_charge_enable` | Enabled when solar power is available and battery category is not full |

## Git workflow

After running the testbench and synthesis, generated files under `build/` are ignored by Git. Commit the source and scripts with:

```bash
git status
git add README.md Makefile solar_energy_manager.v tb_solar_energy_manager.v scripts .devcontainer
git commit -m "Add testbench and Yosys netlist diagrams"
git push
```

## Later: OpenLane / Sky130

The course screenshots use the legacy OpenLane `v0.21` flow (`flow.tcl` and Tcl configuration). When RTL simulation and generic synthesis are working, the next stage is to add the matching OpenLane design configuration, timing constraints, and Sky130 PDK setup. Do not mix OpenLane 1 Tcl instructions with OpenLane 2 JSON-based configuration instructions.
