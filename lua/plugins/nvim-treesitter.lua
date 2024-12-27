return {
  { -- adds color to your variables
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = function(_, opts)
      opts.ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "json",
        "javascript",
        "typescript",
        "yaml",
        "html",
        "css",
        "bash",
        "gitignore",
        "python",
        "vue",
      }

      opts.highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
      }

      opts.indent = {
        enable = true,
      }

      opts.auto_install = true

      require("nvim-treesitter.configs").setup(opts)
    end,
  }
}
