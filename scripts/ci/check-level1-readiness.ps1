$ErrorActionPreference = "Stop"

Write-Host "== Nível 1: prontidão para dois processos locais =="
Write-Host "Este script ainda não executa o teste de dois processos como gate."
Write-Host "Ele valida a build mínima sem GTK e registra bloqueios conhecidos."

cargo build --no-default-features

@"

Pendências antes de tornar Nível 1 obrigatório:
- Definir isolamento de IPC para permitir dois daemons locais sem colisão.
- Gerar configs temporárias com portas e certificados separados.
- Encerrar processos e coletar logs de forma determinística.
- Promover o arnés para teste de integração quando a execução for estável.
"@ | Write-Host
