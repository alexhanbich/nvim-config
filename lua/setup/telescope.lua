require('telescope').setup {
  defaults = {
        layout_config = {
        horizontal = {
            preview_width = 0.6,
            width = 0.9
          },
        },
  },
  pickers = {
   buffers = {
      initial_mode = 'normal',
    },
    old_files = {
      initial_mode = 'normal',
    },
    commands = {
      initial_mode = 'normal',
    },
    search_history = {
      initial_mode = 'normal',
    },
    git_commits = {
      initial_mode = 'normal',
    },
    git_status = {
      initial_mode = 'normal',
    },
    git_branches = {
      initial_mode = 'normal',
    },
  },
  extensions = {
    sessions_picker = {
      sessions_dir = vim.fn.stdpath('data') ..'/session/',  -- same as '/home/user/.local/share/nvim/session'
    }
  },
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Find Git Files' })
vim.keymap.set('n', '<leader>lg', builtin.live_grep, { desc = 'FZF Grep' })

vim.keymap.set('n', '<leader>of', builtin.oldfiles, { desc = 'Old Files' })
vim.keymap.set('n', '<leader>cm', builtin.commands, { desc = 'Available Commands' })
vim.keymap.set('n', '<leader>r', builtin.registers, { desc = 'Registers' })
vim.keymap.set('n', '<leader>sh', builtin.search_history, { desc = 'History' })


require('telescope').load_extension('fzf')
