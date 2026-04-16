# config-gadgets

My personal dotfiles, managed with [chezmoi](https://www.chezmoi.io).

## What's tracked

| Tool | Location | Docs |
|------|----------|------|
| **Neovim** | `dot_config/nvim/` | [`README.md`](dot_config/nvim/README.md) |
| **Zellij** | `dot_config/zellij/` | [`README.md`](dot_config/zellij/README.md) |
| **Starship** | `dot_config/starship.toml` | [`docs/starship.md`](docs/starship.md) |
| **WezTerm** | `dot_wezterm.lua` | [`docs/wezterm.md`](docs/wezterm.md) |
| **Zsh** | `dot_zshrc`, `dot_zshenv`, `dot_zprofile` | [`docs/zsh.md`](docs/zsh.md) |
| **Broot** | `dot_config/broot/` | — |
| **Git** | `dot_config/git/` | — |
| **Direnv** | `dot_config/direnv/` | — |
| **htop** | `dot_config/htop/` | — |

External dependencies (pinned to specific commits via `.chezmoiexternal.toml`):
- **oh-my-zsh** → `~/.oh-my-zsh/`
- **zsh-autosuggestions** → `~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/`

## Prerequisites

Install these before running `chezmoi apply` for the first time:

```bash
# macOS
brew install starship zoxide fzf zsh-syntax-highlighting bat lsd neovim

# Arch
pacman -S starship zoxide fzf zsh-syntax-highlighting bat lsd neovim
```

All shell init is guarded — if a package is missing, that feature is silently skipped instead of breaking the shell.

## Bootstrap on a new machine

One command installs chezmoi, clones this repo, and applies everything:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply irvinghu07/config-gadgets
```

If SSH auth isn't set up on the new box yet, use HTTPS:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply https://github.com/irvinghu07/config-gadgets.git
```

## Pull updates on an existing machine

```bash
chezmoi update
```

Runs `git pull` in the chezmoi source dir and applies any changed files to their target locations. Run `chezmoi status` first if you've been editing configs directly — `chezmoi update` can overwrite local drift otherwise.

## Push local edits back to the repo

```bash
chezmoi re-add                        # sync modified files back to source
chezmoi add <path/to/new/file>        # only for brand-new files
chezmoi status                        # should be empty when clean
cd "$(chezmoi source-path)"
git add .
git commit -m "..."
git push
```

## Updating external dependencies

oh-my-zsh and zsh-autosuggestions are pinned to specific commit archives in `.chezmoiexternal.toml`. To update:

1. Find the latest commit hash on the repo's main branch
2. Replace the hash in the URL in `.chezmoiexternal.toml`
3. Run `chezmoi apply`

## Architecture notes

- **WezTerm** runs as a thin host — appearance, clipboard, and OS integration only. All multiplexing (panes, tabs, sessions) is handled by Zellij. See [docs/wezterm.md](docs/wezterm.md) for rationale.
- **Shell hardening** — every `source`, `eval`, and `.` call in `.zshrc`, `.zshenv`, and `direnvrc` is guarded. The shell starts cleanly on a fresh machine with no optional tools installed.
- **Neovim plugins** are version-locked via `lazy-lock.json` (tracked by chezmoi) for cross-machine reproducibility.

## Layout

```
.
├── README.md
├── .chezmoiignore
├── .chezmoiexternal.toml       # oh-my-zsh + zsh-autosuggestions (pinned archives)
├── docs/                       # tool-specific documentation (repo only, not applied)
│   ├── zsh.md
│   ├── wezterm.md
│   └── starship.md
├── dot_zshrc                   # → ~/.zshrc
├── dot_zshenv                  # → ~/.zshenv
├── dot_zprofile                # → ~/.zprofile
├── dot_wezterm.lua             # → ~/.wezterm.lua
└── dot_config/                 # → ~/.config/
    ├── starship.toml
    ├── nvim/                   # includes lazy-lock.json for plugin pinning
    ├── zellij/
    ├── broot/
    ├── git/
    ├── direnv/
    └── htop/
```

The `dot_` prefix is chezmoi's naming convention — it renders to a leading dot at apply time (`dot_config/` → `~/.config/`).

`.chezmoiignore` uses gitignore-style patterns. `README.md` at any depth is ignored so docs stay in the repo but never get applied to the target tree. The `docs/` directory has no `dot_` prefix, so chezmoi doesn't touch it.

## License

Personal config. Copy, adapt, and steal ideas freely. No warranty — these are tuned to my machines and will need adjustment for yours.
