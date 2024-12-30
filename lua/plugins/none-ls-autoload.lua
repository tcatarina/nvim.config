return {
  {
    "zeioth/none-ls-autoload.nvim",
    lazy = true,
    event = "BufEnter",
    dependencies = {
      "none-ls.nvim",
      "none-ls-external-sources.nvim"
    },
    opts = {
      external_sources = {
        'none-ls-external-sources.diagnostics.luacheck',
        'none-ls-external-sources.diagnostics.eslint',
        'none-ls-external-sources.diagnostics.eslint_d',
      }
    }

  }
}
