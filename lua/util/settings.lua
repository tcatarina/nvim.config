-- Sets the mapleader to the spacebar
vim.g.mapleader = " "

-- Sets the maplocalleader to the \
vim.g.maplocalleader = "\\"

vim.g.node_host_prog = vim.fn.expand("~/.nvm/versions/node/v20.18.3/bin/node")

vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "CursorHold", "CursorHoldI" }, {
	group = vim.api.nvim_create_augroup("AutoReload", { clear = true }),
	callback = function()
		if vim.fn.mode() ~= "c" then
			vim.cmd("checktime")
		end
	end,
	pattern = "*",
})
