-- get table for LS configs
local language_server = require("plugin_settings.language_server")

          return {
	{ -- starts the language servers
		"williamboman/mason-lspconfig.nvim",
		lazy = true,
		dependencies = {
			"williamboman/mason.nvim",
		},
		opts = {
			ensure_installed = {
				"efm",
				"lua_ls",
			},
			automatic_installation = true,
			handlers = {
				-- automatically start the language servers
				language_server.default_setup,

				-- custom settings for specific language servers
				["efm"] = language_server.efm,

				["volar"] = language_server.volar,

				-- format on save
				language_server.format_on_save(),
			},
		},
	},
}
