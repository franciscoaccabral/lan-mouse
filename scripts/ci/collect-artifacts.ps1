$ErrorActionPreference = "Stop"

$Out = if ($args.Count -gt 0) { $args[0] } else { "target/ci-artifacts" }
New-Item -ItemType Directory -Force -Path $Out | Out-Null

$envInfo = @(
    "date=$((Get-Date).ToUniversalTime().ToString('yyyy-MM-ddTHH:mm:ssZ'))",
    "os=$([System.Environment]::OSVersion.VersionString)",
    "rustc=$(rustc --version 2>$null)",
    "cargo=$(cargo --version 2>$null)",
    "git_head=$(git rev-parse HEAD 2>$null)",
    "wayland_display=$env:WAYLAND_DISPLAY",
    "xdg_session_type=$env:XDG_SESSION_TYPE",
    "xdg_current_desktop=$env:XDG_CURRENT_DESKTOP"
)

$envInfo | Set-Content -Path (Join-Path $Out "environment.txt") -Encoding UTF8

if (Get-Command graphify -ErrorAction SilentlyContinue) {
    graphify --version *> (Join-Path $Out "graphify-version.txt")
}

Write-Host "Artefatos coletados em: $Out"
