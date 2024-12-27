return {
  { -- configures linters and formatters per language
    "creativenull/efmls-configs-nvim",
    lazy = true,
    dependencies = {
      "neovim/nvim-lspconfig"
    },
  }
}
