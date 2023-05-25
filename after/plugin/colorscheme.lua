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
        end)
end

for i = 1, #iter_sonokai, 1 do
    vim.keymap.set('n', '<leader>b' .. tostring(i) + #iter_theme,
        function()
            vim.g.sonokai_style = iter_sonokai[i]
            vim.cmd("colorscheme sonokai")
        end)
end
