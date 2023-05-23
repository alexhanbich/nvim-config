local clear = function()
    for k in pairs(package.loaded) do
        if k:match("^setup.cokeline") then
            package.loaded[k] = nil
        end
        if k:match("^setup.color") then
            package.loaded[k] = nil
        end
        if k:match("^setup.git_signs") then
            package.loaded[k] = nil
        end

    end
end


local theme = "everforest"
vim.cmd("colorscheme " .. theme)


local iter_theme = {
    "kanagawa",
    "everforest",
    "nordic",
    "onenord",
}

for i = 1, #iter_theme, 1 do
    vim.keymap.set('n', '<leader>b' .. tostring(i), function()
        vim.cmd("colorscheme " .. iter_theme[i])
        clear()
        require("setup.cokeline")
        require("setup.git_signs")
    end)
end
