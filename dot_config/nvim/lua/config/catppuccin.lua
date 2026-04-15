require("catppuccin").setup({
    flavour = "mocha",
    background = {light = "latte", dark = "mocha"},
    term_colors = true,
    transparent_background = false,
    dim_inactive = {enabled = true, shade = "dark", percentage = 0.15},
    integrations = {
        cmp = true,
        gitsigns = true,
        mason = true,
        telescope = true,
        which_key = true,
        treesitter = true,
        notify = true,
        noice = true,
        bufferline = true,
        alpha = true,
        dropbar = {enabled = true, color_mode = true},
        rainbow_delimiters = true,
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
