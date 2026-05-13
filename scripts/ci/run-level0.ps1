$ErrorActionPreference = "Stop"

Write-Host "== Nível 0: formato =="
cargo fmt --check

Write-Host "== Nível 0: testes Rust =="
cargo test --workspace --all-features

Write-Host "== Nível 0: clippy =="
cargo clippy --workspace --all-targets --all-features -- -D warnings
