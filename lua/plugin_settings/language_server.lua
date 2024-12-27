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
	keymap.set("n", "K", ":Lspsaga hove_doc<CR>", opts)
end

language_server.default_setup = function(server_name)
	require("lspconfig")[server_name].setup({
		on_attach = on_attach,
	})
end

language_server.efm = function()
	require("lspconfig").efm.setup({
		on_attach = on_attach,
		filetypes = {
			"lua",
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
		settings = {
			languages = {
				lua = {
					require("efmls-configs.linters.luacheck"),
					require("efmls-configs.formatters.stylua"),
				},
			},
		},
	})
end

language_server.format_on_save = function()
	local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
	vim.api.nvim_create_autocmd("BufWritePost", {
		group = lsp_fmt_group,
		callback = function(ev)
			local efm = vim.lsp.get_clients({
				name = "efm",
				bufnr = ev.buf,
			})

			if vim.tbl_isempty(efm) then
				return
			end

			vim.lsp.buf.format({
				name = "efm",
			})
		end,
	})
end

return language_server
