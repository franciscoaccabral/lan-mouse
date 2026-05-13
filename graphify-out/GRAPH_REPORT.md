# Graph Report - lan-mouse  (2026-05-13)

## Corpus Check
- 69 files · ~50,745 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 877 nodes · 1229 edges · 65 communities (40 shown, 25 thin omitted)
- Extraction: 97% EXTRACTED · 3% INFERRED · 0% AMBIGUOUS · INFERRED: 36 edges (avg confidence: 0.8)
- Token cost: 0 input · 0 output

## Graph Freshness
- Built from commit: `38578fb1`
- Run `git rev-parse HEAD` and compare to check if the graph is stale.
- Run `graphify update .` after code changes (no API cost).

## Community Hubs (Navigation)
- [[_COMMUNITY_Community 0|Community 0]]
- [[_COMMUNITY_Community 1|Community 1]]
- [[_COMMUNITY_Community 2|Community 2]]
- [[_COMMUNITY_Community 3|Community 3]]
- [[_COMMUNITY_Community 4|Community 4]]
- [[_COMMUNITY_Community 5|Community 5]]
- [[_COMMUNITY_Community 6|Community 6]]
- [[_COMMUNITY_Community 7|Community 7]]
- [[_COMMUNITY_Community 8|Community 8]]
- [[_COMMUNITY_Community 9|Community 9]]
- [[_COMMUNITY_Community 10|Community 10]]
- [[_COMMUNITY_Community 11|Community 11]]
- [[_COMMUNITY_Community 12|Community 12]]
- [[_COMMUNITY_Community 13|Community 13]]
- [[_COMMUNITY_Community 14|Community 14]]
- [[_COMMUNITY_Community 15|Community 15]]
- [[_COMMUNITY_Community 16|Community 16]]
- [[_COMMUNITY_Community 17|Community 17]]
- [[_COMMUNITY_Community 18|Community 18]]
- [[_COMMUNITY_Community 19|Community 19]]
- [[_COMMUNITY_Community 20|Community 20]]
- [[_COMMUNITY_Community 21|Community 21]]
- [[_COMMUNITY_Community 22|Community 22]]
- [[_COMMUNITY_Community 23|Community 23]]
- [[_COMMUNITY_Community 24|Community 24]]
- [[_COMMUNITY_Community 25|Community 25]]
- [[_COMMUNITY_Community 26|Community 26]]
- [[_COMMUNITY_Community 27|Community 27]]
- [[_COMMUNITY_Community 28|Community 28]]
- [[_COMMUNITY_Community 29|Community 29]]
- [[_COMMUNITY_Community 30|Community 30]]
- [[_COMMUNITY_Community 31|Community 31]]
- [[_COMMUNITY_Community 32|Community 32]]
- [[_COMMUNITY_Community 33|Community 33]]
- [[_COMMUNITY_Community 34|Community 34]]
- [[_COMMUNITY_Community 35|Community 35]]
- [[_COMMUNITY_Community 36|Community 36]]
- [[_COMMUNITY_Community 37|Community 37]]
- [[_COMMUNITY_Community 38|Community 38]]
- [[_COMMUNITY_Community 39|Community 39]]
- [[_COMMUNITY_Community 40|Community 40]]
- [[_COMMUNITY_Community 41|Community 41]]
- [[_COMMUNITY_Community 42|Community 42]]
- [[_COMMUNITY_Community 43|Community 43]]
- [[_COMMUNITY_Community 44|Community 44]]
- [[_COMMUNITY_Community 47|Community 47]]
- [[_COMMUNITY_Community 48|Community 48]]
- [[_COMMUNITY_Community 49|Community 49]]
- [[_COMMUNITY_Community 50|Community 50]]
- [[_COMMUNITY_Community 51|Community 51]]
- [[_COMMUNITY_Community 52|Community 52]]
- [[_COMMUNITY_Community 53|Community 53]]
- [[_COMMUNITY_Community 54|Community 54]]

## God Nodes (most connected - your core abstractions)
1. `Window` - 41 edges
2. `ClientManager` - 32 edges
3. `Service` - 32 edges
4. `Config` - 18 edges
5. `ClientRow` - 16 edges
6. `Window` - 14 edges
7. `sel()` - 13 edges
8. `setup()` - 12 edges
9. `CaptureTask` - 12 edges
10. `CI/CD E Testes Do Lan Mouse` - 12 edges

