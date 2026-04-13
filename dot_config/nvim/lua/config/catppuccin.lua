require("catppuccin").setup({
    flavour = "mocha",
    background = {light = "latte", dark = "mocha"},
    term_colors = true,
    transparent_background = false,
    dim_inactive = {enabled = false},
    integrations = {
        cmp = true,
        gitsigns = true,
        mason = true,
        telescope = true,
        which_key = true,
        native_lsp = {
            enabled = true,
            underlines = {
                errors = {"undercurl"},
                hints = {"undercurl"},
                warnings = {"undercurl"},
                information = {"undercurl"}
            }
        }
    }
})

vim.cmd.colorscheme("catppuccin")
