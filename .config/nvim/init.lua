require("plugman").setup({
	{ "catppuccin/nvim",                             "theme", nil, "catppuccin" },
	{ "neanias/everforest-nvim",                     "theme" },
	{ "folke/tokyonight.nvim",                       "theme" },
	{ "Mofiqul/vscode.nvim",                         "theme" },
	{ "echasnovski/mini.nvim",                       "plugin" },
	{ "ibhagwan/fzf-lua",                            "plugin" },
	{ "stevearc/conform.nvim",                       "plugin" },
	{ "RRethy/vim-illuminate",                       "plugin" },
	{ "gbprod/yanky.nvim",                           "plugin" },
	{ "saecki/crates.nvim",                          "plugin" },
	{ "nvim-tree/nvim-web-devicons",                 "plugin" },
	{ "christoomey/vim-tmux-navigator",              "plugin" },
	{ "nvim-treesitter/nvim-treesitter",             "plugin" },
	{ "nvim-treesitter/nvim-treesitter-textobjects", "plugin" },
	{ "nvim-treesitter/nvim-treesitter-context",     "plugin" },
	{ "windwp/nvim-autopairs",                       "plugin" },
	{ "hrsh7th/nvim-cmp",                            "plugin" },
	{ "hrsh7th/cmp-nvim-lsp",                        "plugin" },
	{ "hrsh7th/cmp-buffer",                          "plugin" },
	{ "hrsh7th/cmp-path",                            "plugin" },
	{ "lukas-reineke/indent-blankline.nvim",         "plugin" },
	{ "tpope/vim-sleuth",                            "plugin" },
	{ "nvim-lualine/lualine.nvim",                   "plugin" },
	{ "yavorski/lualine-macro-recording.nvim",       "plugin" },
	{ "linrongbin16/lsp-progress.nvim",              "plugin" },
	{ "smoka7/hop.nvim",                             "plugin" },
	{ "yetone/avante",                               "plugin" },
	{ "github/copilot.vim",                          "plugin" },
})

require("core.options")
require("core.keymaps")
require("core.lsp")

require("plugins.mini")
require("plugins.fzf")
require("plugins.catppuccin")
-- require("plugins.vscode")
require("plugins.conform")
require("plugins.illuminate")
require("plugins.yanky")
require("plugins.crates")
require("plugins.treesitter")
require("plugins.autopairs")
require("plugins.cmp")
require("plugins.lualine")
require("plugins.indent-blankline")
require("plugins.hop")
