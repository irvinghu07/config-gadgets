return {
    -- Dependency
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {"nvim-lua/plenary.nvim"},
        cmd = "Telescope",
        keys = {
            {"<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files"},
            {"<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep"},
            {"<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers"},
            {"<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags"}
        },
        config = function()
            require("telescope").setup({
                defaults = {
                    layout_strategy = "horizontal",
                    layout_config = {width = 0.9, height = 0.8}
                }
            })
        end
    }, {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function() require("config.catppuccin") end
    }, {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function() require("config.whichkey") end
    }, {
        "stevearc/oil.nvim",
        dependencies = {{"nvim-tree/nvim-web-devicons", opts = {}}},
        config = function() require("config.oil") end
    }, -- Mason
    {
        "williamboman/mason.nvim",
        config = function() require("mason").setup() end
    }, {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {"williamboman/mason.nvim"}
    }, -- LSP
    {
        "neovim/nvim-lspconfig",
        dependencies = {"williamboman/mason-lspconfig.nvim"},
        config = function() require("config.lsp") end
    },

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
    }, {"nvim-tree/nvim-web-devicons", lazy = true}, {
        "lewis6991/gitsigns.nvim",
        event = {"BufReadPre", "BufNewFile"},
        config = function() require("config.gitsigns") end
    }, {
        "akinsho/bufferline.nvim",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        event = "VeryLazy",
        config = function() require("config.bufferline") end
    }, {
        "folke/todo-comments.nvim",
        dependencies = {"nvim-lua/plenary.nvim"},
        event = {"BufReadPost", "BufNewFile"},
        config = function() require("config.todocomments") end
    }, {
        "HiPhish/rainbow-delimiters.nvim",
        event = {"BufReadPost", "BufNewFile"}
    }, {"rcarriga/nvim-notify", lazy = true}, {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {"MunifTanjim/nui.nvim", "rcarriga/nvim-notify"},
        config = function() require("config.noice") end
    }, {
        "Bekaboo/dropbar.nvim",
        event = {"BufReadPost", "BufNewFile"},
        config = function() require("config.dropbar") end
    }, {
        "goolord/alpha-nvim",
        event = "VimEnter",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function() require("config.alpha") end
    }, {
        "echasnovski/mini.nvim",
        event = "VeryLazy",
        config = function() require("config.mini") end
    }, {
        "folke/twilight.nvim",
        cmd = "Twilight",
        config = function() require("config.twilight") end
    }
}
