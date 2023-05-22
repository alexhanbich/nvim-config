local config = require('session_manager.config')
require('session_manager').setup({
  autoload_mode = config.AutoloadMode.CurrentDir,
})

vim.keymap.set('n', '<leader>rs', ":SessionManager load_last_session<cr>", { desc = "Reload Last Session", silent = true })

