local config = require('session_manager.config')
local session_manager = require('session_manager')
session_manager.setup({
    autoload_mode = config.AutoloadMode.Disabled,
})

local config_group = vim.api.nvim_create_augroup('MyConfigGroup', {})
vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  group = config_group,
  callback = function ()
    if vim.bo.filetype ~= 'git'
      and not vim.bo.filetype ~= 'gitcommit'
      and not vim.bo.filetype ~= 'gitrebase'
      then session_manager.autosave_session() end
  end
})

vim.keymap.set('n', '<leader>ss', ':SessionManager load_last_session<cr>', { desc = 'Last Session', silent = true })
vim.keymap.set('n', '<leader>ls', ':SessionManager load_session<cr>', { desc = 'Load Session', silent = true })
vim.keymap.set('n', '<leader>ds', ':SessionManager delete_session<cr>', { desc = 'Delete Session', silent = true })

