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

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", {desc = "Find files"})
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", {desc = "Live grep"})
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", {desc = "Find buffers"})
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", {desc = "Help tags"})

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
