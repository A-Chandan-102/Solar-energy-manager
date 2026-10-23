#!/bin/bash
# Refresh config and sources in OpenLane, keeping any existing runs
D=/workspaces/Solar-energy-manager/OpenLane/designs/solar_energy_manager_top
S=/workspaces/Solar-energy-manager/physical/solar_energy_manager_top
mkdir -p "$D/src"
cp "$S/config.tcl" "$D/config.tcl"
cp "$S"/src/*.v "$D/src/"
echo "Config and sources copied into OpenLane/designs/"
