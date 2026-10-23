#!/bin/bash
# Copy the latest OpenLane run out of the OpenLane repo into the main repo.
SRC=/workspaces/Solar-energy-manager/OpenLane/designs/solar_energy_manager_top/runs
P=/workspaces/Solar-energy-manager/physical
LATEST=${1:-$(ls -1t "$SRC" | head -n 1)}

# Full run (ignored by git)
mkdir -p "$P/solar_energy_manager_top/runs"
rm -rf "$P/solar_energy_manager_top/runs/$LATEST"
cp -r "$SRC/$LATEST" "$P/solar_energy_manager_top/runs/"

# Reports only (tracked by git)
rm -rf "$P/reports/latest"
mkdir -p "$P/reports/latest"
cp -r "$SRC/$LATEST/reports/." "$P/reports/latest/"
cp -r "$SRC/$LATEST/logs" "$P/reports/latest/logs"
echo "$LATEST" > "$P/reports/latest/RUN_NAME.txt"
echo "Copied run $LATEST -> physical/"
