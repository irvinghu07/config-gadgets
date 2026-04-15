local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8

opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true

opt.splitright = true
opt.splitbelow = true

opt.updatetime = 250
opt.timeoutlen = 300

opt.clipboard = "unnamedplus"

opt.completeopt = {"menu", "menuone", "noselect"}

opt.laststatus = 3

opt.showmode = false

opt.pumheight = 10

-- Only install OSC52 clipboard when running over SSH.
-- Locally, let Neovim use the default system clipboard provider.
if vim.env.SSH_TTY or vim.env.SSH_CONNECTION then
    local ok, osc52 = pcall(require, "vim.ui.clipboard.osc52")
    if ok then
        vim.g.clipboard = {
            name = "OSC 52",
            copy = {
                ["+"] = osc52.copy("+"),
                ["*"] = osc52.copy("*"),
            },
            paste = {
                -- keep paste local to nvim registers; do NOT use osc52 paste in wezterm
                ["+"] = function()
                    return { vim.fn.getreg('"'), vim.fn.getregtype('"') }
                end,
                ["*"] = function()
                    return { vim.fn.getreg('"'), vim.fn.getregtype('"') }
                end,
            },
        }
    end
end
