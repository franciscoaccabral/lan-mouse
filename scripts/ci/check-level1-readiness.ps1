$ErrorActionPreference = "Stop"

Write-Host "== Nível 1: prontidão para dois processos locais =="
Write-Host "No Windows, o IPC do frontend usa a porta fixa 127.0.0.1:5252."
Write-Host "Por isso este script mantém apenas a build mínima até haver isolamento configurável de IPC."

cargo build --no-default-features

@"

Pendências Windows:
- Tornar o IPC do frontend configurável para permitir dois daemons locais sem colisão.
- Reusar o arnés Linux com diretórios, configs, certificados e logs isolados.
"@ | Write-Host
