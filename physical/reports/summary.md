# Physical design report: `run1`

## Area and cell count

- Synthesis: **213 cells**, **2579.974400 um^2** (1-synthesis.AREA_0.stat.rpt)
- Die area (3-initial_fp_die_area.rpt): `0.0 0.0 100.0 100.0` -> 10000.0 um^2
- Core area (3-initial_fp_core_area.rpt): `5.52 10.88 94.3 87.04` -> 6761.5 um^2
- Utilization (synthesized cell area / core area): 38.2%

## Timing per flow stage (typical corner, ns)

| Stage log | Setup worst slack | Hold worst slack | Setup TNS | Setup WNS |
|---|---|---|---|---|
| 13-cts_sta.log | 10.57 | 0.08 | 0.00 | 0.00 |
| 11-dpl_sta.log | 10.57 | 0.10 | 0.00 | 0.00 |
| 8-gpl_sta.log | 10.59 | 0.10 | 0.00 | 0.00 |
| 15-rsz_design_sta.log | 10.59 | 0.09 | 0.00 | 0.00 |
| 17-rsz_timing_sta.log | 10.59 | 0.21 | 0.00 | 0.00 |
| 20-grt_sta.log | 10.68 | 0.20 | 0.00 | 0.00 |
| 30-rcx_sta.log | 10.46 | 0.23 | 0.00 | 0.00 |
| 2-sta.log | 10.66 | 0.10 | 0.00 | 0.00 |

## Multi-corner timing (ns)

RC corner = wire parasitics (min / nom / max). Library corner = ss (slow) / tt (typical) / ff (fast).

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

## Signoff checks

- LVS (36-solar_energy_manager_top.lvs.rpt): PASS (no mismatches, total errors = 0)
- DRC (drc.rpt): 0 violations
- Antenna (37-antenna_violators.rpt): 0 non-empty line(s) (0 means no violators)

