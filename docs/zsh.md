# Zsh

Shell configuration split across three files, each with a distinct role:

| File | Scope | What's in it |
|------|-------|-------------|
| `.zshenv` | Every zsh process (scripts, login, interactive) | Cargo/Rust PATH |
| `.zprofile` | Login shells only | pipx PATH (`~/.local/bin`) |
| `.zshrc` | Interactive shells only | Everything else |

Rendered to `~/` by chezmoi. For bootstrap and sync workflow see the [repo-level README](../README.md).

## Requirements

- **oh-my-zsh** — provisioned by chezmoi via `.chezmoiexternal.toml` (pinned archive)
- **Homebrew packages** (install before first shell):

```bash
brew install starship zoxide fzf zsh-syntax-highlighting bat lsd
```

All tool init is guarded — the shell starts cleanly even if packages are missing.

## What's configured

### Oh My Zsh

Theme is disabled (`ZSH_THEME=""`); [Starship](starship.md) handles the prompt. Plugins: `git` (aliases), `zsh-autosuggestions` (inline completions from history).

### Tool init (guarded)

Loaded in this order, each gated behind `(( $+commands[...] ))` or `[[ -r ... ]]`:

1. **starship** — prompt
2. **zoxide** — `z` / `zi` smart directory jumper (replaces autojump/z.sh)
3. **fzf** — `Ctrl+R` fuzzy history, `Ctrl+T` file picker, `Alt+C` directory jumper
4. **zsh-syntax-highlighting** — commands glow green (valid) or red (invalid) as you type; path probes macOS, Arch, and Ubuntu locations
5. **broot** — `br` shell function for file browsing

### Lazy-loaded tools

These initialize on first use instead of every shell start (~400ms saved):

- **NVM** — triggered by first call to `nvm`, `node`, `npm`, `npx`, `yarn`, or `pnpm`
- **thefuck** — triggered by first call to `fuck`

### Aliases

| Alias | Expands to | Requires |
|-------|-----------|----------|
| `vim` / `vi` | `nvim` | nvim |
| `ls` | `lsd --header` | lsd |
| `ll` | `lsd -la --header` | lsd |
| `lt` | `lsd --tree --depth 3 --header` | lsd |
| `cat` | `bat --plain` | bat |
| `cdd` | `cd ~/Desktop` | — |
| `docu` | `cd ~/Documents` | — |

### fzf

Themed with Catppuccin Mocha colors. Key bindings:

| Key | Action | Preview |
|-----|--------|---------|
| `Ctrl+R` | Fuzzy search shell history | — |
| `Ctrl+T` | Pick a file | bat syntax-highlighted preview |
| `Alt+C` | Jump to a directory | lsd tree preview |

### Hardening

Every `source`, `eval`, and `.` call is guarded. On a fresh machine with no optional tools installed, the shell opens without errors — you just won't have the features until you install the packages.
