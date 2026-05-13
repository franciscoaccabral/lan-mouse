#!/usr/bin/env bash
set -euo pipefail

echo "== Nível 0: formato =="
cargo fmt --check

echo "== Nível 0: testes Rust =="
cargo test --workspace --all-features

echo "== Nível 0: clippy =="
cargo clippy --workspace --all-targets --all-features -- -D warnings
