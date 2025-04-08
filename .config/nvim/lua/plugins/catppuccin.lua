-- catppuccin
-- https://github.com/catppuccin/nvim
require('catppuccin').setup({
	flavour = "frappe",
	-- transparent_background = true,
	integrations = {
		mini = {
			enabled = true,
			indentscope_color = "frappe"
		},
		fzf = true,
		indent_blankline = {
			enabled = true,
			scope_color = "frappe",
			colored_indent_levels = false,
		},
		cmp = true,
		treesitter_context = true,
		treesitter = true,
		illuminate = {
			enabled = true,
			lsp = false
		},
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
				ok = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
				ok = { "underline" },
			},
			inlay_hints = {
				background = true,
			},
		},
	}
	,
})
