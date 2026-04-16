# Starship

[Starship](https://starship.rs) cross-shell prompt with a two-line powerline layout and Catppuccin Mocha rainbow gradient.

Rendered to `~/.config/starship.toml` by chezmoi. For bootstrap and sync workflow see the [repo-level README](../README.md).

## Layout

```
 OS  user  ~/path   branch ±status   Go  Rust  Python   docker   14:32  took 3.2s
❯
```

Line 1 is a colored powerline bar with arrow separators:

**red** (OS + user) → **peach** (directory) → **yellow** (git) → **green** (languages) → **sapphire** (docker/conda) → **lavender** (time + duration)

Line 2 is a clean input line: `❯` (green on success, red on error).

## Segments

| Segment | Color | Shows |
|---------|-------|-------|
| OS | red | macOS, Arch, or distro icon |
| Username | red | Current user |
| Directory | peach | Truncated to 3 levels, emoji substitutions for Documents/Downloads/Music/Pictures/Developer |
| Git branch | yellow | Branch name with  icon |
| Git status | yellow | Ahead/behind, modified, staged, etc. |
| Rust | green | Version when `Cargo.toml` is present |
| Go | green | Version when `go.mod` is present |
| Python | green | Version + virtualenv name |
| Docker context | sapphire | Active Docker context |
| Conda | sapphire | Active conda environment |
| Time | lavender | HH:MM clock |
| Duration | lavender | Command execution time (with ms) |

## Vim mode

| Symbol | Meaning |
|--------|---------|
| `❯` (green) | Normal mode / last command succeeded |
| `❯` (red) | Last command failed |
| `❮` (green) | Vim command mode |
| `❮` (lavender) | Vim replace mode |
| `❮` (yellow) | Vim visual mode |

## Command duration

Shows milliseconds for every timed command. Sends a desktop notification for commands exceeding 45 seconds.

## Palettes

Four Catppuccin palettes are included. Active palette is `catppuccin_mocha`. To switch:

```toml
palette = 'catppuccin_frappe'    # or latte, macchiato, mocha
```

## OS symbols

Icons for 17+ operating systems are defined (macOS, Arch, Ubuntu, Fedora, Debian, etc.). Only the detected OS is shown.
