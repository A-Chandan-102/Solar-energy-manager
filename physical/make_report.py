#!/usr/bin/env python3
"""Physical-design summary report for an OpenLane 1.x run copied into physical/.

Usage (project root, after ./physical/sync_out.sh run1):
    python3 physical/make_report.py [RUN_NAME]

Sections: area / cell count, die and core area, per-stage single-corner timing,
multi-corner timing (RC corner x library corner), signoff checks (LVS, DRC, antenna).
Output: physical/reports/summary.md (also printed).

Multi-corner numbers are the worst slack over every reported path for each
corner (found from the 'Corner:' / 'Path Type:' / 'slack' lines in the mcsta logs).
"""
import re
import sys
import pathlib

here = pathlib.Path(__file__).resolve().parent
runs_dir = here / "solar_energy_manager_top" / "runs"
runs = sorted((p for p in runs_dir.iterdir() if p.is_dir()), key=lambda p: p.stat().st_mtime)
if not runs:
    sys.exit(f"No runs found in {runs_dir}")
run = runs_dir / sys.argv[1] if len(sys.argv) > 1 else runs[-1]
if not run.exists():
    sys.exit(f"Run not found: {run}")
rep, logs = run / "reports", run / "logs"

NAMES = {"slowest": "ss_100C_1v60", "typical": "tt_025C_1v80", "fastest": "ff_n40C_1v95"}
ORDER = ["ss_100C_1v60", "tt_025C_1v80", "ff_n40C_1v95"]
hdr_re = re.compile(r"^=+\s*(Slowest|Typical|Fastest)\s+Corner\s*=+", re.I)
corner_re = re.compile(r"^\s*Corner:\s*(\w+)", re.I)
ptype_re = re.compile(r"Path Type:\s*(max|min)", re.I)
slack_re = re.compile(r"^\s*(-?[0-9]+\.[0-9]+)\s+slack\s+\((MET|VIOLATED)\)")
cmd_re = re.compile(r"report_(worst_slack|tns|wns)(?:\s+-(max|min))?", re.I)
metric_re = re.compile(r"^\s*(worst slack|wns|tns)\s+(max|min)?\s*(-?[0-9]+\.?[0-9]*)\s*$", re.I)
rc_re = re.compile(r"\.(min|nom|max)\.log$")


def read(p):
    return p.read_text(errors="ignore")


out = [f"# Physical design report: `{run.name}`\n"]

# ---------------------------------------------------------------- area
out.append("## Area and cell count\n")
stat = rep / "synthesis" / "1-synthesis.AREA_0.stat.rpt"
if stat.exists():
    t = read(stat)
    cells = re.search(r"Number of cells:\s+(\d+)", t)
    area = re.search(r"Chip area[^:]*:\s+([0-9.]+)", t)
    out.append(f"- Synthesis: **{cells.group(1) if cells else '?'} cells**, "
               f"**{area.group(1) if area else '?'} um^2** ({stat.name})")
areas = {}
for label, name in (("Die", "3-initial_fp_die_area.rpt"), ("Core", "3-initial_fp_core_area.rpt")):
    f = rep / "floorplan" / name
    if f.exists():
        txt = read(f).strip()
        nums = [float(x) for x in re.findall(r"-?[0-9]+\.?[0-9]*", txt)]
        if len(nums) == 4:
            a = (nums[2] - nums[0]) * (nums[3] - nums[1])
        elif len(nums) == 1:
            a = nums[0]
        else:
            a = None
        areas[label] = a
        out.append(f"- {label} area ({name}): `{txt}`" + (f" -> {a:.1f} um^2" if a else ""))
if stat.exists() and areas.get("Core") and area:
    out.append(f"- Utilization (synthesized cell area / core area): "
               f"{100 * float(area.group(1)) / areas['Core']:.1f}%")
out.append("")

