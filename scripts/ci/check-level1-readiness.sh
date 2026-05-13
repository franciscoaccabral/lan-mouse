#!/usr/bin/env bash
set -euo pipefail

echo "== Nível 1: dois processos locais =="
echo "Executa dois daemons com IPC, configs, certificados e portas isolados."

tmp_dir="$(mktemp -d)"
pid_a=""
pid_b=""

cleanup() {
    if [[ -n "${pid_a}" ]] && kill -0 "${pid_a}" 2>/dev/null; then
        kill "${pid_a}" 2>/dev/null || true
    fi
    if [[ -n "${pid_b}" ]] && kill -0 "${pid_b}" 2>/dev/null; then
        kill "${pid_b}" 2>/dev/null || true
    fi
    wait "${pid_a}" 2>/dev/null || true
    wait "${pid_b}" 2>/dev/null || true
    rm -rf "${tmp_dir}"
}
trap cleanup EXIT

mkdir -p "${tmp_dir}/a/runtime" "${tmp_dir}/a/config" "${tmp_dir}/b/runtime" "${tmp_dir}/b/config" target/ci-artifacts

cat > "${tmp_dir}/a/config/config.toml" <<EOF
capture_backend = "dummy"
emulation_backend = "dummy"
port = 44241
cert_path = "${tmp_dir}/a/lan-mouse.pem"
EOF

cat > "${tmp_dir}/b/config/config.toml" <<EOF
capture_backend = "dummy"
emulation_backend = "dummy"
port = 44242
cert_path = "${tmp_dir}/b/lan-mouse.pem"
EOF

cargo build --no-default-features

XDG_RUNTIME_DIR="${tmp_dir}/a/runtime" \
XDG_CONFIG_HOME="${tmp_dir}/a/config-home" \
LAN_MOUSE_LOG_LEVEL=debug \
target/debug/lan-mouse --config "${tmp_dir}/a/config/config.toml" daemon \
    > target/ci-artifacts/level1-daemon-a.log 2>&1 &
pid_a="$!"

XDG_RUNTIME_DIR="${tmp_dir}/b/runtime" \
XDG_CONFIG_HOME="${tmp_dir}/b/config-home" \
LAN_MOUSE_LOG_LEVEL=debug \
target/debug/lan-mouse --config "${tmp_dir}/b/config/config.toml" daemon \
    > target/ci-artifacts/level1-daemon-b.log 2>&1 &
pid_b="$!"

for runtime in "${tmp_dir}/a/runtime" "${tmp_dir}/b/runtime"; do
    socket="${runtime}/lan-mouse-socket.sock"
    for _ in {1..50}; do
        [[ -S "${socket}" ]] && break
        sleep 0.1
    done
    if [[ ! -S "${socket}" ]]; then
        echo "Socket IPC não ficou pronto: ${socket}" >&2
        exit 1
    fi
done

XDG_RUNTIME_DIR="${tmp_dir}/a/runtime" \
XDG_CONFIG_HOME="${tmp_dir}/a/config-home" \
target/debug/lan-mouse --config "${tmp_dir}/a/config/config.toml" cli list \
    > target/ci-artifacts/level1-cli-a.log

XDG_RUNTIME_DIR="${tmp_dir}/b/runtime" \
XDG_CONFIG_HOME="${tmp_dir}/b/config-home" \
target/debug/lan-mouse --config "${tmp_dir}/b/config/config.toml" cli list \
    > target/ci-artifacts/level1-cli-b.log

echo "Nível 1 smoke passou: dois daemons locais responderam via IPC isolado."
