local keymap = vim.keymap.set

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", {desc = "Go to left window"})
keymap("n", "<C-l>", "<C-w>l", {desc = "Go to right window"})
keymap("n", "<C-j>", "<C-w>j", {desc = "Go to lower window"})
keymap("n", "<C-k>", "<C-w>k", {desc = "Go to upper window"})

-- Clear search highlight
keymap("n", "<leader>h", ":nohlsearch<CR>",
       {desc = "Clear search highlight", silent = true})

-- Save and quit
keymap("n", "<leader>w", ":w<CR>", {desc = "Save file", silent = true})
keymap("n", "<leader>q", ":q<CR>", {desc = "Quit", silent = true})

-- Oil file explorer
keymap("n", "-", "<CMD>Oil<CR>", {desc = "Open parent directory"})

-- LSP keymaps
keymap("n", "gd", vim.lsp.buf.definition, {desc = "Go to definition"})
keymap("n", "gr", vim.lsp.buf.references, {desc = "Go to references"})
keymap("n", "K", vim.lsp.buf.hover, {desc = "Hover documentation"})
keymap("i", "<C-k>", vim.lsp.buf.signature_help, {desc = "Signature help"})
keymap("n", "<leader>rn", vim.lsp.buf.rename, {desc = "Rename symbol"})
keymap("n", "<leader>ca", vim.lsp.buf.code_action, {desc = "Code action"})
keymap("n", "<leader>e", vim.diagnostic.open_float, {desc = "Show diagnostics"})
keymap("n", "[d", vim.diagnostic.goto_prev, {desc = "Previous diagnostic"})
keymap("n", "]d", vim.diagnostic.goto_next, {desc = "Next diagnostic"})

-- Buffer navigation (bufferline)
keymap("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", {desc = "Prev buffer"})
keymap("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", {desc = "Next buffer"})
keymap("n", "<leader>bp", "<cmd>BufferLineTogglePin<cr>", {desc = "Pin buffer"})
keymap("n", "<leader>bd", "<cmd>bd<cr>", {desc = "Close buffer"})
keymap("n", "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<cr>",
       {desc = "Close unpinned"})

-- TODO navigation
keymap("n", "]t", function() require("todo-comments").jump_next() end,
       {desc = "Next TODO"})
keymap("n", "[t", function() require("todo-comments").jump_prev() end,
       {desc = "Prev TODO"})
keymap("n", "<leader>ft", "<cmd>TodoTelescope<cr>", {desc = "Find TODOs"})

-- Noice
keymap("n", "<leader>nd", "<cmd>NoiceDismiss<cr>",
       {desc = "Dismiss notifications"})
keymap("n", "<leader>nh", "<cmd>NoiceHistory<cr>", {desc = "Message history"})

-- Focus / dim
keymap("n", "<leader>tw", "<cmd>Twilight<cr>", {desc = "Twilight (dim scope)"})
