## ADDED Requirements

### Requirement: Project context is available to future agents
The project SHALL maintain local planning context that describes Lan Mouse's purpose, architecture, constraints, and validation expectations.

#### Scenario: Agent starts a future change
- **WHEN** an agent prepares a new implementation or review task
- **THEN** the agent can read OpenSpec and `.planning/` artifacts for current project context before editing source files

### Requirement: Behavior changes use OpenSpec proposals
The project SHALL use OpenSpec change artifacts for non-trivial behavior, protocol, backend, or platform-support changes.

#### Scenario: Backend behavior changes
- **WHEN** a change affects input capture or input emulation behavior
- **THEN** the change proposal identifies the affected OS/backend and the corresponding verification approach

### Requirement: Graph-based navigation is evaluated before adoption
The project SHALL record the current-state evaluation and adoption constraints before using `graphify` as a committed navigation artifact.

#### Scenario: Graphify is considered for regular use
- **WHEN** the team decides whether to install or commit graph artifacts
- **THEN** the decision can reference the recorded evaluation, privacy constraints, generated-file policy, and validation plan
