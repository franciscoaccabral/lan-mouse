## Why

Lan Mouse already has meaningful product surface and cross-platform complexity, but this checkout had no local OpenSpec or GSD project memory. Establishing governance now gives future changes a durable place for requirements, backend-specific caveats, validation notes, and project decisions.

## What Changes

- Add OpenSpec context and rules for future Lan Mouse changes.
- Introduce a GSD planning baseline under `.planning/` for project memory, requirements, roadmap, and research notes.
- Record an initial evaluation of `safishamsi/graphify` as a candidate codebase navigation tool.
- No runtime behavior, public API, protocol serialization, or platform support changes are introduced.

## Capabilities

### New Capabilities

- `project-governance`: Defines how this checkout tracks project context, proposed changes, validation expectations, and graph-based navigation artifacts.

### Modified Capabilities

- None.

## Impact

- Affected files: `openspec/config.yaml`, `openspec/changes/bootstrap-project-governance/**`, `.planning/**`.
- Affected systems: planning workflow only.
- Runtime impact: none.
- Documentation impact: project-internal planning docs only; README/DOC updates are not required because no public behavior changed.
