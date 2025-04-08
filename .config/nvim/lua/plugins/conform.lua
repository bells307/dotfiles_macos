-- conform
-- https://github.com/stevearc/conform.nvim
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		go = { "gofmt", "goimports" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})

vim.keymap.set("n", "<leader>cf", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format current buffer" })

vim.api.nvim_create_user_command("Format", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format current buffer" })
