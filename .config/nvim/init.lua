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
	{ "tpope/vim-repeat",                            "plugin" },
	{ "ggandor/leap.nvim",                           "plugin" },
	{ "ggandor/flit.nvim",                           "plugin" },
	{ "smoka7/hop.nvim",                             "plugin" },
	{ "nvim-lua/plenary.nvim",                       "plugin" },
	{ "antoinemadec/FixCursorHold.nvim",             "plugin" },
	{ "nvim-neotest/neotest",                        "plugin" },
	{ "nvim-neotest/nvim-nio",                       "plugin" },
	{ "rouge8/neotest-rust",                         "plugin" },
	{ "mfussenegger/nvim-dap",                       "plugin" },
	{ "rcarriga/nvim-dap-ui",                        "plugin" },
	{ "theHamsta/nvim-dap-virtual-text",             "plugin" },
})

require("core.options")
require("core.keymaps")
require("core.lsp")

if vim.g.vscode then
	require("plugins.hop")
	require("plugins.flit")
	require("plugins.treesitter")
else
	require("plugins.mini")
	require("plugins.fzf")
	require("plugins.catppuccin")
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
	require("plugins.flit")
	require("plugins.neotest")
	require("plugins.dap")
end

vim.cmd.colorscheme("vscode")
