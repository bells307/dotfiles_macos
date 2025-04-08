require('nvim-treesitter.configs').setup({
	ensure_installed = { "rust", "go" },
	modules = {},
	sync_install = false,
	ignore_install = {},
	auto_install = true,
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<A-o>",
			node_incremental = "<A-o>",
			node_decremental = "<A-i>",
		},
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
			},
			include_surrounding_whitespace = true,
		},
		move = {
			enable = true,
			goto_next_start = {
				["]f"] = "@function.outer",
				["]c"] = "@class.outer",
				["]a"] = "@parameter.inner",
			},
			goto_next_end = {
				["]F"] = "@function.outer",
				["]C"] = "@class.outer",
				["]A"] = "@parameter.inner",
			},
			goto_previous_start = {
				["[f"] = "@function.outer",
				["[c"] = "@class.outer",
				["[a"] = "@parameter.inner",
			},
			goto_previous_end = {
				["[F"] = "@function.outer",
				["[C"] = "@class.outer",
				["[A"] = "@parameter.inner",
			},
		},
		swap = {
			enable = true,
			swap_next = {
				["<leader>sp"] = "@parameter.inner",
				["<leader>sf"] = "@function.outer",
				["<leader>sc"] = "@class.outer",
			},
			swap_previous = {
				["<leader>sP"] = "@parameter.inner",
				["<leader>sF"] = "@function.outer",
				["<leader>sC"] = "@class.outer",
			},
		},
	},
})

require('treesitter-context').setup({
	mode = "cursor",
	max_lines = 3,
})
