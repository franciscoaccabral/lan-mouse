## Contexto

Lan Mouse é um software KVM com comportamento altamente dependente do sistema operacional e do backend. O CI atual já cobre build, check, clippy e testes em GitHub-hosted runners, mas não valida por si só cenários como Hyprland, Omarchy, tray icon, sessão gráfica real ou duas instâncias de daemon isoladas.

A Spec Zero estabelece um contrato: cada mudança futura deve declarar quais níveis de teste são obrigatórios, quais são recomendados e quais ficaram manuais ou pendentes por infraestrutura.

## Decisões

- Usar cinco níveis de teste:
  - Nível 0: Rust determinístico.
  - Nível 1: dois processos locais.
  - Nível 2: VM Linux com Hyprland.
  - Nível 3: Omarchy real.
  - Nível 4: Windows GUI/bandeja.
- Tratar configuração GitHub como requisito da spec, não como nota informal.
- Manter GitHub-hosted runners como base para Nível 0 e parte do Nível 1.
- Exigir runner self-hosted ou infraestrutura com KVM confiável para Nível 2 e Nível 3.
- Usar workflows manuais ou nightly para Omarchy/Hyprland enquanto o ambiente não for estável o bastante para bloquear todo PR.
- Atualizar GSD para registrar dependências de teste antes de iniciar fases de produto.
- Usar Graphify como mapa obrigatório antes de mudanças em módulos críticos.

## Desenho Operacional

### Matriz de Testes

A matriz vive em `docs/CI_CD_TESTES.md` e `.planning/TEST_MATRIX.md`. Ela mapeia cada spec aos níveis de teste necessários. Uma spec de produto não deve ser considerada completa sem registrar os níveis executados, os níveis pendentes e a justificativa para validação manual.

### GitHub

O repositório conterá documentação e, quando implementado, workflows/scripts. A configuração que depende da conta GitHub fica como checklist explícito: branch protection, labels de runner, secrets, ambiente `release` e política de segurança de runner self-hosted.

### GSD

O roadmap passa a ter a Spec Zero antes das specs de produto. Requirements e State passam a registrar infraestrutura como requisito, não como lembrete solto.

### Graphify

O Graphify é usado como mapa inicial. Antes de planejar ou implementar mudanças em captura, emulação, conexão, GUI ou protocolo, o agente deve ler `graphify-out/GRAPH_REPORT.md`. Para relações entre módulos, deve preferir `graphify query`, `graphify path` ou `graphify explain` quando a pergunta for sobre acoplamento.

## Riscos E Mitigações

- Runner self-hosted expõe risco de segurança em PR externo: mitigar com workflows manuais, branch protection e política de não executar PR externo não confiável sem revisão.
- VM Omarchy pode divergir com atualizações: mitigar com snapshot/base conhecida e registro de versão.
- Hyprland mínimo não substitui Omarchy real: mitigar separando Nível 2 e Nível 3.
- Graphify pode ficar desatualizado: mitigar verificando commit do grafo e rodando `graphify update .` após mudanças de código.

## Plano De Migração

1. Adicionar Spec Zero e documentação.
2. Atualizar GSD com matriz e dependências.
3. Validar OpenSpec.
4. Em uma próxima mudança de implementação, adicionar scripts/workflows de Nível 1 e workflows opcionais de Nível 2.
5. Configurar GitHub manualmente conforme checklist documentado.
