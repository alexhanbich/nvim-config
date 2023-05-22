-- set mapleader to space
vim.keymap.set({ 'n', 'v' }, '<space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- install package manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- import plugin specs
require("lazy").setup("plugins")

require("setup")

-- import vim options
require("vim_options")

-- import key mappings
require("remaps")

-- remove GitSigns highlight AFTER colorscheme loads
vim.cmd("highlight GitSignsAdd guibg=NONE")
vim.cmd("highlight GitSignsChange guibg=NONE")
vim.cmd("highlight GitSignsDelete guibg=NONE")


