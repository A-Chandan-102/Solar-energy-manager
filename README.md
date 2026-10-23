
# Solar-Powered Device Energy Manager (RTL to GDS)

A synthesizable Verilog controller that manages simulated battery energy by choosing between **normal**, **power-save** and **critical** operating modes. It was verified in simulation and taken through the OpenLane 1.x flow on Sky130 inside a **100 x 100 um** die.

> The battery level is a simulated 2-bit category, not a physical voltage sensor.

## Behaviour

| Signal | Meaning |
|---|---|
| `battery_level[1:0]` | `00` critical, `01` low, `10` medium, `11` high |
| `solar_available` | `1` when usable solar power is available |
| `operating_mode[1:0]` | `00` normal, `01` power-save, `10` critical |
| `essential_load_enable` | Always `1` |
| `nonessential_load_enable` | `1` only in normal mode |
| `solar_charge_enable` | `1` when solar is available and the battery is not full |

Reset is asynchronous and active-low (`rst_n`). The controller starts in **power-save** mode.

Mode transitions:

| From | Condition | To |
|---|---|---|
| Normal | battery critical | Critical |
| Normal | battery low and no solar | Power-save |
| Power-save | battery critical | Critical |
| Power-save | battery medium or high, or (battery low and solar) | Normal |
| Critical | battery medium or high | Normal |
| Critical | battery low | Power-save |

## Two designs

| Design | File | Description |
|---|---|---|
| Core FSM | `solar_energy_manager.v` | The state machine above (about 22 cells in Yosys) |
| Top wrapper | `solar_energy_manager_top.v` | Core FSM plus input conditioning and statistics |

The wrapper adds:

- 2-FF synchronizers on `battery_level` and `solar_available`
- A debounce filter (inputs must be stable for `DEBOUNCE_CYCLES`, default 4)
- A registered, glitch-free `solar_charge_enable`
- Saturating time-in-mode counters for normal, power-save and critical (prescaled by 16, width `STAT_W`, default 8)
- A sticky `critical_seen` flag
- A `stat_sel` read mux and a `clear_stats` input

**Only the top wrapper went through physical design.** All results below are for `solar_energy_manager_top`.

## Repository layout

```
solar_energy_manager.v          Core FSM
solar_energy_manager_top.v      Top-level wrapper (physical design target)
tb_solar_energy_manager.v       Testbench for the core FSM
tb_solar_energy_manager_top.v   Testbench for the top wrapper
physical/
  solar_energy_manager_top/
    config.tcl                  OpenLane configuration
    src/                        Verilog sources used by OpenLane
  reports/                      Reports copied out of the OpenLane run
  sync_in.sh                    Copy config and sources into OpenLane
  sync_out.sh                   Copy a finished run out of OpenLane
  make_report.py                Builds physical/reports/summary.md
```

OpenLane itself is a separate repository and is not included here. The run folder (GDS, DEF, netlists) is not committed, so the committed reports and the summary are the record of the results.

## Simulation

Requires Icarus Verilog (`-g2012`, because the testbenches use `$fatal`).

Core FSM:

```bash
iverilog -g2012 -o build/core_sim solar_energy_manager.v tb_solar_energy_manager.v
vvp build/core_sim
```

Top wrapper:

```bash
iverilog -g2012 -o build/top_sim solar_energy_manager.v solar_energy_manager_top.v tb_solar_energy_manager_top.v
vvp build/top_sim
```

A passing run prints a `PASS` line with the number of checks. Both testbenches write a VCD file into `build/`.

The top-level testbench holds every input change for 12 clocks, because the synchronizers, debounce and FSM register add about 8 clocks of latency. If you change `DEBOUNCE_CYCLES`, adjust `SETTLE_CYCLES` in the testbench to stay above the new latency.

## Synthesis

Yosys with the Sky130 HD library:

