local gs = require("gitsigns")

gs.setup({
    on_attach = function(bufnr)
        local function map(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, {buffer = bufnr, desc = desc})
        end

        map("n", "]c", function() gs.nav_hunk("next") end, "Next git hunk")
        map("n", "[c", function() gs.nav_hunk("prev") end, "Prev git hunk")
        map("n", "<leader>gs", gs.stage_hunk, "Stage hunk")
        map("n", "<leader>gr", gs.reset_hunk, "Reset hunk")
        map("n", "<leader>gp", gs.preview_hunk, "Preview hunk")
        map("n", "<leader>gb", function() gs.blame_line({full = true}) end,
            "Blame line")
        map("n", "<leader>gd", gs.diffthis, "Diff this")
    end
})
