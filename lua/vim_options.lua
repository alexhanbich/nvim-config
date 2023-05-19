-- fat cursor
vim.opt.guicursor = ""

-- search options
vim.o.hlsearch = false
vim.opt.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- line number options
vim.o.relativenumber = true
vim.wo.number = true

-- share OS and vim clipboard
vim.o.clipboard = 'unnamedplus'

-- text options
vim.opt.scrolloff = 8
vim.opt.wrap = false
vim.wo.signcolumn = 'yes'
vim.opt.colorcolumn = "80"
vim.o.termguicolors = true

-- Save undo history
vim.o.undofile = true

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- autocomplete options 
vim.o.completeopt = 'menuone,noselect'

