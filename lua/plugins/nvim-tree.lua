return {
  { -- adds file tree to neovim
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-web-devicons",
    },
    opts = {
      filters = {
        dotfiles = false
      }
    },
  }
}
