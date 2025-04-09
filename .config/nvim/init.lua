local plugins = {
	{ "catppuccin/nvim",                             "theme", "catppuccin" },
	{ "neanias/everforest-nvim",                     "theme" },
	{ "folke/tokyonight.nvim",                       "theme" },
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
}

local function sync_plugins()
	local base_dir = vim.fn.stdpath('data') .. '/site/pack/'
	local install_dirs = {
		plugin = base_dir .. 'plugins/start/',
		theme = base_dir .. 'themes/start/',
	}

	local installed = { plugin = {}, theme = {} }
	for type, dir in pairs(install_dirs) do
		local items = vim.fn.readdir(dir)
		if items then
			for _, name in ipairs(items) do
				installed[type][name] = true
			end
		end
	end

	for _, entry in ipairs(plugins) do
		local repo, type, custom_name = unpack(entry)

		if type ~= "plugin" and type ~= "theme" then
			error("invalid type: " .. type)
		end

		if not repo then
			error("invalid repo")
		end

		local name = custom_name or repo:match(".+/(.+)")
		local install_dir = install_dirs[type] .. name

		if vim.fn.isdirectory(install_dir) == 0 then
			vim.fn.system({
				'git', 'clone', '--depth=1',
				'https://github.com/' .. repo .. '.git',
				install_dir
			})
			print('installed: ' .. name)
		else
			vim.fn.system({
				'git', '-C', install_dir, 'pull'
			})
			print('updated: ' .. name)
		end

		installed[type][name] = nil
	end

	for type, plugs in pairs(installed) do
		for plugin_name in pairs(plugs) do
			local install_dir = install_dirs[type] .. plugin_name
			vim.fn.delete(install_dir, 'rf')
			print('removed: ' .. plugin_name)
		end
	end
end

vim.api.nvim_create_user_command('SyncPlugins', sync_plugins, {})

require("core.options")
-- require("core.treesitter")
require("core.lsp")
-- require("core.statusline")
-- require("core.snippet")

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
