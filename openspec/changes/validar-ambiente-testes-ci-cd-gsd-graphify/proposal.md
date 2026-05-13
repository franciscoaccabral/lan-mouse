## Por Que

As próximas melhorias do Lan Mouse dependem de validação em camadas diferentes: testes Rust determinísticos, dois processos locais, sessão Wayland/Hyprland, Omarchy real, Windows com GUI/bandeja e configuração do GitHub. Se cada mudança definir isso isoladamente, o projeto tende a perder rastreabilidade e a confundir "compilou" com "foi validado no ambiente certo".

Esta mudança cria a Spec Zero para transformar ambiente de testes, CI/CD, runners, VMs, GSD e Graphify em requisitos explícitos antes das specs de produto.

## O Que Muda

- Define uma matriz oficial de níveis de teste, de Nível 0 a Nível 4.
- Registra a configuração GitHub necessária como parte da spec, incluindo branch protection, runners, labels, secrets, ambientes protegidos e política de segurança para runner self-hosted.
- Cria documentação operacional em `docs/CI_CD_TESTES.md`.
- Atualiza `.planning/` para que GSD trate níveis de teste como dependências de fase.
- Formaliza o uso do Graphify como mapa técnico antes de mudanças em captura, emulação, conexão, GUI ou protocolo.
- Declara dependências entre a Spec Zero e as próximas specs de produto.

## Capacidades

### Novas Capacidades

- `test-environment-governance`: Define como o projeto controla níveis de teste, CI/CD, GitHub, runners, VMs, GSD e Graphify.

### Capacidades Modificadas

- `project-governance`: Passa a depender da matriz de testes e do fluxo Graphify/GSD para mudanças não triviais.

## Não Objetivos

- Não implementar tray icon, conexão guiada, Hyprland/Omarchy input ou adoção de PRs upstream nesta mudança.
- Não exigir runner self-hosted imediatamente para todo PR.
- Não declarar validação real de Hyprland, Omarchy ou Windows GUI sem execução no ambiente correspondente.
- Não publicar releases nem alterar assinatura/empacotamento.

## Impacto

- Arquivos afetados: `openspec/changes/validar-ambiente-testes-ci-cd-gsd-graphify/**`, `docs/CI_CD_TESTES.md`, `.planning/**`.
- Sistemas afetados: planejamento, validação, CI/CD e governança de execução.
- Impacto runtime: nenhum.
- Documentação pública: documentação operacional nova; README/DOC só precisam mudar quando as specs de produto alterarem comportamento público.
