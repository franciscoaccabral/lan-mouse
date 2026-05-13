# Test Matrix: Lan Mouse

**Defined:** 2026-05-13

This matrix maps project specs to validation levels. It complements `docs/CI_CD_TESTES.md` and should be updated whenever a product spec changes scope.

## Levels

| Level | Name | Environment | Status |
|-------|------|-------------|--------|
| 0 | Rust deterministic | GitHub-hosted runners | Available through current Rust workflow |
| 1 | Two local processes | GitHub-hosted runners when isolation is implemented | Planned |
| 2 | Linux VM with Hyprland | KVM-capable or self-hosted runner | Planned |
| 3 | Real Omarchy | Dedicated VM or real runner | Planned |
| 4 | Windows GUI/tray | Windows interactive environment | Planned/manual first |

## Product Spec Dependencies

| Spec | Level 0 | Level 1 | Level 2 | Level 3 | Level 4 |
|------|---------|---------|---------|---------|---------|
| `validar-ambiente-testes-ci-cd-gsd-graphify` | Required | Documents readiness | Documents readiness | Documents readiness | Documents readiness |
| `simplificar-conexao-e-diagnostico` | Required | Required | Recommended | Optional for Omarchy certification | Not applicable |
| `adicionar-icone-de-bandeja-e-modo-segundo-plano` | Required | Not applicable | Linux technical coverage | Recommended for Omarchy tray | Required for Windows |
| `melhorar-input-windows-para-omarchy-hyprland` | Required | Recommended | Required | Required before "Omarchy solved" claim | Recommended for Windows-origin input |
| `adotar-prs-upstream-com-seguranca` | Per PR | Per PR | Per PR | Per PR | Per PR |

## Completion Rule

A product phase cannot be marked complete until its verification notes state:

- levels executed;
- levels skipped;
- reason for every skipped level;
- manual evidence collected;
- residual risk.

## Current Gaps

- Nível 1 needs an implementation design for running two local instances without IPC/config collisions.
- Nível 2 needs KVM-capable runner or equivalent VM path.
- Nível 3 needs Omarchy snapshot/base and execution policy.
- Nível 4 needs decision on manual validation versus automation with Windows GUI tooling.
