require('telescope').setup {
  pickers = {
   buffers = {
      initial_mode = 'normal',
    },
    git_files = {
      initial_mode = "normal",
    },
    old_files = {
      initial_mode = "normal",
    },
    commands = {
      initial_mode = "normal",
    },
    search_history = {
      initial_mode = "normal",
    },
    lsp_references = {
      initial_mode = "normal",
    },
    diagnostics = {
      initial_mode = "normal",
    },
    lsp_definitions = {
      initial_mode = "normal",
    },
    git_commits = {
      initial_mode = "normal",
    },
    git_status = {
      initial_mode = "normal",
    },
  },
  extensions = {
    sessions_picker = {
      sessions_dir = vim.fn.stdpath('data') ..'/session/',  -- same as '/home/user/.local/share/nvim/session'
    }
    -- other tele extensions configs
  },
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Find Git Files' })
vim.keymap.set('n', '<leader>lg', builtin.live_grep, { desc = 'FZF Grep' })
vim.keymap.set('n', '<leader>bf', builtin.buffers, { desc = 'Buffers' })

vim.keymap.set('n', '<leader>pf', builtin.oldfiles, { desc = 'Previous Files' })
vim.keymap.set('n', '<leader>cm', builtin.commands, { desc = 'Available Commands' })
vim.keymap.set('n', '<leader>h', builtin.search_history, { desc = 'History' })
vim.keymap.set('n', '<leader>mp', builtin.man_pages, { desc = 'Man Pages' })
vim.keymap.set('n', '<leader>ht', builtin.help_tags, { desc = 'Help Tags' })

vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Git Commits' })
vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = 'Git Branches' })
vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = 'Git Status' })

vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols, { desc = 'Document Symbols' })
vim.keymap.set('n', '<leader>ws', builtin.lsp_dynamic_workspace_symbols, { desc = 'Workspace Symbols' })

require('telescope').load_extension('fzf')
