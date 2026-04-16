# config-gadgets

My personal dotfiles, managed with [chezmoi](https://www.chezmoi.io).

## What's tracked

| Tool | Status | Docs |
|---|---|---|
| **Neovim** | Active | [`dot_config/nvim/README.md`](dot_config/nvim/README.md) |
| **Zellij** | Active | [`dot_config/zellij/README.md`](dot_config/zellij/README.md) |

More configs (shell, terminal emulator, etc.) will land here as they mature. Each tool gets its own `dot_config/<tool>/` directory with its own `README.md`, linked from the table above.

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
├── README.md                   # this file — repo-level index
├── .chezmoiignore              # files chezmoi should not apply to the target
└── dot_config/                 # rendered to ~/.config/ on apply
    ├── nvim/                   # → ~/.config/nvim/
    │   ├── README.md           # nvim-specific documentation
    │   ├── init.lua
    │   └── lua/
    │       ├── config/         # extracted plugin configs
    │       └── plugins/        # plugin spec
    └── zellij/                 # → ~/.config/zellij/
        ├── README.md           # zellij-specific documentation
        ├── config.kdl          # keybinds, theme, options
        ├── layouts/            # dev and claude workflow layouts
        └── plugins/            # zellij-forgot keybind cheatsheet
```

The `dot_` prefix is chezmoi's naming convention — it renders to a leading dot at apply time (`dot_config/` → `~/.config/`). Keeps dotfiles visible in normal `ls` output and editors while still placing them correctly in the target tree.

`.chezmoiignore` uses gitignore-style patterns. Every `README.md` at any depth is ignored, so tool-level docs stay in the repo but never get applied to `~/README.md` or similar.

## License

Personal config. Copy, adapt, and steal ideas freely. No warranty — these are tuned to my machines and will need adjustment for yours.