# ------------------------------------------------- single-corner stages
out.append("## Timing per flow stage (typical corner, ns)\n")
out.append("| Stage log | Setup worst slack | Hold worst slack | Setup TNS | Setup WNS |")
out.append("|---|---|---|---|---|")
for f in sorted(logs.rglob("*sta*.log")):
    if "mcsta" in f.name:
        continue
    vals, mode = {}, "max"
    for line in read(f).splitlines():
        c = cmd_re.search(line)
        if c:
            mode = (c.group(2) or "max").lower()
        m = metric_re.match(line)
        if m:
            vals[(m.group(1).lower(), (m.group(2) or mode).lower())] = m.group(3)
    if vals:
        g = lambda k, md: vals.get((k, md), "-")
        out.append(f"| {f.name} | {g('worst slack', 'max')} | {g('worst slack', 'min')} | "
                   f"{g('tns', 'max')} | {g('wns', 'max')} |")
out.append("")

# --------------------------------------------------------- multi-corner
out.append("## Multi-corner timing (ns)\n")
out.append("RC corner = wire parasitics (min / nom / max). Library corner = "
           "ss (slow) / tt (typical) / ff (fast).\n")
out.append("| RC corner | Library corner | Setup worst slack | Hold worst slack | Violated paths | Result |")
out.append("|---|---|---|---|---|---|")
found = False
for rcname in ("min", "nom", "max"):
    files = sorted(logs.rglob(f"*mcsta.{rcname}.log"))
    if not files:
        continue
    best, viol = {}, {}
    corner = None
    ptype = None
    for line in read(files[0]).splitlines():
        h = hdr_re.match(line) or corner_re.match(line)
        if h and h.group(1).lower() in NAMES:
            corner = NAMES[h.group(1).lower()]
        p = ptype_re.search(line)
        if p:
            ptype = p.group(1).lower()
        s = slack_re.match(line)
        if s and corner and ptype:
            v = float(s.group(1))
            k = (corner, ptype)
            best[k] = min(best.get(k, v), v)
            if s.group(2) == "VIOLATED":
                viol[corner] = viol.get(corner, 0) + 1
    for lib in ORDER:
        su, ho = best.get((lib, "max")), best.get((lib, "min"))
        if su is None and ho is None:
            continue
        found = True
        ok = (su is None or su >= 0) and (ho is None or ho >= 0)
        out.append(f"| {rcname} | {lib} | {'-' if su is None else f'{su:.2f}'} | "
                   f"{'-' if ho is None else f'{ho:.2f}'} | {viol.get(lib, 0)} | "
                   f"{'PASS' if ok else 'FAIL'} |")
if not found:
    out.append("| - | - | - | - | - | no per-corner path data found in the mcsta logs |")
out.append("")

# -------------------------------------------------------------- signoff
out.append("## Signoff checks\n")
lvs = next(iter(sorted((rep / "signoff").glob("*lvs*.rpt"))), None)
if lvs:
    t = read(lvs)
    if re.search(r"Circuits match uniquely|no net, device, pin, or property mismatches", t, re.I) \
            and re.search(r"Total errors\s*=\s*0", t, re.I):
        v = "PASS (no mismatches, total errors = 0)"
    elif re.search(r"do(es)? not match|Total errors\s*=\s*[1-9]", t, re.I):
        v = "MISMATCH, check the report"
    else:
        v = "verdict not found, check the report"
    out.append(f"- LVS ({lvs.name}): {v}")
drc = rep / "signoff" / "drc.rpt"
if drc.exists():
    m = re.search(r"COUNT:\s*(\d+)", read(drc), re.I)
    out.append(f"- DRC (drc.rpt): " + (f"{m.group(1)} violations" if m else "see file"))
ant = next(iter(sorted((rep / "signoff").glob("*antenna_violators.rpt"))), None)
if ant:
    n = len([l for l in read(ant).splitlines() if l.strip()])
    out.append(f"- Antenna ({ant.name}): {n} non-empty line(s) (0 means no violators)")
out.append("")

text = "\n".join(out) + "\n"
dest = here / "reports"
dest.mkdir(exist_ok=True)
(dest / "summary.md").write_text(text)
print(text)
print(f"Saved to {dest / 'summary.md'}")