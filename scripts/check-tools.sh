#!/usr/bin/env bash
set -euo pipefail

missing=0
for tool in git make iverilog vvp yosys dot verilator; do
  if command -v "$tool" >/dev/null 2>&1; then
    printf '[OK] %s: ' "$tool"
    case "$tool" in
      git) git --version ;;
      make) make --version | head -n 1 ;;
      iverilog) iverilog -V 2>&1 | head -n 1 ;;
      vvp) echo "Icarus Verilog runtime available" ;;
      yosys) yosys -V ;;
      dot) dot -V 2>&1 ;;
      verilator) verilator --version ;;
    esac
  else
    printf '[MISSING] %s\n' "$tool"
    missing=1
  fi
done

if ! command -v docker >/dev/null 2>&1; then
  printf '[OPTIONAL/MISSING] docker (required later for the OpenLane container, not for RTL simulation or generic Yosys synthesis)\n'
else
  docker --version
fi

if [ "$missing" -ne 0 ]; then
  echo 'One or more RTL-stage tools are missing. Rebuild the Codespace or run the setup script.' >&2
  exit 1
fi
