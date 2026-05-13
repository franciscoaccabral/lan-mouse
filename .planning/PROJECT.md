# Lan Mouse

## What This Is

Lan Mouse is an open-source Rust software KVM that shares mouse and keyboard input across machines on a local network. The workspace includes a GTK frontend, CLI/daemon mode, protocol/IPC crates, and OS-specific input capture and emulation backends for Linux, Windows, and macOS.

## Core Value

Users can move input between local machines reliably without stuck keys, feedback loops, or platform-specific surprises.

## Requirements

### Validated

- Lan Mouse supports a Rust workspace split across capture, emulation, event, IPC, protocol, CLI, GTK, and root application crates.
- Event transport uses UDP while connection requests use TCP on the same port.
- Network traffic is encrypted with the DTLS implementation from WebRTC.rs.
- Backends are selected by OS/features and include Linux, Windows, macOS, and dummy/fallback paths.

### Active

- [ ] Keep future behavior changes traceable through OpenSpec before source edits.
- [ ] Preserve backend-specific validation notes for Linux, Windows, and macOS changes.
- [ ] Evaluate graph-based codebase navigation before adopting generated artifacts.
- [ ] Establish Spec Zero for CI/CD, GitHub, runners, VMs, GSD, and Graphify before product implementation specs.
- [ ] Require every product phase to declare its required test levels before implementation starts.

### Out of Scope

- New runtime features in the bootstrap pass - this change only initializes planning and specification workflow.
- Claims of manual OS validation - backend behavior must be tested on target platforms when touched.

## Context

The core pipeline is `input-capture` -> `lan-mouse-ipc` -> `input-emulation`. `input-event` owns shared event/scancode types, and `lan-mouse-proto` owns protocol serialization. Client activity is mutually exclusive to prevent input feedback loops.

The current checkout is clean on `main` before adding planning artifacts. Public README and DOC already describe user-facing behavior, installation, and architecture-level support. Future changes that touch public APIs, platform support, or protocol serialization should update README.md or DOC.md as appropriate.

## Constraints

- **Rust workspace**: keep crate boundaries aligned with existing capture/emulation/protocol separation.
- **Platform behavior**: OS-specific capture/emulation differs significantly; requirements must name affected targets.
- **Protocol compatibility**: serialization changes require versioning consideration in `lan-mouse-proto`.
- **Async runtime**: use Tokio/futures patterns and avoid blocking in input/event flows.
- **Validation**: use targeted cargo tests for affected crates, then `cargo fmt` and `cargo clippy --workspace --all-targets --all-features` when toolchain dependencies are available.

## Key Decisions

| Decision | Rationale | Outcome |
|----------|-----------|---------|
| Use OpenSpec for non-trivial changes | Backend and protocol changes need explicit requirements and validation notes | Pending |
| Use `.planning/` for GSD memory | Keeps execution context separate from user-facing README/DOC | Pending |
| Use graphify for local codebase navigation | Trial generated a useful Rust graph with 860 nodes and 1,216 edges, plus Codex integration | Good |
| Review before treating graphify-out as canonical | Generated graph files are useful locally but still need source-control policy review | Pending |
| Create a Spec Zero before product specs | Tray, connection, Hyprland/Omarchy, and upstream PR adoption need different validation environments | Accepted |
| Model tests as levels | Prevents CI-only validation from being mistaken for Omarchy/Windows GUI validation | Accepted |

## Spec Zero: Test Environment And CI/CD

The project now treats `validar-ambiente-testes-ci-cd-gsd-graphify` as the first required OpenSpec before the planned product specs. This spec controls:

- test levels from deterministic Rust tests through Omarchy and Windows GUI validation;
- GitHub configuration that cannot be committed as files, including branch protection, runners, labels, secrets, and protected environments;
- GSD planning rules for test dependencies;
- Graphify usage before changes to capture, emulation, connection, GUI, or protocol surfaces.

## Test Levels

| Level | Purpose | Environment |
|-------|---------|-------------|
| 0 | deterministic Rust tests for protocol, config, scancode, modifiers, errors, and dummy backend | GitHub-hosted runners |
| 1 | two local Lan Mouse processes with isolated configs/ports | GitHub-hosted runners when process isolation is implemented |
| 2 | minimal Linux VM with Hyprland | KVM-capable runner or self-hosted runner |
| 3 | real Omarchy VM or machine | dedicated VM/runner, manual or nightly workflow |
| 4 | Windows GUI/tray behavior | Windows interactive environment or manual validation first |

---
*Last updated: 2026-05-13 after Spec Zero planning update.*
