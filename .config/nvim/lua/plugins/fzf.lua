-- fzf-lua
-- https://github.com/ibhagwan/fzf-lua
local fzf = require("fzf-lua")
fzf.setup({
	fzf_colors = {
		["fg"]      = { "fg", "Normal" },
		["bg"]      = { "bg", "Normal" },
		["hl"]      = { "fg", "Comment" },
		["fg+"]     = { "fg", "Normal" },
		["bg+"]     = { "bg", "CursorLine" },
		["hl+"]     = { "fg", "Function" },
		["info"]    = { "fg", "Type" },
		["prompt"]  = { "fg", "Identifier" },
		["pointer"] = { "fg", "DiagnosticHint" },
		["marker"]  = { "fg", "Keyword" },
		["spinner"] = { "fg", "Label" },
		["header"]  = { "fg", "Comment" },
		["border"]  = { "fg", "FloatBorder" },
	}
})

vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Files" })
vim.keymap.set("n", "<leader>f.", function()
	fzf.files({ cwd = vim.fn.expand("%:p:h") })
end, { desc = "Files (current buffer directory)" })
vim.keymap.set("n", "<leader>fk", fzf.keymaps, { desc = "Keymaps" })
vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "Grep" })
vim.keymap.set("n", "<leader>fh", fzf.helptags, { desc = "Help tags" })
vim.keymap.set("n", "<leader>fo", fzf.oldfiles, { desc = "Old files" })
vim.keymap.set("n", "<leader>fj", fzf.jumps, { desc = "Jumps" })
vim.keymap.set("n", "<leader><leader>", fzf.buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fG", fzf.git_status, { desc = "Git status" })
