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

vim.api.nvim_create_autocmd('ColorScheme', {
  callback = function()
    clear()
    require("setup.cokeline")
    local color = require("setup.color")
    color.git_color(color)
  end,
})

local iter_theme = {
    "kanagawa",
    "nordic",
    "onenord",
    "everforest",
}

for i = 1, #iter_theme, 1 do
    vim.keymap.set('n', '<leader>b' .. tostring(i), function()
        vim.cmd("colorscheme " .. iter_theme[i])
        clear()
        require("setup.cokeline")
    end)
end
