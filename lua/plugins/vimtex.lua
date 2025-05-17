return {
	{
		"lervag/vimtex",
		init = function()
			vim.g.vimtex_view_method = "zathura"
			vim.g.text_flavor = "latex"
			vim.g.vimtex_indent_enabled = 0
			vim.g.vimtex_view_automatic = 1
			vim.g.vimtex_quickfix_open_on_warning = 0
		end,
	},
}
