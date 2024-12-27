return {
  { -- nvim theme
    "nyoom-engineering/oxocarbon.nvim",
    priority = 1000,
    init = function()
      vim.opt.background = "dark"
      vim.cmd.colorscheme "oxocarbon"
    end,
  }
}

