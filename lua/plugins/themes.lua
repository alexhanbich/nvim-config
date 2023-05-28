return {
  -- {
  --   'EdenEast/nightfox.nvim',
  --   priority = 1000,
  --   config = function()
  --     require('nightfox').setup {
  --       options = {
  --         transparent = true
  --       }
  --     }
  --   end
  -- },
  { "catppuccin/nvim",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      background = { -- :h background
          light = "mocha",
          dark = "mocha",
      },
      transparent_background = true,
      })
    end
  }
}
