local scheme = 'nordfox'

local group = {
    'TabLine',
    'TablineFill',
    'Normal',
    'NormalFloat',
}

local spec = require('nightfox.spec').load(scheme)

vim.api.nvim_create_autocmd('ColorScheme', {
    callback = function ()
        for i = 1, #group, 1 do
            vim.api.nvim_set_hl(0, group[i], { bg = 'none' })
        end
    vim.api.nvim_set_hl(0, 'WinSeparator', { fg = '#ffffff' })
    vim.api.nvim_set_hl(0, 'DiffAdd', { fg = spec.git.add })
    vim.api.nvim_set_hl(0, 'DiffChange', { fg = spec.git.changed })
    vim.api.nvim_set_hl(0, 'DiffDelete', { fg = spec.git.removed })
    vim.api.nvim_set_hl(0, 'diffAdded', { fg = spec.git.add })
    vim.api.nvim_set_hl(0, 'diffChanged', { fg = spec.git.changed })
    vim.api.nvim_set_hl(0, 'diffDeleted', { fg = spec.git.removed })
end})

vim.cmd('colorscheme ' .. scheme)
