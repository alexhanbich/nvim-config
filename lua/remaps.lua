-- diagnostic
vim.keymap.set('n', 'd]', vim.diagnostic.goto_prev, { desc = 'previous diagnostics ', silent = true })
vim.keymap.set('n', 'd[', vim.diagnostic.goto_next, { desc = 'next diagnostics', silent = true })
vim.keymap.set('n', 'd\\', vim.diagnostic.setloclist, { desc = 'Open diagnostics list', silent = true })

-- format and save
vim.keymap.set('n', '<leader>p', function()
  vim.cmd('Format')
  vim.cmd('w')
end, { desc = 'Format & Save', silent = true })

-- save
vim.keymap.set('n', '<leader>w', function()
  vim.cmd('w')
end, { desc = 'Save', silent = true })

-- quit buffer 
vim.keymap.set('n', '<leader>q', function()
  vim.cmd('bd')
end, { silent = true, remap = false })

-- backspace to nop
vim.keymap.set({ 'n', 'v' }, '<BS>', '<NOP>', { silent = true, remap = false })

-- tab to switch between last buffers
vim.keymap.set('n', '<TAB>', '<C-^>', { silent = true })

-- highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
