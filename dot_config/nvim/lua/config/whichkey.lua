local wk = require("which-key")

wk.setup({})

wk.add({
    { "<leader>f", group = "Find" },
    { "<leader>g", group = "Git" },
    { "<leader>b", group = "Buffer" },
    { "<leader>n", group = "Noice" },
    { "<leader>t", group = "Toggle" },
})
