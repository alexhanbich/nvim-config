require('oil').setup({
  keymaps = {
    ['<leader>q'] = 'actions.close',
    ["="] = "actions.preview",
  },
  use_default_keymaps = true,
  view_options = {
    show_hidden = true,
  },
  win_options = {
    signcolumn = 'yes'
  },
})

vim.keymap.set('n', '-', require('oil').open, {})
