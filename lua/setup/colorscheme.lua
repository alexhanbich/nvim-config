local color = "macchiato"
require("catppuccin").setup({
    flavour = color, -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = color,
        dark = color,
    },
    term_colors = true,
})


vim.cmd("colorscheme catppuccin")

-- change background color
vim.keymap.set('n', '<leader>bg1', function()
    vim.cmd("colorscheme catppuccin-frappe")
    for k in pairs(package.loaded) do
        if k:match("^setup.cokeline") then 
            package.loaded[k] = nil
        end
    end
    require("setup.cokeline")
end)
vim.keymap.set('n', '<leader>bg2', function()
    vim.cmd("colorscheme catppuccin-macchiato")
    for k in pairs(package.loaded) do
        if k:match("^setup.cokeline") then 
            package.loaded[k] = nil
        end
    end
    require("setup.cokeline")
end)
vim.keymap.set('n', '<leader>bg3', function()
    vim.cmd("colorscheme catppuccin-mocha")
    for k in pairs(package.loaded) do
        if k:match("^setup.cokeline") then 
            package.loaded[k] = nil
        end
    end
    require("setup.cokeline")

end)


