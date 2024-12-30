return {
  { -- Add linters and formatters
    "nvimtools/none-ls.nvim",
    dependencies = {
      "plenary.nvim",
    },
    lazy = true,
    opts = function(_, opts)
      require("null-ls").setup({
        sources = {
          -- Formatter for vue/javascript
          require("null-ls").builtins.formatting.prettier.with({
            extra_args = { "--line-length=100" },
          }),
          -- Formatter for lua
          require("null-ls").builtins.formatting.stylua.with({
            extra_args = { "--line-length=100" },
          }),
        },
      })
    end,
  },
}
