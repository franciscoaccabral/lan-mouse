## Context

Lan Mouse is a Rust workspace with several interacting crates and OS-specific capture/emulation implementations. The main risk in future work is not lack of code structure, but losing track of backend assumptions, validation limits, and cross-platform caveats.

## Goals / Non-Goals

**Goals:**

- Initialize OpenSpec for spec-driven changes.
- Add GSD planning documents that summarize the existing project without claiming new product scope.
- Capture an evidence-backed initial evaluation of `safishamsi/graphify`.

**Non-Goals:**

- Do not change Rust source code.
- Do not change protocol serialization or bump versions.
- Do not install `graphify` or commit generated graph artifacts in this change.
- Do not claim OS behavior has been manually verified.

## Decisions

- Use OpenSpec as the contract surface for future behavior changes. This matches the requested workflow and gives backend-sensitive requirements a formal review point.
- Use `.planning/` as GSD memory rather than replacing README/DOC. README and DOC remain user-facing; `.planning/` is for execution context.
- Treat `graphify` as promising but not automatically adopted. The project should decide separately whether generated `graphify-out/` files belong in source control.

## Risks / Trade-offs

- Planning files may drift from code -> Mitigation: update `.planning/PROJECT.md` and OpenSpec specs when future changes land.
- OpenSpec adds process overhead -> Mitigation: use it for non-trivial changes and keep tiny fixes scoped.
- Graphify may generate large or noisy artifacts -> Mitigation: trial locally first, review output size and usefulness before committing generated files.

## Migration Plan

1. Commit OpenSpec and `.planning/` bootstrap artifacts.
2. For the first real implementation change, create a focused OpenSpec proposal before editing runtime behavior.
3. Optionally run `graphify` locally and decide whether to keep generated artifacts after reviewing output.

## Open Questions

- Should `graphify-out/graph.json`, `graph.html`, and `GRAPH_REPORT.md` be committed for team-wide use or kept local?
- Should the GSD full interactive `$gsd-new-project` flow be completed with user-selected settings, or is this lightweight bootstrap enough for now?
