## ADDED Requirements

### Requirement: Matriz oficial de níveis de teste
O projeto SHALL manter uma matriz oficial de níveis de teste para classificar validações de mudanças futuras.

#### Scenario: Spec de produto declara validação necessária
- **WHEN** uma spec de produto é proposta
- **THEN** ela declara quais níveis de teste são obrigatórios, recomendados e manuais
- **AND** registra por que cada nível é necessário para o escopo

### Requirement: Configuração GitHub necessária é rastreada
O projeto SHALL documentar como requisito formal toda configuração GitHub que não pode ser aplicada apenas por arquivos do repositório.

#### Scenario: Preparar CI/CD completo
- **WHEN** a Spec Zero é revisada
- **THEN** existe uma seção "Configuração GitHub Necessária"
- **AND** ela lista GitHub Actions, branch protection, jobs obrigatórios, runners, labels, secrets, ambientes protegidos, snapshots e política de segurança

### Requirement: Runners self-hosted têm política de segurança
O projeto SHALL documentar que runner self-hosted não deve executar PR externo não confiável sem revisão.

#### Scenario: Workflow usa runner self-hosted
- **WHEN** um workflow exigir labels `self-hosted`, `linux`, `kvm`, `hyprland` ou `omarchy`
- **THEN** a documentação informa que a execução deve ser manual, protegida ou limitada a código confiável

### Requirement: GSD registra dependências de teste
O projeto SHALL manter o GSD alinhado aos níveis de teste exigidos por cada fase.

#### Scenario: Fase de produto é planejada
- **WHEN** uma fase de produto entra no roadmap
- **THEN** `.planning/` identifica os níveis de teste necessários
- **AND** a fase não é marcada como completa sem registrar níveis executados, pendentes e manuais

### Requirement: Graphify orienta mudanças críticas
O projeto SHALL usar Graphify como mapa técnico antes de mudanças em captura, emulação, conexão, GUI ou protocolo.

#### Scenario: Planejar mudança em módulo crítico
- **WHEN** uma mudança tocar captura, emulação, conexão, GUI ou protocolo
- **THEN** o agente lê `graphify-out/GRAPH_REPORT.md` antes da análise de código
- **AND** usa consultas Graphify quando a pergunta envolver relação entre módulos

### Requirement: Ambientes de VM são separados por fidelidade
O projeto SHALL separar Hyprland mínimo e Omarchy real em níveis distintos de validação.

#### Scenario: Validar comportamento Hyprland e Omarchy
- **WHEN** uma mudança depende de atalhos, bandeja, sessão gráfica ou compositor
- **THEN** Nível 2 valida Hyprland mínimo
- **AND** Nível 3 valida Omarchy real antes de declarar suporte final ao Omarchy

### Requirement: Artefatos de falha são coletados
O projeto SHALL definir artefatos mínimos para diagnosticar falhas de CI/VM.

#### Scenario: Teste de ambiente gráfico falha
- **WHEN** um job de Nível 2, Nível 3 ou Nível 4 falha
- **THEN** os artefatos incluem logs do Lan Mouse, configs usadas, dados de ambiente e saídas relevantes como `hyprctl devices` ou `wev` quando disponíveis
