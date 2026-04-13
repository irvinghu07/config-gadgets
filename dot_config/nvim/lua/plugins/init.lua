return {
    -- Dependency
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {"nvim-lua/plenary.nvim"},
        config = function()
            local telescope = require("telescope")

            telescope.setup({
                defaults = {
                    layout_strategy = "horizontal",
                    layout_config = {width = 0.9, height = 0.8}
                }
            })

            -- keymaps
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
            vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
        end
    }, {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
                integrations = {telescope = true}
            })
            vim.cmd.colorscheme("catppuccin")
            vim.opt.termguicolors = true
        end
    },
    {
        "folke/which-key.nvim",
        config = function() require("which-key").setup() end
    }, {
        "stevearc/oil.nvim",
        dependencies = {{"nvim-tree/nvim-web-devicons", opts = {}}},
        config = function() require("oil").setup() end
    }, -- Mason
    {
        "williamboman/mason.nvim",
        config = function() require("mason").setup() end
    }, {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {"williamboman/mason.nvim", "neovim/nvim-lspconfig"}
    }, -- LSP
    {"neovim/nvim-lspconfig", config = function() require("config.lsp") end},

    -- Completion
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip"
        },
        config = function() require("config.cmp") end
    }, {
        "stevearc/conform.nvim",
        event = {"BufWritePre"},
        config = function() require("config.conform") end
    }, {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function() require("config.autopairs") end
    }, {
        "L3MON4D3/LuaSnip",
        dependencies = {"rafamadriz/friendly-snippets"},
        config = function() require("config.luasnip") end
    }, {
        "echasnovski/mini.icons",
        config = function() require("mini.icons").setup() end
    }, {
        "nvim-lualine/lualine.nvim",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function() require("config.lualine") end
    }, {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function() require("config.ibl") end
    }, {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function() require("config.treesitter") end
    }, {"saadparwaiz1/cmp_luasnip"}, {"rafamadriz/friendly-snippets"},
    {"nvim-tree/nvim-web-devicons", lazy = true}
}
