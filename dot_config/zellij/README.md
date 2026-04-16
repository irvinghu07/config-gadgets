# Zellij

Personal [Zellij](https://zellij.dev) terminal multiplexer config. Keybinds use `clear-defaults=true` — only explicitly listed bindings are active.

Rendered to `~/.config/zellij/` by chezmoi. For bootstrap and sync workflow see the [repo-level README](../../README.md).

## Requirements

- **Zellij ≥ 0.44** — uses inline theme definitions and plugin features from recent versions
- **A Nerd Font** (for compact-bar icons) — e.g. JetBrainsMono Nerd Font
- **WezTerm** (or any terminal with OSC 52 support) — clipboard uses OSC 52, no OS-specific `copy_command`. WezTerm is configured as a [thin host](../../docs/wezterm.md) — Zellij owns all multiplexing (panes, tabs, sessions). WezTerm keybinds are stripped to avoid conflicts.

## Architecture

```
.
├── config.kdl             # main config — keybinds, theme, plugins, options
├── layouts/
│   ├── dev.kdl            # 70/30 vertical split (editor | terminal)
│   └── claude.kdl         # 60/40 split (editor | claude + shell stacked)
└── plugins/
    └── zellij_forgot.wasm # keybind cheatsheet popup (Alt ?)
```

## Theme

Inline theme `"adventure"` — Dracula-inspired palette matched to WezTerm's AdventureTime color scheme (dark purple-blue background `#1f1d45`).

## Modal keybinds

All defaults cleared. Mode entry keys (Ctrl-based):

| Key | Mode | Purpose |
|---|---|---|
| `Ctrl p` | pane | Create, move focus, close, toggle floating |
| `Ctrl t` | tab | Create, navigate, rename, close |
| `Ctrl n` | resize | Resize panes with hjkl / HJKL |
| `Ctrl h` | move | Move panes between positions |
| `Ctrl s` | scroll | Navigate scrollback (vim-style) |
| `Ctrl o` | session | Session manager, plugins |
| `Ctrl b` | tmux | tmux-compatible alternative interface |
| `Ctrl g` | locked | Lock / unlock (only Ctrl g exits) |
| `Ctrl q` | — | Quit |

### Shared bindings (all modes except locked)

| Key | Action |
|---|---|
| `Alt h/j/k/l` or `Alt arrows` | Move focus between panes / tabs |
| `Alt n` | New pane |
| `Alt f` | Toggle floating panes |
| `Alt +/-` | Resize |
| `Alt [/]` | Cycle swap layouts |
| `Alt i/o` | Move tab left / right |
| `Alt ?` | Keybind cheatsheet (zellij-forgot) |

## Active options

| Option | Value | Purpose |
|---|---|---|
| `default_layout` | `"compact"` | Single bottom bar — keybind hints via `Alt ?` instead |
| `serialize_pane_viewport` | `true` | Preserve scrollback across session restarts |
| `scrollback_lines_to_serialize` | `5000` | Cap serialized scrollback |
| `show_startup_tips` | `false` | Skip onboarding tips |
| `show_release_notes` | `false` | Skip release notes popup |

## Layouts

Start a session with a layout:

```bash
zellij --layout dev      # editor + terminal side-by-side
zellij --layout claude   # editor + Claude Code + shell
```

## Plugins

| Plugin | Location | Keybind | Purpose |
|---|---|---|---|
| **zellij-forgot** | `plugins/zellij_forgot.wasm` | `Alt ?` | Floating keybind cheatsheet (auto-discovers bindings from config) |

## Cross-platform notes

This config is shared between macOS and Arch Linux via chezmoi. Everything is OS-agnostic:
- Clipboard: OSC 52 (no `copy_command` — works with any modern terminal)
- Paths: no hardcoded OS-specific paths
- Plugin `.wasm` binaries: platform-independent (WebAssembly)
