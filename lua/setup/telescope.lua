require('telescope').setup{
  pickers = {
    find_files = {
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
  }
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = 'Find Files'})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {desc = 'Find Git Files'})
vim.keymap.set('n', '<leader>fs', builtin.live_grep, {desc = 'Search File'})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = 'Search Buffer'})

vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {desc = 'Previous Open Files'})
vim.keymap.set('n', '<leader>fc', builtin.commands, {desc = 'Available Commands'})
vim.keymap.set('n', '<leader>fh', builtin.search_history, {desc = 'View Search History'})
vim.keymap.set('n', '<leader>fm', builtin.man_pages, {desc = 'View Man Pages'})
vim.keymap.set('n', '<leader>ht', builtin.help_tags, {desc = 'Help Tags'})

vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {desc = 'View Word References'})
vim.keymap.set('n', '<leader>fe', builtin.diagnostics, {desc = 'View Diagnostics'})
vim.keymap.set('n', '<leader>fd', builtin.lsp_definitions, {desc = 'View Word Definitins'})

vim.keymap.set('n', '<leader>gc', builtin.git_commits, {desc = 'Show Git Commits'})
vim.keymap.set('n', '<leader>gb', builtin.git_branches, {desc = 'Show Git Branches'})
vim.keymap.set('n', '<leader>gs', builtin.git_status, {desc = 'Show Git Status'})

require('telescope').load_extension('fzf')
