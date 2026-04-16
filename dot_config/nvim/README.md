# Neovim

Personal Neovim config built on [lazy.nvim](https://github.com/folke/lazy.nvim). Leader key is `<Space>`.

Rendered to `~/.config/nvim/` by chezmoi. For bootstrap and sync workflow see the [repo-level README](../../README.md).

## Requirements

- **Neovim ≥ 0.11** — the LSP setup uses the new `vim.lsp.config` / `vim.lsp.enable` API
- **A Nerd Font** (icons won't render otherwise) — e.g. JetBrainsMono Nerd Font, Hack Nerd Font
- **`ripgrep` and `fd`** — for Telescope live-grep and find-files
- **Language toolchains** for the LSPs you use (Python, Rust, etc.) — Mason installs the LSP server binaries themselves

## First launch

On first open, lazy.nvim bootstraps itself and installs plugins into `~/.local/share/nvim/lazy/`. Run `:Lazy sync` if any are missing. Mason installs LSP servers on first open of a matching filetype — or run `:Mason` to install them up front. Plugin versions are pinned in `lazy-lock.json`.

## Architecture

```
lua/
├── config/          # extracted plugin configs (one file per non-trivial plugin)
└── plugins/
    └── init.lua     # single plugin registry, wires each plugin to its config file
```

Entry point `init.lua` sets the leader and requires, in order:

1. `config.options` — vim options and clipboard
2. `config.keymaps` — global keymaps (window nav, Telescope, LSP, Oil, save/quit, gitsigns, etc.)
3. `config.lazy` — bootstraps lazy.nvim and imports the plugin spec from `lua/plugins/`

Plugin specs live in a single file: `lua/plugins/init.lua`. Small plugins are configured inline in the spec; larger ones are extracted to `lua/config/<plugin>.lua` and loaded via `config = function() require("config.<plugin>") end`.

## What's in the config

### Theme & UI
- **catppuccin** (mocha) with full plugin integrations and inactive-split dimming
- **lualine** with LSP client indicator, macro recording indicator, search count
- **bufferline** — top tab bar with diagnostics per tab and slant separators
- **oil.nvim** — file explorer (press `-` to open parent directory)
- **alpha-nvim** — startup dashboard
- **noice.nvim** — floating cmdline, prettier LSP hover/signature popups
- **nvim-notify** — animated notification toasts
- **dropbar.nvim** — VS Code-style symbol breadcrumbs in the winbar
- **indent-blankline.nvim (ibl)** — indent guides with scope highlighting
- **rainbow-delimiters.nvim** — colored nested brackets
- **which-key.nvim** — leader-key popup with labeled groups (Find, Git, Buffer, Noice, Toggle)

### LSP, completion, formatting
- **Mason** + **mason-lspconfig** + **nvim-lspconfig**
- **LSP servers:** pyright, ruff (UTF-16 forced to match pyright), rust-analyzer, lua_ls
- **nvim-cmp** + **luasnip** + **friendly-snippets** with snippet-aware Tab / Shift-Tab
- **conform.nvim** — format on save (ruff_format for Python, stylua for Lua, LSP fallback)
- **nvim-autopairs** with treesitter awareness

### Editing power
- **mini.ai** — new text objects (`a,` / `i,` for arguments, `af` / `if` for function calls, `aq` / `iq` for quotes, etc.)
- **mini.surround** — `sa` / `sd` / `sr` for add / delete / replace surround
- **todo-comments.nvim** — TODO / FIXME / NOTE / HACK / WARN highlighting with Telescope search

### Git
- **gitsigns.nvim** — hunks in the gutter, stage / reset / preview / blame without leaving nvim

### Focus
- **twilight.nvim** — scope-based dimming (out-of-scope code rendered at 50% opacity)

### Navigation & search
- **telescope.nvim** (lazy-loaded) — fuzzy find files, live grep, buffers, help tags, TODOs
- **nvim-treesitter** — syntax-aware highlighting and indentation

## Keymap cheat sheet

Press `<leader>` and wait — which-key shows the full tree. Selected highlights:

### Files & navigation
| Key | Action |
|---|---|
| `<leader>ff` | Find files (Telescope) |
| `<leader>fg` | Live grep |
| `<leader>fb` | Find buffers |
| `<leader>fh` | Help tags |
| `<leader>ft` | Find TODOs |
| `-` | Open parent directory (Oil) |

### Buffers (bufferline)
| Key | Action |
|---|---|
| `<S-h>` / `<S-l>` | Previous / next buffer |
| `<leader>bp` | Pin buffer |
| `<leader>bd` | Close buffer |
| `<leader>bP` | Close unpinned buffers |

### LSP
| Key | Action |
|---|---|
| `gd` | Go to definition |
| `gr` | Go to references |
| `K` | Hover documentation |
| `<C-k>` (insert) | Signature help |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>e` | Show diagnostics |
| `[d` / `]d` | Previous / next diagnostic |

### Git (gitsigns)
| Key | Action |
|---|---|
| `]c` / `[c` | Next / previous hunk |
| `<leader>gs` | Stage hunk |
| `<leader>gr` | Reset hunk |
| `<leader>gp` | Preview hunk |
| `<leader>gb` | Blame line |
| `<leader>gd` | Diff this |

### TODO navigation (todo-comments)
| Key | Action |
|---|---|
| `]t` / `[t` | Next / previous TODO |

### Focus & UI
| Key | Action |
|---|---|
| `<leader>tw` | Toggle Twilight (scope dimming) |
| `<leader>;` | Pick breadcrumb symbol (dropbar) |
| `<leader>nd` | Dismiss noice notifications |
| `<leader>nh` | Noice message history |

### Window navigation
| Key | Action |
|---|---|
| `<C-h>` / `<C-l>` / `<C-j>` / `<C-k>` | Navigate splits |

### Save & quit
| Key | Action |
|---|---|
| `<leader>w` | Save |
| `<leader>q` | Quit |
| `<leader>h` | Clear search highlight |

## Common commands

| Command | Purpose |
|---|---|
| `:Lazy` | Plugin manager UI (install / update / clean / sync / profile) |
| `:Lazy sync` | Install missing and update existing plugins |
| `:Mason` | Install / manage LSP servers, linters, formatters |
| `:ConformInfo` | Show conform's state, last run, errors |
| `:LspInfo` | Show attached LSP servers for the current buffer |
| `:checkhealth` | Diagnose Neovim / plugin issues |
| `:TSUpdate` | Update treesitter parsers |

Plugin versions are locked in `lazy-lock.json` — commit it alongside plugin changes for reproducibility.
