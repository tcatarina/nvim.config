return {
  { -- bottom line
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-web-devicons'
    },
    opts = {
      options = {
        theme = 'iceberg_dark',
        globalstatus = true,
      },
      sections = {
        lualine_a = {{'buffers'}},
        lualine_x = {{'mode'}},
      }
    }
  }
}
