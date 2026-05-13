# Roadmap: Lan Mouse Planning Bootstrap

## Phase 0: Spec Zero - Test Environment, CI/CD, GSD, And Graphify

**Goal:** Establish the validation environment contract before implementing product specs.

**Requirements:** TEST-00, TEST-01, TEST-02, TEST-03, TEST-04, TEST-05, GSD-01, GSD-02, GRAPH-01, GRAPH-02

**Success Criteria:**
- OpenSpec change `validar-ambiente-testes-ci-cd-gsd-graphify` exists and validates.
- `docs/CI_CD_TESTES.md` documents test levels and GitHub configuration required from the repository owner.
- `.planning/TEST_MATRIX.md` maps product specs to test levels.
- GSD state identifies infrastructure blockers before product implementation.
- Graphify usage policy is explicit for critical module changes.

**Status:** In Progress

## Phase 1: Planning and Specification Baseline

**Goal:** Establish durable OpenSpec and GSD project context without changing runtime behavior.

**Requirements:** GOV-01, GOV-02, GOV-03, MEM-01, MEM-02, MEM-03

**Success Criteria:**
- OpenSpec is initialized and validates.
- `.planning/` contains project, requirements, roadmap, state, and research surfaces.
- Future agents can identify validation expectations before editing source files.

**Status:** In Progress

## Phase 2: Graph-Based Codebase Navigation Trial

**Goal:** Decide whether `graphify` should become part of the Lan Mouse development workflow.

**Requirements:** TOOL-01, TOOL-02

**Success Criteria:**
- `graphify` is installed in a controlled way or explicitly rejected.
- Generated outputs are reviewed for relevance, size, privacy, and source-control policy.
- Adoption decision is recorded in `.planning/PROJECT.md`.

**Status:** Pending

## Phase 3: First Runtime Change Under Governance

**Goal:** Use the new workflow on the first real bugfix or feature request.

**Requirements:** To be defined by the next OpenSpec proposal.

**Success Criteria:**
- Proposal/spec/tasks exist before implementation for non-trivial work.
- Validation is proportional to touched crates and target OS behavior.
- README.md or DOC.md updates are included when public behavior changes.

**Status:** Pending

## Phase 4: Product Specs Under Spec Zero

**Goal:** Create and execute product specs with explicit test-level dependencies.

**Requirements:** To be defined by the following OpenSpec proposals:
- `simplificar-conexao-e-diagnostico`
- `adicionar-icone-de-bandeja-e-modo-segundo-plano`
- `melhorar-input-windows-para-omarchy-hyprland`
- `adotar-prs-upstream-com-seguranca`

**Success Criteria:**
- Each product spec declares required, recommended, manual, and pending validation levels.
- Spec completion records which levels ran and which were deferred.
- Omarchy/Hyprland support claims are not made without Nível 3 validation.

**Status:** Pending