## Surprising Connections (you probably didn't know these)
- `handle_ei_event()` --calls--> `Input`  [INFERRED]
  input-capture/src/libei.rs → DOC.md
- `get_events()` --calls--> `Input`  [INFERRED]
  input-capture/src/macos.rs → DOC.md
- `mouse_proc()` --calls--> `Input`  [INFERRED]
  input-capture/src/windows/event_thread.rs → DOC.md
- `kybrd_proc()` --calls--> `Input`  [INFERRED]
  input-capture/src/windows/event_thread.rs → DOC.md
- `execute()` --calls--> `connect_async()`  [INFERRED]
  lan-mouse-cli/src/lib.rs → lan-mouse-ipc/src/connect_async.rs

## Communities (65 total, 25 thin omitted)

### Community 0 - "Community 0"
Cohesion: 0.04
Nodes (46): Android & IOS, Caveats / Known Issues, code:sh (pacman -S lan-mouse), code:sh (git config core.hooksPath .githooks), code:sh (# Install dependencies), code:sh (sudo apt install libadwaita-1-dev libgtk-4-dev libx11-dev li), code:sh (sudo pacman -S libadwaita gtk libx11 libxtst), code:sh (sudo dnf install libadwaita-devel libXtst-devel libX11-devel) (+38 more)

### Community 2 - "Community 2"
Cohesion: 0.07
Nodes (12): Input, Capture, CaptureRequest, CaptureTask, CaptureType, DropGuard, DropGuard<T>, ICaptureEvent (+4 more)

### Community 3 - "Community 3"
Cohesion: 0.06
Nodes (16): Args, CaptureBackend, Command, Config, ConfigClient, ConfigError, ConfigToml, default_path() (+8 more)

### Community 4 - "Community 4"
Cohesion: 0.11
Nodes (10): draw(), get_edges(), get_output_configuration(), Globals, Inner, LayerShellInputCapture, Output, OutputInfo (+2 more)

### Community 5 - "Community 5"
Cohesion: 0.09
Nodes (20): Barrier, connect_to_eis(), create_session(), distance_to_line(), do_capture(), do_capture_session(), Event, EventIterator (+12 more)

### Community 6 - "Community 6"
Cohesion: 0.15
Nodes (3): Incoming, Service, ServiceError

### Community 7 - "Community 7"
Cohesion: 0.11
Nodes (23): clamp_to_display_bounds(), entered_barrier(), in_bounds(), in_display_region(), is_within_dp_boundary(), is_within_dp_region(), moved_across_boundary(), blocking_send_event() (+15 more)

### Community 8 - "Community 8"
Cohesion: 0.08
Nodes (22): AsyncFrontendEventReader, AsyncFrontendRequestWriter, connect_async(), exponential_back_off(), wait_for_service(), FrontendEventReader, CliArgs, Client (+14 more)

### Community 10 - "Community 10"
Cohesion: 0.09
Nodes (9): DropGuard, DropGuard<T>, Emulation, EmulationEvent, EmulationProxy, EmulationRequest, EmulationTask, ListenTask (+1 more)

### Community 11 - "Community 11"
Cohesion: 0.09
Nodes (8): Backend, Capture, CaptureEvent, create(), create_backend(), Emulation, InputCapture, InputEmulation

### Community 12 - "Community 12"
Cohesion: 0.13
Nodes (11): Bounds, configure_cf_settings(), create_event_tap(), event_tap_thread(), get_events(), InputCaptureState, MacOSInputCapture, ProducerEvent (+3 more)

### Community 13 - "Community 13"
Cohesion: 0.1
Nodes (11): build_ui(), accessibility_granted(), AccessibilityChange, ensure_listed_in_input_monitoring(), fire_initial_prompts(), fire_initial_prompts_inner(), open_accessibility_settings(), open_url() (+3 more)

### Community 14 - "Community 14"
Cohesion: 0.08
Nodes (15): ClientConfig, ClientState, ConnectionError, EventType, FrontendEvent, FrontendRequest, IpcError, IpcListenerCreationError (+7 more)

### Community 15 - "Community 15"
Cohesion: 0.09
Nodes (17): CaptureCreationError, CaptureError, EmulationCreationError, EmulationError, InputCaptureError, InputEmulationError, LayerShellCaptureCreationError, LibeiCaptureCreationError (+9 more)

### Community 16 - "Community 16"
Cohesion: 0.19
Nodes (12): clamp_to_screen_space(), drag_event_type(), get_display_at_point(), get_display_bounds(), key_event(), MacOSEmulation, modifier_event(), request_input_control_permission() (+4 more)

### Community 17 - "Community 17"
Cohesion: 0.28
Nodes (19): class(), delegate_class(), handle_reopen_event(), install_reopen_handler(), load_app_icon(), load_menubar_template(), load_resource_image(), menu() (+11 more)

### Community 18 - "Community 18"
Cohesion: 0.13
Nodes (9): certificate_fingerprint(), Error, generate_fingerprint(), generate_key_and_cert(), load_certificate(), load_or_generate_key_and_cert(), LanMouseListener, ListenerCreationError (+1 more)

### Community 19 - "Community 19"
Cohesion: 0.16
Nodes (4): State, VirtualInput, WlrootsEmulation, XMods

### Community 20 - "Community 20"
Cohesion: 0.23
Nodes (9): key_event(), linux_keycode_to_windows_scancode(), mouse_button(), rel_mouse(), scroll(), send_input_safe(), send_keyboard_input(), send_mouse_input() (+1 more)

### Community 22 - "Community 22"
Cohesion: 0.23
Nodes (11): connect(), connect_any(), connect_to_handle(), disconnect(), exponential_back_off(), FrontendRequestWriter, LanMouseConnection, LanMouseConnectionError (+3 more)

### Community 23 - "Community 23"
Cohesion: 0.22
Nodes (8): Devices, ei_event_handler(), ei_task(), get_ei_fd(), get_token_file_path(), LibeiEmulation, read_token(), write_token()

### Community 24 - "Community 24"
Cohesion: 0.15
Nodes (12): Architecture, Async patterns, code:sh (cargo build --workspace                                    #), Commands, Core principles, Feature & cfg discipline, graphify, Lan Mouse Agent Instructions (+4 more)

### Community 25 - "Community 25"
Cohesion: 0.15
Nodes (12): Artefatos De Falha, CI/CD E Testes Do Lan Mouse, Como Uma Spec Deve Registrar Validação, Configuração GitHub Necessária, Dependência Das Specs De Produto, Estratégia Inicial, Níveis De Teste, O Que Fica No Repositório (+4 more)

### Community 27 - "Community 27"
Cohesion: 0.18
Nodes (10): code:mermaid (graph TD), code:mermaid (sequenceDiagram), Device State - Active and Inactive, Dispatcher, Emitter, Events, General Software Architecture, Problems (+2 more)

### Community 28 - "Community 28"
Cohesion: 0.2
Nodes (4): DnsEvent, DnsRequest, DnsResolver, DnsTask

### Community 34 - "Community 34"
Cohesion: 0.25
Nodes (7): code:bash (nix run github:feschber/lan-mouse), code:nix (inputs = {), code:nix (nixConfig = {), code:nix ({), Home-manager module, Nix Flake Usage, Run

### Community 36 - "Community 36"
Cohesion: 0.29
Nodes (3): Event, KeyboardEvent, PointerEvent

### Community 42 - "Community 42"
Cohesion: 0.67
Nodes (3): do_capture(), run(), TestCaptureArgs

## Knowledge Gaps
- **136 isolated node(s):** `InputCaptureError`, `CaptureError`, `LibeiCaptureCreationError`, `LayerShellCaptureCreationError`, `X11InputCaptureCreationError` (+131 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **25 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `Input` connect `Community 2` to `Community 4`, `Community 5`, `Community 7`, `Community 10`, `Community 12`, `Community 14`, `Community 27`?**
  _High betweenness centrality (0.226) - this node is a cross-community bridge._
- **Why does `build_ui()` connect `Community 13` to `Community 8`, `Community 17`, `Community 7`?**
  _High betweenness centrality (0.164) - this node is a cross-community bridge._
- **What connects `InputCaptureError`, `CaptureError`, `LibeiCaptureCreationError` to the rest of the system?**
  _136 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Community 0` be split into smaller, more focused modules?**
  _Cohesion score 0.04 - nodes in this community are weakly interconnected._
- **Should `Community 1` be split into smaller, more focused modules?**
  _Cohesion score 0.1 - nodes in this community are weakly interconnected._
- **Should `Community 2` be split into smaller, more focused modules?**
  _Cohesion score 0.07 - nodes in this community are weakly interconnected._
- **Should `Community 3` be split into smaller, more focused modules?**
  _Cohesion score 0.06 - nodes in this community are weakly interconnected._