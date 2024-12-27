return {
  { -- downloads language servers
    "williamboman/mason.nvim",
    dependencies = {
      "efmls-configs-nvim"
    },
    lazy = true,
    opts = {
      ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
      },
    },
  }
}