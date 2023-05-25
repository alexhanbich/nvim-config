require('lualine').setup({
  options = {
    icons_enabled = false,
    component_separators = ' ▏',
    section_separators = '',
  },
  tabline = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { require 'tabline'.tabline_buffers },
    lualine_x = { require 'tabline'.tabline_tabs },
    lualine_y = {},
    lualine_z = {},
  },
})

vim.keymap.set("n", "<tab>", ":bn<cr>", { silent = true })
vim.keymap.set("n", "<S-tab>", ":bp<cr>", { silent = true })
