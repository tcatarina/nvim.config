return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		opts = {
			terminal_colors = true,
			transparent_mode = true,
		},
		config = function(_, opts)
			require("gruvbox").setup(opts)
			vim.cmd.colorscheme("gruvbox")

			vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
			vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" })
			vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })

			vim.api.nvim_set_hl(0, "IblIndent", { fg = "#3c3836", bg = "none" })
			vim.api.nvim_set_hl(0, "IblScope", { fg = "#665c54", bg = "none" })
		end,
	},
	-- { -- nvim theme
	-- 	"nyoom-engineering/oxocarbon.nvim",
	-- 	priority = 1000,
	-- 	init = function()
	-- 		vim.opt.background = "dark"
	-- 		vim.cmd.colorscheme("oxocarbon")
	--
	-- 		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- 		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	-- 		vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
	-- 		vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
	-- 		vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" })
	-- 		vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
	-- 		vim.api.nvim_set_hl(0, "IblIndent", { fg = "#3b4048", bg = "none" })
	-- 		vim.api.nvim_set_hl(0, "IblScope", { fg = "#525252", bg = "none" })
	-- 	end,
	-- },
}
