require("lualine").setup({
    options = {
        theme = "catppuccin-nvim",
        globalstatus = true,
        section_separators = {left = "", right = ""},
        component_separators = {left = "│", right = "│"},
        disabled_filetypes = {statusline = {"alpha", "dashboard"}}
    },
    sections = {
        lualine_a = {"mode"},
        lualine_b = {"branch", "diff"},
        lualine_c = {
            {
                "filename",
                path = 1,
                symbols = {
                    modified = " [+]",
                    readonly = " [RO]",
                    unnamed = "[No Name]"
                }
            }
        },
        lualine_x = {"diagnostics", "filetype"},
        lualine_y = {"progress"},
        lualine_z = {"location"}
    }
})