```bash
LIB=<path to sky130_fd_sc_hd__tt_025C_1v80.lib>
yosys -p "read_liberty -lib $LIB; read_verilog solar_energy_manager.v solar_energy_manager_top.v; synth -top solar_energy_manager_top; flatten; dfflibmap -liberty $LIB; abc -liberty $LIB; clean; stat -liberty $LIB"
```

Both Verilog files must be read, because the wrapper instantiates the core FSM.

## Physical design flow

| Item | Value |
|---|---|
| Flow | OpenLane 1.0.2 (Docker), interactive mode |
| PDK | Sky130A, `sky130_fd_sc_hd` |
| Die | 100 x 100 um (absolute) |
| Clock | 20 ns on `clk` |
| Placement density target | 0.45 |
| Power grid | Custom `FP_PDN_*` pitch and offsets (25 / 5 um) for the small die, `met4` maximum routing layer |

Steps run, in order:

```tcl
prep -design solar_energy_manager_top -tag run1 -overwrite
run_synthesis
run_floorplan
run_placement
run_cts
run_routing
run_parasitics_sta
run_magic
run_magic_spice_export
run_magic_drc
run_lvs
run_antenna_check
```

To reproduce: clone OpenLane next to this repository and place this project in its `designs/` folder (`physical/sync_in.sh` does the copy), run `make mount`, then `./flow.tcl -interactive` and the commands above. After leaving the container, `physical/sync_out.sh run1` copies the run out, and `python3 physical/make_report.py run1` builds the summary.

## Results (run `run1`)

All numbers come from `physical/reports/summary.md`.

### Area

| Metric | Value |
|---|---|
| Synthesized cells | 213 |
| Synthesized cell area | 2,579.97 um^2 |
| Die area | 10,000 um^2 (100 x 100 um) |
| Core area | 6,761.5 um^2 |
| Utilization | 38.2% |

Utilization is synthesized cell area divided by core area. It excludes tap, decap and fill cells added later. Yosys and OpenLane map the design slightly differently, so their cell counts and areas differ (an earlier Yosys-only run gave about 2,044 um^2).

### Timing, all corners (ns)

The RC corner is the wire-parasitic extraction corner (min, nom, max). The library corner is slow (ss), typical (tt) or fast (ff). Each value is the worst slack over all reported paths for that corner.

| RC corner | Library corner | Setup worst slack | Hold worst slack | Violated paths | Result |
|---|---|---|---|---|---|
| min | ss_100C_1v60 | 9.36 | 0.74 | 0 | PASS |
| min | tt_025C_1v80 | 10.48 | 0.23 | 0 | PASS |
| min | ff_n40C_1v95 | 10.98 | 0.06 | 0 | PASS |
| nom | ss_100C_1v60 | 9.32 | 0.74 | 0 | PASS |
| nom | tt_025C_1v80 | 10.46 | 0.23 | 0 | PASS |
| nom | ff_n40C_1v95 | 10.96 | 0.06 | 0 | PASS |
| max | ss_100C_1v60 | 9.27 | 0.75 | 0 | PASS |
| max | tt_025C_1v80 | 10.44 | 0.24 | 0 | PASS |
| max | ff_n40C_1v95 | 10.95 | 0.06 | 0 | PASS |

- Setup is worst at the slow corner and hold is worst at the fast corner, as expected.
- The 20 ns clock is very relaxed for this logic, so these numbers do not show the maximum achievable frequency.
- Hold slack at the fast corner is positive but small (0.06 ns).

### Signoff

| Check | Result |
|---|---|
| DRC (router and Magic) | 0 violations |
| LVS | No net, device, pin or property mismatches; total errors = 0 |
| Antenna | No violators |

## Limitations

- Battery level and solar availability are simulated inputs, not sensor interfaces.
- No power analysis, IR-drop analysis, gate-level simulation, formal verification or tape-out was performed.
- The `STAT_W` counter width and `DEBOUNCE_CYCLES` are the main levers for trading features against area.

## Notes on the flow

An early attempt at floorplanning failed because `prep` was started without a synthesis netlist. This was a flow usage mistake, not a design issue. Restarting with a fresh run tag and running synthesis first fixed it.
