return {
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "1.*",
		opts = {
			keymap = {
				preset = "default",
			},
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			signature = {
				enabled = true,
			},
			completion = {
				documentation = {
					auto_show = true,
				},
			},
			sources = {
				default = {
					"lsp",
					"path",
					"snippets",
					"buffer",
					"vimtex",
				},
				providers = {
					vimtex = {
						name = "vimtex",
						module = "blink.compat.source",
						score_offset = 100,
					},
				},
			},
			fuzzy = {
				implementation = "prefer_rust_with_warning",
			},
		},
		opts_extend = {
			"sources.default",
		},
	},
}
