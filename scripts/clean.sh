#!/usr/bin/env bash
set -euo pipefail

APPDIR="$(cd "$(dirname "$0")/.." && pwd)"
export CONFIG_APPS_DIR="$APPDIR"
export CONFIG_INIT_ENTRYPOINT="main"

cd ~/nuttxspace/nuttx/
make clean CONFIG_APPS_DIR="$APPDIR"
