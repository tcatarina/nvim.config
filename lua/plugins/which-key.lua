return {
  { -- maps all possible key combinations
    "folke/which-key.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({global = false})
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
    dependencies = {"mini.nvim"},
  }
}

