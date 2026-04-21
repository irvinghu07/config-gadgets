require("lualine").setup({
    options = {
        theme = "catppuccin-nvim",
        globalstatus = true,
        section_separators = {left = "", right = ""},
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
        lualine_x = {
            {
                function() return "󰑋 " .. vim.fn.reg_recording() end,
                cond = function() return vim.fn.reg_recording() ~= "" end,
                color = {fg = "#f38ba8"},
            },
            {
                function()
                    local clients = vim.lsp.get_clients({bufnr = 0})
                    if #clients == 0 then return "" end
                    local names = {}
                    for _, c in ipairs(clients) do
                        table.insert(names, c.name)
                    end
                    return " " .. table.concat(names, ",")
                end,
                cond = function()
                    return #vim.lsp.get_clients({bufnr = 0}) > 0
                end,
            },
            "diagnostics",
            "filetype",
        },
        lualine_y = {"searchcount", "progress"},
        lualine_z = {"location"}
    }
})
