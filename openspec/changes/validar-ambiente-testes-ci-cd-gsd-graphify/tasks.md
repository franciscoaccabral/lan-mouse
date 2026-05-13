## 1. OpenSpec

- [x] 1.1 Criar mudança `validar-ambiente-testes-ci-cd-gsd-graphify`.
- [x] 1.2 Escrever `proposal.md` com objetivos, não objetivos e impacto.
- [x] 1.3 Escrever `design.md` com níveis de teste, GitHub, GSD e Graphify.
- [x] 1.4 Escrever spec `test-environment-governance`.

## 2. Documentação Operacional

- [x] 2.1 Criar `docs/CI_CD_TESTES.md`.
- [x] 2.2 Incluir seção "Configuração GitHub Necessária".
- [x] 2.3 Incluir matriz de níveis e responsabilidades.
- [x] 2.4 Documentar segurança de runner self-hosted.
- [x] 2.5 Criar scripts iniciais para Nível 0, prontidão do Nível 1 e coleta de artefatos.
- [x] 2.6 Criar workflow manual `test-environment.yml`.

## 3. GSD

- [x] 3.1 Atualizar `.planning/PROJECT.md` com a Spec Zero e níveis de teste.
- [x] 3.2 Atualizar `.planning/REQUIREMENTS.md` com requisitos de CI/CD, GSD e Graphify.
- [x] 3.3 Atualizar `.planning/ROADMAP.md` colocando a Spec Zero antes das specs de produto.
- [x] 3.4 Atualizar `.planning/STATE.md` com pendências de infraestrutura.
- [x] 3.5 Criar `.planning/TEST_MATRIX.md`.

## 4. Validação

- [x] 4.1 Rodar `openspec validate --all`.
- [x] 4.2 Verificar `git diff --check`.
- [ ] 4.3 Registrar no resumo final qualquer validação que não puder ser executada.

## 5. Próximas Implementações

- [x] 5.1 Implementar o teste real de Nível 1 com dois processos locais.
- [ ] 5.2 Implementar workflow real de Nível 2 para Hyprland VM.
- [ ] 5.3 Configurar GitHub manualmente conforme `docs/CI_CD_TESTES.md`.
- [ ] 5.4 Ativar Nível 3 para Omarchy quando houver runner ou VM real.
