#!/usr/bin/env python3
"""Build a timing/area summary from an OpenLane 1.x run copied into physical/.

Usage (from project root, after ./physical/sync_out.sh run1):
    python3 physical/make_report.py [RUN_NAME]

Scans reports/**/*.rpt and logs/**/*sta*.log for OpenSTA slack lines.
Output: physical/reports/summary.md (also printed).
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

metric_re = re.compile(r"(worst slack|wns|tns)\s+(max|min)?\s*(-?[0-9]+\.?[0-9]*)", re.I)
corner_re = re.compile(r"((?:min|nom|max)_)?(tt|ss|ff)_(n?\d+C)_(\dv\d+)")
mode_hdr = re.compile(r"report_(worst_slack|tns|wns)\s+-(max|min)", re.I)

COLS = [
    ("worst slack", "max", "Setup worst slack"),
    ("worst slack", "min", "Hold worst slack"),
    ("tns", "max", "Setup TNS"),
    ("tns", "min", "Hold TNS"),
    ("wns", "max", "Setup WNS"),
    ("wns", "min", "Hold WNS"),
]

files = sorted(list((run / "reports").rglob("*.rpt")) +
               list((run / "logs").rglob("*sta*.log")))

rows = {}
for f in files:
    label = f.name
    corner = None
    m = corner_re.search(f.name)
    if m:
        corner = m.group(0)
    mode = None
    for line in f.read_text(errors="ignore").splitlines():
        c = corner_re.search(line)
        if c:
            corner = c.group(0)
        h = mode_hdr.search(line)
        if h:
            mode = h.group(2).lower()
        mm = metric_re.search(line)
        if mm:
            md = (mm.group(2) or mode or "").lower()
            if md not in ("max", "min"):
                continue
            key = (label, corner or "-")
            rows.setdefault(key, {})[(mm.group(1).lower(), md)] = mm.group(3)

out = [f"# Summary for run `{run.name}`\n"]

for f in sorted((run / "reports" / "synthesis").glob("*stat*")) if (run / "reports" / "synthesis").exists() else []:
    t = f.read_text(errors="ignore")
    cells = re.search(r"Number of cells:\s+(\d+)", t)
    area = re.search(r"Chip area[^:]*:\s+([0-9.]+)", t)
    out.append(f"**Synthesis** ({f.name}): cells = {cells.group(1) if cells else '?'}, "
               f"area = {area.group(1) + ' um^2' if area else '?'}\n")

out.append("## Timing (ns)\n")
out.append("| File | Corner | " + " | ".join(c[2] for c in COLS) + " |")
out.append("|" + "---|" * (len(COLS) + 2))
for (label, corner), vals in sorted(rows.items()):
    out.append(f"| {label} | {corner} | " + " | ".join(vals.get((m, md), "-") for m, md, _ in COLS) + " |")
if not rows:
    out.append("\nNo slack lines found. Run: grep -rl 'worst slack' on the run folder to locate them.")

text = "\n".join(out) + "\n"
dest = here / "reports"
dest.mkdir(exist_ok=True)
(dest / "summary.md").write_text(text)
print(text)
print(f"Saved to {dest / 'summary.md'}")