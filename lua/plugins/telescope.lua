return {
  { -- fuzzy finder
    "nvim-telescope/telescope.nvim",
    tag = '0.1.8',
    dependencies = {
      "plenary.nvim"
    },
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
          },
        },
      },
      pickers = {
        find_files = {
          theme = "dropdown",
          previewer = true,
          hidden = true,
        },
        live_grep = {
          theme = "dropdown",
          previewer = true,
        },
        find_buffers = {
          theme = "dropdown",
          previewer = false,
        },
      },
    }
  }
}
