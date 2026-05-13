# CI/CD E Testes Do Lan Mouse

Este documento define como o projeto controla testes, CI/CD, runners, VMs, GitHub, GSD e Graphify. Ele existe para evitar que uma mudança seja considerada pronta apenas porque compilou localmente.

## Objetivo

Cada spec de produto deve declarar quais níveis de teste são necessários, quais foram executados e quais ficaram como validação manual ou pendente por infraestrutura.

## Níveis De Teste

| Nível | Nome | Onde roda | Objetivo | Obrigatório para |
|-------|------|-----------|----------|------------------|
| 0 | Rust determinístico | GitHub-hosted runners | Unit tests, integration tests, protocolo, scancode, modificadores, config, erros e backend `dummy` | Todas as specs |
| 1 | Dois processos locais | GitHub-hosted runners quando houver isolamento suficiente | Dois daemons/processos com configs e portas separadas, handshake, autorização, conexão e reconexão | Conexão, PRs de rede/protocolo |
| 2 | VM Linux com Hyprland | Runner com KVM confiável ou self-hosted | `wlroots`, `hyprctl devices`, `wev`, tecla Super, modificadores e sessão Wayland mínima | Hyprland, `wlroots`, `evdev/uinput` |
| 3 | Omarchy real | VM dedicada ou runner real | Atalhos, barra, sessão gráfica, Waybar, bandeja e configurações reais do Omarchy | Declaração de suporte Omarchy |
| 4 | Windows GUI/bandeja | Windows real ou runner com sessão gráfica interativa | Launcher sem terminal, tray icon, restaurar janela, sair e CLI preservado | Tray/background no Windows |

## O Que Fica No Repositório

Eu posso configurar no repositório:

- OpenSpecs.
- Workflows GitHub Actions.
- Scripts em `scripts/ci/`.
- Testes Rust.
- Documentação.
- Coleta de artefatos.
- Jobs opcionais e manuais.
- Matriz GSD de dependências de teste.

Essas mudanças são revisáveis por diff e entram no controle de versão.

## Scripts Iniciais

| Script | Plataforma | Função |
|--------|------------|--------|
| `scripts/ci/run-level0.sh` | Linux/macOS | Roda formato, testes e clippy do Nível 0 |
| `scripts/ci/run-level0.ps1` | Windows/PowerShell | Roda formato, testes e clippy do Nível 0 |
| `scripts/ci/check-level1-readiness.sh` | Linux/macOS | Executa smoke test com dois daemons locais, IPC isolado, configs separadas e backends `dummy` |
| `scripts/ci/check-level1-readiness.ps1` | Windows/PowerShell | Verifica build mínima e registra o bloqueio atual de IPC fixo no Windows |
| `scripts/ci/collect-artifacts.sh` | Linux/macOS | Coleta ambiente, Graphify e Hyprland quando disponível |
| `scripts/ci/collect-artifacts.ps1` | Windows/PowerShell | Coleta ambiente e Graphify quando disponível |

O workflow manual `.github/workflows/test-environment.yml` usa esses scripts sem alterar os gates obrigatórios atuais.

## Configuração GitHub Necessária

Você precisa configurar no GitHub os itens que dependem da conta, das permissões ou da infraestrutura externa:

- Habilitar GitHub Actions, se necessário.
- Configurar proteção da branch principal.
- Exigir jobs obrigatórios:
  - `fmt`
  - `clippy`
  - `test`
  - integração local de dois processos quando estiver estável.
- Registrar runner self-hosted quando formos rodar VM/Hyprland/Omarchy de forma confiável.
- Definir labels mínimos do runner:
  - `self-hosted`
  - `linux`
  - `kvm`
  - `hyprland`
- Definir `actions-runner-2.327.1` ou label equivalente para indicar runner compatível com actions Node 24.
- Definir label adicional `omarchy` quando o runner ou VM validar Omarchy real.
- Configurar secrets apenas se houver release, assinatura ou publicação.
- Configurar ambiente protegido `release` se houver publicação automática.
- Aprovar uso de ambientes protegidos quando aplicável.
- Manter snapshot/base conhecida da VM Omarchy ou runner real.
- Garantir que runner self-hosted não execute PR externo não confiável sem revisão.

## Segurança De Runner Self-hosted

Runner self-hosted deve ser tratado como infraestrutura sensível. Um PR externo pode executar código arbitrário se o workflow permitir.

Política recomendada:

- Não rodar jobs self-hosted automaticamente para PR externo.
- Usar `workflow_dispatch` para testes de VM/Omarchy até existir política madura.
- Usar branch protection e ambientes protegidos para jobs de release.
- Limpar workspace, caches sensíveis e snapshots entre execuções.
- Registrar versão/base da VM Omarchy usada no teste.

## Artefatos De Falha

Jobs de Nível 2, Nível 3 e Nível 4 devem salvar artefatos quando falharem:

- Logs do Lan Mouse.
- Configs usadas.
- Versão do binário.
- Variáveis relevantes de ambiente gráfico.
- Saída de `hyprctl devices`, quando disponível.
- Saída de `wev`, quando disponível.
- Screenshots ou vídeo, quando houver sessão gráfica automatizada.
- Informações de rede e portas usadas.

## Uso Do Graphify

Antes de planejar ou implementar mudanças em captura, emulação, conexão, GUI ou protocolo:

1. Ler `graphify-out/GRAPH_REPORT.md`.
2. Verificar se o grafo foi gerado a partir do commit atual.
3. Usar `graphify query`, `graphify path` ou `graphify explain` quando a pergunta envolver relação entre módulos.
4. Após mudanças de código, rodar `graphify update .`.
5. Registrar no GSD se o grafo estiver desatualizado ou indicar acoplamento relevante.

## Dependência Das Specs De Produto

| Spec | Nível 0 | Nível 1 | Nível 2 | Nível 3 | Nível 4 |
|------|---------|---------|---------|---------|---------|
| `simplificar-conexao-e-diagnostico` | Obrigatório | Obrigatório | Recomendado | Opcional | Não aplicável |
| `adicionar-icone-de-bandeja-e-modo-segundo-plano` | Obrigatório | Não aplicável | Técnico Linux | Recomendado para Omarchy | Obrigatório para Windows |
| `melhorar-input-windows-para-omarchy-hyprland` | Obrigatório | Recomendado | Obrigatório | Obrigatório para concluir Omarchy | Recomendado para origem Windows |
| `adotar-prs-upstream-com-seguranca` | Conforme PR | Conforme PR | Conforme PR | Conforme PR | Conforme PR |

## Como Uma Spec Deve Registrar Validação

Cada spec de produto deve incluir:

- Níveis obrigatórios.
- Níveis recomendados.
- Níveis manuais.
- Artefatos esperados.
- Ambiente mínimo.
- Critério para considerar o teste suficiente.
- Itens que bloqueiam conclusão.

## Estratégia Inicial

1. Manter o CI atual para Nível 0.
2. Evoluir o smoke test de Nível 1 para cobrir handshake, autorização e reconexão antes de torná-lo obrigatório.
3. Preparar workflow manual para Nível 2.
4. Configurar runner self-hosted com labels quando houver KVM confiável.
5. Validar Nível 3 em Omarchy real apenas com workflow manual ou nightly.
6. Transformar validações manuais repetidas em automação quando o ambiente estabilizar.
