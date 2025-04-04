-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  callback = function()
    require("conform").format({ async = true, lsp_fallback = true })
  end,
})
