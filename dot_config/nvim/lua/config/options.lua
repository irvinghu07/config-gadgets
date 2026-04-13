vim.g.mapleader = " "
vim.g.maplocalleader = " "

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

vim.o.clipboard = "unnamedplus"

vim.g.clipboard = {
    name = "OSC 52",
    copy = {
        ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
        ["*"] = require("vim.ui.clipboard.osc52").copy("*")
    },
    paste = {
        -- keep paste local to nvim registers; do NOT use osc52 paste in wezterm
        ["+"] = function()
            return {vim.fn.getreg('"'), vim.fn.getregtype('"')}
        end,
        ["*"] = function()
            return {vim.fn.getreg('"'), vim.fn.getregtype('"')}
        end
    }
}
