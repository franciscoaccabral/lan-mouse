# GSD State

## Project Reference

See: `.planning/PROJECT.md` (updated 2026-05-13)

**Core value:** Users can move input between local machines reliably without stuck keys, feedback loops, or platform-specific surprises.
**Current focus:** Phase 0: Spec Zero - Test Environment, CI/CD, GSD, And Graphify

## Current Status

- OpenSpec initialized for the repo.
- Codex OpenSpec skills installed under `.codex/skills/`.
- GSD planning baseline created manually because the full interactive `$gsd-new-project` flow requires user configuration choices.
- `graphify` installed from `graphifyy 0.7.16`, Codex integration enabled, and `graphify-out/` generated locally.
- Spec Zero is being added as OpenSpec change `validar-ambiente-testes-ci-cd-gsd-graphify`.
- GitHub owner-side setup is now treated as spec scope, not as an informal follow-up.
- Product specs must declare required test levels before implementation.

## Infrastructure Blockers

- Branch protection needs to be configured in GitHub after jobs are stable.
- Runner self-hosted with labels `self-hosted`, `linux`, `kvm`, `hyprland` is required before reliable Nível 2 validation.
- Label `omarchy` and a snapshot/base known VM are required before Nível 3 can certify Omarchy behavior.
- Windows GUI/tray validation starts manual until a reliable Nível 4 runner/tooling path is chosen.
- Nível 1 two-process validation still needs process/config/IPC isolation before becoming a required CI gate.

## Graphify Rule

Before planning or editing capture, emulation, connection, GUI, or protocol code, read `graphify-out/GRAPH_REPORT.md`. Use `graphify query`, `graphify path`, or `graphify explain` for cross-module relationship questions. After source changes, run `graphify update .` when the tool is available.

## Next Actions

1. Run `openspec validate --all` after Spec Zero artifacts are written.
2. Review `docs/CI_CD_TESTES.md` and configure GitHub branch protection/runners when ready.
3. Implement Nível 1 scripts/tests before making local two-process validation required.
4. Decide whether generated `graphify-out/` files should be committed or kept as local refreshable artifacts.
