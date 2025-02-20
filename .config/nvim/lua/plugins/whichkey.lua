return {

  { -- Useful plugin to show you pending keybinds.
    "folke/which-key.nvim",
    event = "VimEnter", -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require("which-key").setup()

      -- Document existing key chains
      require("which-key").add({
        { "<leader>b", group = "Buffer" },
        { "<leader>b_", hidden = true },
        { "<leader>c", group = "Code" },
        { "<leader>c_", hidden = true },
        { "f", group = "Find" },
        { "f_", hidden = true },
        { "<leader>t", group = "Toggle" },
        { "<leader>t_", hidden = true },
        { "<leader>u", group = "UI" },
        { "<leader>u_", hidden = true },
        { "<leader>h", group = "Hop" },
        { "<leader>h_", hidden = true },
        { "<leader>s", group = "Swap" },
        { "<leader>s_", hidden = true },
        { "<leader>r", group = "Rust" },
        { "<leader>r_", hidden = true },
      })
    end,
  },
}
