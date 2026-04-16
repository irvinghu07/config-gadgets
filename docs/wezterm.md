# WezTerm

[WezTerm](https://wezfurlong.org/wezterm/) terminal emulator in **thin host mode** — handles appearance, selection, and OS integration only. All multiplexing (panes, tabs, sessions) is delegated to [Zellij](../dot_config/zellij/README.md).

Rendered to `~/.wezterm.lua` by chezmoi. For bootstrap and sync workflow see the [repo-level README](../README.md).

## Why thin host

WezTerm and Zellij both provide pane/tab management. Running both creates keybind conflicts (`Ctrl+T`, `Ctrl+P`, `Alt+hjkl` all collide). Rather than remapping around each other, WezTerm is stripped down to what only a terminal emulator can do — Zellij handles the rest.

## Appearance

| Setting | Value |
|---------|-------|
| Color scheme | AdventureTime |
| Font | JetBrainsMono Nerd Font (Medium) + Apple Color Emoji fallback |
| Font size | 22 |
| Line height | 1.1, cell width 0.9 |
| Background | 92% opacity + macOS blur (radius 20) |
| Window chrome | `RESIZE` only (no title bar) |
| Cursor | Blinking bar (500ms) |
| Inactive panes | Dimmed (80% saturation, 70% brightness) |
| Tab bar | Bottom, Catppuccin Mocha colors, hidden when single tab |

## Alt/Option key

Left Alt sends escape sequences (required for Zellij `Alt+hjkl`, fzf `Alt+C`, etc.). Right Alt still types special characters (accented letters).

## Quick select

`Cmd+Shift+Space` activates quick select. Built-in patterns highlight:
- Git hashes (7-40 hex chars)
- File paths (with optional `:line` suffix)
- IP addresses (with optional `:port`)
- UUIDs

## Keybindings

All multiplexing keys removed. Remaining bindings:

| Key | Action |
|-----|--------|
| `Cmd+Shift+Space` | Quick select (git hashes, paths, IPs, UUIDs) |
| `Cmd+Shift+X` | Copy mode (vim-style selection) |
| `Cmd+Shift+O` | Quick-select a URL and open in browser |
| `Cmd+Ctrl+F` | Toggle fullscreen |
| `Cmd+=` / `Cmd+-` / `Cmd+0` | Increase / decrease / reset font size |
| `Cmd+Shift+U` / `Cmd+Shift+D` | Scroll up / down half page |
| `Cmd+Click` | Open link under cursor |

## Scrollback

10,000 lines. For longer scrollback, use Zellij's scroll mode (`Ctrl+S`).
