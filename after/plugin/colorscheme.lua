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

vim.g.gruvbox_material_background = "medium"

vim.cmd("colorscheme everforest")

local iter_theme = {
    "nordic",
    "onenord",
    "everforest",
    "gruvbox-material",
}

local iter_sonokai = {
    "default",
    "andromeda",
    "shusia",
}


for i = 1, #iter_theme, 1 do
    vim.keymap.set('n', '<leader>b' .. tostring(i),
        function()
            vim.cmd("colorscheme " .. iter_theme[i])
            clear()
            require("setup.cokeline")
        end)
end

for i = 1, #iter_sonokai, 1 do
    vim.keymap.set('n', '<leader>b' .. tostring(i) + #iter_theme,
        function()
            vim.g.sonokai_style = iter_sonokai[i]
            vim.cmd("colorscheme sonokai")
            clear()
            require("setup.cokeline")
        end)
end
