# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

Zellij terminal multiplexer config (`~/.config/zellij/`). Managed by chezmoi for cross-device sync (macOS + Arch Linux) — **nothing can be OS-specific**.

## Structure

- `config.kdl` — main config (KDL format), uses `keybinds clear-defaults=true`
- `layouts/dev.kdl` — vertical 70/30 editor+terminal split
- `layouts/claude.kdl` — 60/40 split with Claude Code + shell stacked on right
- Theme "adventure" defined inline — Dracula-inspired, matched to WezTerm AdventureTime

## Active Options

- `default_layout "compact"` — single bottom compact-bar (use `Alt ?` for keybind hints via zellij-forgot plugin)
- `serialize_pane_viewport true` + `scrollback_lines_to_serialize 5000`
- `show_startup_tips false`, `show_release_notes false`
- Clipboard via OSC 52 (no `copy_command` — cross-platform)

## Modal Keybinds

All defaults cleared. Mode entry keys (Ctrl-based):
- `Ctrl p` pane, `Ctrl t` tab, `Ctrl n` resize, `Ctrl h` move
- `Ctrl s` scroll, `Ctrl o` session, `Ctrl b` tmux
- `Ctrl g` lock/unlock, `Ctrl q` quit

Shared bindings (all modes except locked):
- `Alt h/j/k/l` or `Alt arrows` — focus movement
- `Alt n` new pane, `Alt f` toggle floating, `Alt c` launch Claude Code floating pane
- `Alt +/-` resize, `Alt [/]` cycle layouts, `Alt i/o` move tab

## Editing Guidelines

- KDL syntax: `//` comments, `{ }` blocks, `""` strings
- Check for keybind conflicts across `shared_except` and `shared_among` blocks
- Keybind changes reload live; plugin/path changes need restart
- vim-style hjkl used consistently across all modes
- Keep everything cross-platform (no pbcopy, xclip, OS-specific paths)
