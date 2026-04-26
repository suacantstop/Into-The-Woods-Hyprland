#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUT_DIR="$(dirname "${SCRIPT_DIR}")/screenshots"
mkdir -p "${OUT_DIR}"

timestamp="$(date +%Y-%m-%d_%H-%M-%S)"

hyprshot -m output -o "${OUT_DIR}" -f "nebula-${timestamp}-desktop.png"
hyprshot -m region -o "${OUT_DIR}" -f "nebula-${timestamp}-region.png"

echo "Screenshots saved to: ${OUT_DIR}"
