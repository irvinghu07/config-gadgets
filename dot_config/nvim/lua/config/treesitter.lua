require("nvim-treesitter").setup({
    install_dir = vim.fn.stdpath("data") .. "/site"
})

require("nvim-treesitter").install({
    "lua", "vim", "vimdoc", "python", "bash", "markdown", "markdown_inline"
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = {"lua", "vim", "python", "sh", "bash", "markdown"},
    callback = function(event)
        pcall(vim.treesitter.start, event.buf)

        local ft = vim.bo[event.buf].filetype
        if ft ~= "python" and ft ~= "markdown" then
            vim.bo[event.buf].indentexpr =
                "v:lua.require'nvim-treesitter'.indentexpr()"
        end
    end
})
