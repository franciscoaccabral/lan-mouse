# Requirements: Lan Mouse Planning Bootstrap

**Defined:** 2026-05-13
**Core Value:** Users can move input between local machines reliably without stuck keys, feedback loops, or platform-specific surprises.

## v1 Requirements

### Governance

- [ ] **GOV-01**: Future non-trivial behavior changes have an OpenSpec proposal before implementation.
- [ ] **GOV-02**: Backend-sensitive changes identify affected OS/backend and verification method.
- [ ] **GOV-03**: README.md or DOC.md is updated when public APIs or platform support change.

### Project Memory

- [ ] **MEM-01**: `.planning/PROJECT.md` captures current project purpose, constraints, and decisions.
- [ ] **MEM-02**: `.planning/STATE.md` points future agents to current focus and canonical context.
- [ ] **MEM-03**: Research notes are stored under `.planning/research/` instead of chat-only conclusions.

### Tooling Evaluation

- [ ] **TOOL-01**: `graphify` is evaluated against Lan Mouse's Rust workspace before adoption.
- [ ] **TOOL-02**: Generated graph artifacts are reviewed for usefulness, size, and commit policy before tracking.

### Test Environment And CI/CD

- [ ] **TEST-00**: Spec Zero defines the official test-level matrix before product specs are implemented.
- [ ] **TEST-01**: Every product spec declares required, recommended, manual, and pending test levels.
- [ ] **TEST-02**: GitHub-only configuration is documented separately from repository-managed workflows and scripts.
- [ ] **TEST-03**: Runner self-hosted usage has explicit labels and a security policy for untrusted PRs.
- [ ] **TEST-04**: Hyprland minimum validation and Omarchy real validation are treated as separate levels.
- [ ] **TEST-05**: Failure artifacts are defined for VM, Omarchy, and Windows GUI validations.

### GSD And Graphify

- [ ] **GSD-01**: `.planning/ROADMAP.md` places Spec Zero before product specs.
- [ ] **GSD-02**: `.planning/STATE.md` tracks infrastructure blockers such as runner, KVM, Omarchy, branch protection, and optional workflows.
- [ ] **GRAPH-01**: Critical changes read `graphify-out/GRAPH_REPORT.md` before code exploration.
- [ ] **GRAPH-02**: Graphify update policy is recorded for post-code-change refresh.

## v2 Requirements

### Codebase Intelligence

- **INTEL-01**: Build and refresh a project knowledge graph as part of regular development if the trial proves useful.
- **INTEL-02**: Add targeted codebase maps for capture, emulation, IPC/protocol, and GTK surfaces.
- **INTEL-03**: Use graph relationships to define validation blast radius for backend, protocol, and GUI changes.

## Out of Scope

| Feature | Reason |
|---------|--------|
| Runtime code changes | Bootstrap only initializes planning/spec workflow |
| OS backend verification | No backend behavior changed in this pass |
| Protocol version changes | No serialization changes were made |

## Traceability

| Requirement | Phase | Status |
|-------------|-------|--------|
| GOV-01 | Phase 1 | Pending |
| GOV-02 | Phase 1 | Pending |
| GOV-03 | Phase 1 | Pending |
| MEM-01 | Phase 1 | Pending |
| MEM-02 | Phase 1 | Pending |
| MEM-03 | Phase 1 | Pending |
| TOOL-01 | Phase 2 | Pending |
| TOOL-02 | Phase 2 | Pending |
| TEST-00 | Phase 0 | In Progress |
| TEST-01 | Phase 0 | Pending |
| TEST-02 | Phase 0 | In Progress |
| TEST-03 | Phase 0 | In Progress |
| TEST-04 | Phase 0 | In Progress |
| TEST-05 | Phase 0 | Pending |
| GSD-01 | Phase 0 | In Progress |
| GSD-02 | Phase 0 | In Progress |
| GRAPH-01 | Phase 0 | In Progress |
| GRAPH-02 | Phase 0 | Pending |

**Coverage:**
- v1 requirements: 18 total
- Mapped to phases: 18
- Unmapped: 0

---
*Requirements defined: 2026-05-13*
*Last updated: 2026-05-13 after Spec Zero planning update.*
