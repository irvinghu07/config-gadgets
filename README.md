# config-gadgets

My personal dotfiles, managed with [chezmoi](https://www.chezmoi.io).

## What's tracked

| Tool | Location | Docs |
|------|----------|------|
| **Neovim** | `dot_config/nvim/` | [`README.md`](dot_config/nvim/README.md) |
| **Zellij** | `dot_config/zellij/` | [`README.md`](dot_config/zellij/README.md) |
| **Starship** | `dot_config/starship.toml` | — |
| **WezTerm** | `dot_wezterm.lua` | — |
| **Zsh** | `dot_zshrc`, `dot_zshenv`, `dot_zprofile` | — |
| **Broot** | `dot_config/broot/` | — |
| **Git** | `dot_config/git/` | — |
| **Direnv** | `dot_config/direnv/` | — |
| **htop** | `dot_config/htop/` | — |

External (cloned via `.chezmoiexternal.toml`):
- **oh-my-zsh** → `~/.oh-my-zsh/`
- **zsh-autosuggestions** → `~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/`

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

## Layout

```
.
├── README.md
├── .chezmoiignore
├── .chezmoiexternal.toml       # oh-my-zsh + zsh-autosuggestions
├── dot_zshrc                   # → ~/.zshrc
├── dot_zshenv                  # → ~/.zshenv
├── dot_zprofile                # → ~/.zprofile
├── dot_wezterm.lua             # → ~/.wezterm.lua
└── dot_config/                 # → ~/.config/
    ├── starship.toml
    ├── nvim/
    ├── zellij/
    ├── broot/
    ├── git/
    ├── direnv/
    └── htop/
```

The `dot_` prefix is chezmoi's naming convention — it renders to a leading dot at apply time (`dot_config/` → `~/.config/`).

`.chezmoiignore` uses gitignore-style patterns. `README.md` at any depth is ignored so docs stay in the repo but never get applied to the target tree.

## License

Personal config. Copy, adapt, and steal ideas freely. No warranty — these are tuned to my machines and will need adjustment for yours.
