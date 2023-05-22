local map = vim.api.nvim_set_keymap

map('n', '<S-Tab>', ':bp<cr>', { silent = false })
map('n', '<Tab>', ':bn<cr>', { silent = true })
vim.keymap.set('n', '<leader>q', function()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.cmd('bn')
  vim.cmd('bd' .. bufnr)
end)

for i = 1, 9 do
  map('n', ('<Leader>%s'):format(i), ('bd %s)'):format(i), { desc = ('Focus Tab #%s'):format(i), silent = true })
end
