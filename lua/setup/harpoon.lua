require("harpoon").setup({
    tabline = false,
})

vim.keymap.set('n', '<leader>m', function()
    if vim.bo.filetype ~= 'alpha' then
        vim.cmd('lua require("harpoon.mark").add_file()')
    end
end, {})

vim.keymap.set('n', '<leader>n', ':lua require("harpoon.ui").toggle_quick_menu()<cr>', { silent = true })

for i = 1, 9, 1 do
    vim.keymap.set('n', '<leader>' .. i,
        ':lua require("harpoon.ui").nav_file(' .. i .. ')<cr>', { silent = true })
end

