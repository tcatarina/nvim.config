-- Local shorthand for vim.keymap
local keymap = vim.keymap

-- Local options variable
local opts = {
  noremap = true,
  silent = true,
}

-- Directory Navigation
keymap.set("n", "<leader>f", ":NvimTreeFocus<CR>", opts) -- Switch focus to tree
keymap.set("n", "<leader>m", ":NvimTreeToggle<CR>", opts) -- Toggle between opened and closed

-- Pane Navigation
keymap.set("n", "<C-h>", "<C-w>h", opts) -- Navigate left
keymap.set("n", "<C-l>", "<C-w>l", opts) -- Navidate right
keymap.set("n", "<C-j>", "<C-w>j", opts) -- Navidate down
keymap.set("n", "<C-k>", "<C-w>k", opts) -- Navidate up

-- Window Management
keymap.set("n", "<leader>sv", ":vsplit<CR>", opts) -- Split Vertically
keymap.set("n", "<leader>sh", ":split<CR>", opts) -- Split Horizontally
keymap.set("n", "<leader>sm", ':lua require("maximizer").toggle()<CR>', opts) -- Toggle Minimize

-- Reload Nvim
keymap.set("n", "<leader>rr", ":so ~/.config/nvim/init.lua<CR>", {noremap = true})

-- Telescope
keymap.set("n", "<leader>fk", ":Telescope keymaps<CR>", opts)
keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap.set("n", "<leader>fa", ":Telescope<CR>", opts)
keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Indentation
keymap.set("v", ">", ">gv", opts) -- Selects last selected line/block
keymap.set("v", "<", "<gv", opts)

-- Moving blocks/lines in visual mode
keymap.set("v", "J", ":m '>+1<CR> gv=gv", opts)
keymap.set("v", "K", ":m '<-2<CR> gv=gv", opts)

