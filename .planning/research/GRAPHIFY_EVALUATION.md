# Graphify Evaluation for Lan Mouse

**Date:** 2026-05-13
**Repository evaluated:** `safishamsi/graphify`
**Decision:** Adopt for local codebase navigation; keep generated artifacts under review before treating them as canonical source.

## Current Evidence

- GitHub repository is active and popular: GitHub showed roughly 47k stars, 5k forks, 98 issues, and 160 pull requests on 2026-05-13.
- Latest GitHub release observed: `v0.7.16`, released on 2026-05-12.
- The README says the official PyPI package is `graphifyy` and the CLI command is `graphify`.
- The README explicitly supports Codex and notes that PowerShell users should run `graphify .`, not `/graphify .`.
- Rust is listed among supported code extraction languages, which fits Lan Mouse.
- The architecture document describes a pipeline of `detect()` -> `extract()` -> `build_graph()` -> `cluster()` -> `analyze()` -> `report()` -> `export()`.
- The security document says code parsing uses tree-sitter and does not execute source code. Optional URL ingest is the network-sensitive surface.

## Fit for This Project

Graphify is a good candidate for Lan Mouse because this codebase has many small Rust crates with cross-cutting behavior: capture, emulation, IPC, protocol, CLI, and GTK surfaces. A graph report may help future agents find relationships that are awkward to recover from filename search alone, especially around backend selection and event routing.

## Adoption Risks

- Generated outputs may be large or noisy for a Rust workspace.
- `graphify-out/` may include generated HTML/JSON that should not be committed until reviewed.
- Docs, PDFs, images, and other non-code extraction can involve model/API use depending on command and options.
- The project is moving quickly; commands and generated formats may drift.

## Recommended Trial

Completed local-only trial:

```powershell
python -m pip install --user graphifyy
& "$env:APPDATA\Python\Python312\Scripts\graphify.exe" update .
& "$env:APPDATA\Python\Python312\Scripts\graphify.exe" codex install
```

Review:

- `graphify-out/GRAPH_REPORT.md` for useful project-level questions and surprising connections.
- `graphify-out/graph.json` size and content.
- `graphify-out/graph.html` usefulness for navigation.

Only after review decide whether to commit:

- `graphify-out/GRAPH_REPORT.md`
- `graphify-out/graph.json`
- `graphify-out/graph.html`

Keep local or ignored unless the output clearly improves team navigation.

## Trial Results

- Installed package: `graphifyy 0.7.16`.
- CLI executable path: `C:\Users\franc\AppData\Roaming\Python\Python312\Scripts\graphify.exe`.
- The Python Scripts directory was added to the user PATH, but this running Codex session may still need the absolute executable path until its environment is reloaded.
- Generated local graph in `graphify-out/`.
- Clean graph after adding `.graphifyignore`: 65 files, about 49,441 words, 860 nodes, 1,216 edges, 62 communities.
- Extraction quality reported by Graphify: 97% extracted, 3% inferred, 0% ambiguous.
- Token benchmark reported about 26.7x fewer tokens per query compared with reading the whole corpus.
- Useful central nodes identified: `Window`, `ClientManager`, `Service`, `Config`, `CaptureTask`, `X11Emulation`.
- Useful focused commands:
  - `graphify explain CaptureTask`
  - `graphify explain EmulationProxy`
  - `graphify explain Service`
  - `graphify path CaptureTask EmulationProxy`
  - `graphify query "How does input capture flow into input emulation in Lan Mouse?" --budget 3000`

## Functional Assessment

Graphify is useful as a navigation accelerator for Lan Mouse. It quickly surfaces central abstractions, method neighborhoods, and approximate cross-module paths such as `CaptureTask -> .handle_capture_event() -> Input -> .consume() -> EmulationProxy`.

Its best use is not replacing source reading. The natural-language `query` mode returns graph traversal evidence rather than a polished architectural explanation, and some inferred edges connect code to documentation concepts such as `DOC.md` `Input`. That is helpful as a map, but final conclusions still need direct source verification.

## Recommendation

Use Graphify at the start of codebase questions and cross-module changes, especially before editing capture, emulation, service, IPC, or GTK surfaces. Keep `.graphifyignore` tracked. Generated `graphify-out/` artifacts are useful enough to keep locally; decide separately whether they should be committed after reviewing repository size and team workflow.
