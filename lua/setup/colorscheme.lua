vim.cmd("colorscheme everforest")

-- change background color
vim.keymap.set('n', '<leader>bg1', function()
    vim.cmd("colorscheme kanagawa")
    for k in pairs(package.loaded) do
        if k:match("^setup.cokeline") then
            package.loaded[k] = nil
        end
    end
    require("setup.cokeline")
end)
vim.keymap.set('n', '<leader>bg2', function()
    vim.cmd("colorscheme everforest")
    for k in pairs(package.loaded) do
        if k:match("^setup.cokeline") then
            package.loaded[k] = nil
        end
    end
    require("setup.cokeline")
end)
vim.keymap.set('n', '<leader>bg3', function()
    vim.cmd("colorscheme nordic")
    for k in pairs(package.loaded) do
        if k:match("^setup.cokeline") then
            package.loaded[k] = nil
        end
    end
    require("setup.cokeline")
end)
vim.keymap.set('n', '<leader>bg4', function()
    vim.cmd("colorscheme onenord")
    for k in pairs(package.loaded) do
        if k:match("^setup.cokeline") then
            package.loaded[k] = nil
        end
    end
    require("setup.cokeline")
end)
