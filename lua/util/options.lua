-- Declares local shorthand for vim.opt
local opt = vim.opt

-- Set lines to be relative to the cursor
opt.relativenumber = true

-- Autoread the file
opt.autoread = true

-- Show the line number where the cursor is
opt.number = true

-- Set the number of spaces a tab character represents
opt.tabstop = 2

-- Set the number of spaces used for each level of indentation
opt.shiftwidth = 2

-- Set the number of spaces a tab character represents in insert mode
opt.softtabstop = 2

-- Use spaces instead of tabs
opt.expandtab = true

-- Automatically adjusts indentation
opt.smartindent = true

-- Disable line wrapping
opt.wrap = false

-- Highlight characters while searching
opt.incsearch = true

-- Make searches be case insensitive
opt.ignorecase = true

-- Enables more colors in the terminal
opt.termguicolors = true

-- Creates a visual column
opt.colorcolumn = "100"

-- Keeps the sign column visible
opt.signcolumn = "yes"

-- Set the number of lines between the cursor and the edge of the file
opt.scrolloff = 10

-- Configure Menu options
opt.completeopt = "menuone,noinsert,noselect"

-- Switch buffers without saving
opt.hidden = true

-- Disable error sounds
opt.errorbells = false

-- Disable swap files
opt.swapfile = false

-- Disable backup files
opt.backup = false

-- Sets undo file location
opt.undodir = vim.fn.expand("~/.vim/undodir")

-- Enable undo files
opt.undofile = true

-- Enable all backspace features
opt.backspace = "indent,eol,start"

-- Sets where a new window will appear vertically
opt.splitright = true

-- Sets where a new window will appear horizontally
opt.splitbelow = true

-- Disable automatic relative path change
opt.autochdir = false

-- Enable mouse support in all modes
opt.mouse:append("a")

-- Enables vim to interact with the system clipboard
opt.clipboard:append("unnamedplus")

-- Set whether you can edit the buffer
opt.modifiable = true

-- Set the encoding of the file
opt.encoding = "UTF-8"
