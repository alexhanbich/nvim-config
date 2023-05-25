-- diagnostic
vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message', silent = true })
vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message', silent = true })
vim.keymap.set('n', '<leader>df', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message', silent = true })
vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, { desc = 'Open diagnostics list', silent = true })

-- format on save
vim.keymap.set('n', '<leader>w', function()
  vim.cmd("Format")
  vim.cmd("w")
end, { desc = 'Save', silent = true })

-- backspace to nop
vim.keymap.set({ 'n', 'v' }, '<bs>', '<Nop>', { silent = true, remap = false })

-- jump to tabs
for i = 1, 9, 1 do
  local n = tostring(i)
  vim.keymap.set('n', '<leader>' .. n, ':TablineBufferIndex ' .. n .. '<cr>', { silent = true, remap = false })
end



-- highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
