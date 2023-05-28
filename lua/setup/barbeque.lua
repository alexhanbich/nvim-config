require('barbecue.ui').toggle(true)

vim.api.nvim_create_autocmd('FileType', {
    callback = function ()
        if vim.bo.filetype == 'undotree' or vim.bo.filetype == 'diff' then
            require('barbecue.ui').toggle(true)
        end
end})
