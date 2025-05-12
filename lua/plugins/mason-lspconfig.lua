-- get table for LS configs
local language_server = require("plugin_settings.language_server")

return {
	{ -- starts the language servers
		"williamboman/mason-lspconfig.nvim",
		lazy = true,
		version = "^1.0.0",
		dependencies = {
			"williamboman/mason.nvim",
		},
		opts = {
			ensure_installed = {
				"lua_ls",
			},
			automatic_installation = true,
			handlers = {
				-- automatically start the language servers
				language_server.default_setup,

				["volar"] = language_server.volar,

				["eslint"] = language_server.eslint,

				["vtsls"] = language_server.vtsls,
			},
		},
	},
}
