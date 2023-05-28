require('notify').setup({
    max_width = 50,
    render = 'compact',
    stages = "static",
    timeout = 3000,
})

vim.keymap.set('n', '<leader>;', function()
    if vim.bo.filetype ~= 'alpha' then
        vim.cmd('Telescope notify')
    end
end, { silent = true })
