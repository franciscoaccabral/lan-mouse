#!/usr/bin/env bash
set -euo pipefail

out="${1:-target/ci-artifacts}"
mkdir -p "$out"

{
  echo "date=$(date -u +%Y-%m-%dT%H:%M:%SZ)"
  echo "os=$(uname -a || true)"
  echo "rustc=$(rustc --version || true)"
  echo "cargo=$(cargo --version || true)"
  echo "git_head=$(git rev-parse HEAD || true)"
  echo "wayland_display=${WAYLAND_DISPLAY:-}"
  echo "xdg_session_type=${XDG_SESSION_TYPE:-}"
  echo "xdg_current_desktop=${XDG_CURRENT_DESKTOP:-}"
} > "$out/environment.txt"

if command -v hyprctl >/dev/null 2>&1; then
  hyprctl devices > "$out/hyprctl-devices.txt" 2>&1 || true
fi

if command -v graphify >/dev/null 2>&1; then
  graphify --version > "$out/graphify-version.txt" 2>&1 || true
fi

echo "Artefatos coletados em: $out"
