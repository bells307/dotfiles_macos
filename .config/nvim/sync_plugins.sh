#!/bin/bash

plugs_dir=~/.local/share/nvim/site/pack/plugins/start
mkdir -p $plugs_dir

update_plugin() {
  local repo_url=$1
  local plugin_name=$(basename "$repo_url" .git)
  local plugin_dir=$plugs_dir/$plugin_name

  if [ -d "$plugin_dir" ]; then
	git -C "$plugin_dir" pull
  else
    git clone --depth 1 "$repo_url" "$plugin_dir"
  fi
}

plugins=(
  "https://github.com/catppuccin/nvim"
  "https://github.com/neanias/everforest-nvim"
  "https://github.com/folke/tokyonight.nvim"
  "https://github.com/echasnovski/mini.nvim"
  "https://github.com/ibhagwan/fzf-lua"
  "https://github.com/stevearc/conform.nvim"
  "https://github.com/RRethy/vim-illuminate"
  "https://github.com/gbprod/yanky.nvim"
  "https://github.com/saecki/crates.nvim"
  "https://github.com/nvim-tree/nvim-web-devicons"
  "https://github.com/christoomey/vim-tmux-navigator"
  "https://github.com/nvim-treesitter/nvim-treesitter"
  "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  "https://github.com/nvim-treesitter/nvim-treesitter-context"
  "https://github.com/windwp/nvim-autopairs"
  "https://github.com/hrsh7th/nvim-cmp"
  "https://github.com/hrsh7th/cmp-nvim-lsp"
  "https://github.com/hrsh7th/cmp-buffer"
  "https://github.com/hrsh7th/cmp-path"
  "https://github.com/lukas-reineke/indent-blankline.nvim"
  "https://github.com/tpope/vim-sleuth"
  "https://github.com/nvim-lualine/lualine.nvim"
  "https://github.com/yavorski/lualine-macro-recording.nvim"
  "https://github.com/linrongbin16/lsp-progress.nvim"
  "https://github.com/smoka7/hop.nvim"
)

for plugin in "${plugins[@]}"; do
  update_plugin "$plugin"
done

