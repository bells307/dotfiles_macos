-- mini.files
-- https://github.com/echasnovski/mini.nvim
require('mini.files').setup({
	windows = {
		preview = true,
		width_focus = 30,
		width_preview = 30,
	},
	options = {
		use_as_default_explorer = true,
	},
})

vim.keymap.set('n', '<leader>fm', function()
	require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
end, { desc = "Open mini.files in buffer directory" })


-- mini.surround
-- https://github.com/echasnovski/mini.nvim
require('mini.surround').setup({
	mappings = {
		add = "ma",
		delete = "md",
		find = "mf",
		find_left = "mF",
		highlight = "mh",
		replace = "mr",
		update_n_lines = "mn",
	},
})
