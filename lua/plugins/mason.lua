return {
	{ -- downloads language servers
		"williamboman/mason.nvim",
		lazy = true,
		version = "^1.0.0",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
}
