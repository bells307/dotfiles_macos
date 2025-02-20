return {
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "bash-language-server" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bashls = {
          settings = {
            filetypes = { "sh", "zsh" },
          },
        },
      },
    },
  },
}
