#!/usr/bin/env bash
set -euo pipefail

sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  iverilog \
  yosys \
  verilator \
  gtkwave \
  make \
  git \
  python3 \
  python3-pip \
  graphviz \
  curl \
  jq \
  unzip \
  ca-certificates

printf '\nRTL-stage tools installed. Versions detected:\n'
iverilog -V 2>&1 | head -n 1 || true
yosys -V || true
verilator --version || true
dot -V 2>&1 || true
docker --version || echo 'Docker is optional until the OpenLane stage.'
