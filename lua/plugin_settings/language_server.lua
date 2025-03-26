local language_server = {}

local on_attach = function(client, bufnr)
	local opts = {
		noremap = true,
		silent = true,
		buffer = bufnr,
	}

	local keymap = vim.keymap

	keymap.set("n", "<leader>fd", ":Lspsaga finder<CR>", opts)
	keymap.set("n", "<leader>gd", ":Lspsaga peek_definition<CR>", opts)
	keymap.set("n", "<leader>gD", ":Lspsaga goto_definition<CR>", opts)
	keymap.set("n", "<leader>ca", ":Lspsaga code_action<CR>", opts)
	keymap.set("n", "<leader>rn", ":Lspsaga rename<CR>", opts)
	keymap.set("n", "<leader>D", ":Lspsaga show_line_diagnostics<CR>", opts)
	keymap.set("n", "<leader>d", ":Lspsaga show_cursor_diagnostics<CR>", opts)
	keymap.set("n", "<leader>pd", ":Lspsaga diagnostic_jump_prev<CR>", opts)
	keymap.set("n", "<leader>nd", ":Lspsaga diagnostic_jump_next<CR>", opts)
	keymap.set("n", "K", ":Lspsaga hover_doc<CR>", opts)
end

language_server.default_setup = function(server_name)
	require("lspconfig")[server_name].setup({
		on_attach = on_attach,
	})
end

language_server.volar = function()
	require("lspconfig").volar.setup({
		on_attach = on_attach,
		filetypes = { "vue", "javascript" },
		init_options = {
			vue = {
				hybridMode = false,
			},
		},
	})
end

language_server.eslint = function()
	local lspconfig = require("lspconfig")
	local util = require("lspconfig.util")

	-- Get path to global ESLint config
	local global_config = vim.fn.expand("~/.config/nvim/eslint.config.js")

	lspconfig.eslint.setup({
		cmd = { "vscode-eslint-language-server", "--stdio" },

		filetypes = {
			"javascript",
			"javascriptreact",
			"javascript.jsx",
			"typescript",
			"typescriptreact",
			"typescript.tsx",
			"vue",
		},

		-- Modified root_dir function to handle global config
		root_dir = function(fname)
			-- First try to find a local ESLint config
			local local_root = util.root_pattern("eslint.config.js", "eslint.config.mjs", "package.json")(fname)

			-- If no local config found, use the directory of the current file
			-- This allows the global config to be used
			return local_root or vim.fs.dirname(fname)
		end,

		settings = {
			validate = "on",
			experimental = {
				useFlatConfig = true,
			},
			-- Point to the global config file
			codeAction = {
				disableRuleComment = {
					enable = true,
					location = "separateLine",
				},
				showDocumentation = {
					enable = true,
				},
			},
			-- Specify the global config path
			nodePath = "~/.nvm/versions/node/v20.18.3/bin/node",
			workingDirectory = {
				mode = "location",
			},
			-- Important: Tell ESLint where to find the global config
			options = {
				overrideConfigFile = global_config,
			},
		},

		on_init = function(client)
			-- Ensure the global config is loaded
			client.config.settings = client.config.settings or {}
			client.config.settings.eslint = client.config.settings.eslint or {}
			client.config.settings.eslint.options = client.config.settings.eslint.options or {}
			client.config.settings.eslint.options.configFile = global_config

			-- Notify client of configuration
			client.notify("workspace/didChangeConfiguration", {
				settings = client.config.settings,
			})
		end,
	})
end

-- Only enable this if your VUE project uses typescript
-- language_server.ts_ls = function()
-- 	require("lspconfig").ts_ls.setup({
-- 		on_attach = on_attach,
-- 		init_options = {
-- 			plugins = {
-- 				{
-- 					name = "@vue/typescript-plugin",
-- 					location = vim.fn.stdpath("data")
-- 						.. "/mason/packages/vue-language-server/node_modules/@vue/typescript-plugin",
-- 					languages = { "javascript", "typescript", "vue" },
-- 				},
-- 			},
-- 		},
-- 		filetypes = {
-- 			"javascript",
-- 			"typescript",
-- 			"vue",
-- 		},
-- 	})
-- end

return language_server
