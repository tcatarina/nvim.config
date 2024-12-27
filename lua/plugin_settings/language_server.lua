local language_server = {}

language_server.default_setup = function(server_name)
	require("lspconfig")[server_name].setup({})
end

language_server.efm = function()
	require("lspconfig").efm.setup({
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
  local lsp_fmt_group = vim.api.nvim_create_augroup('LspFormattingGroup', {})
  vim.api.nvim_create_autocmd('BufWritePost',{
      group = lsp_fmt_group,
      callback = function(ev)
        local efm = vim.lsp.get_clients({
          name = 'efm',
          bufnr = ev.buf
        })

        if vim.tbl_isempty(efm) then
          return
        end

        vim.lsp.buf.format({
          name = 'efm'
        })
      end,
    })
end

return language_server
