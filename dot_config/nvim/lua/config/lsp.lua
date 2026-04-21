local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "pyright", "rust_analyzer" }
})

-- Lua
vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = { checkThirdParty = false }
    }
  }
})

-- Python: type checking / navigation
vim.lsp.config("pyright", {
  capabilities = capabilities,
  settings = { python = { pythonPath = ".venv/bin/python" } }
})

-- Python: linting / formatting with Ruff
-- Force UTF-16 position encoding so Ruff matches Pyright (which only speaks UTF-16).
-- Without this, Neovim warns about mixed encodings on Python buffers.
vim.lsp.config("ruff", {
  capabilities = vim.tbl_deep_extend("force", capabilities, {
    general = { positionEncodings = { "utf-16" } }
  })
})

-- Rust
vim.lsp.config("rust_analyzer", { capabilities = capabilities })

vim.lsp.enable("lua_ls")
vim.lsp.enable("pyright")
vim.lsp.enable("ruff")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable('jsonls')

vim.diagnostic.config({
  update_in_insert = false,
  virtual_text = true,
  signs = true,
  underline = true
})
