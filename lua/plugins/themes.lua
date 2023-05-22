return {
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      require('onedark').setup({
        style = "warmer",
      })
    end
  },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
      require('kanagawa').setup({
        theme = "dragon",  -- Load "wave" theme when 'background' option is not set
        background = {
          dark = "dragon", -- try "dragon" !
          light = "dragon"
        },
      })
    end
  },
  { "ellisonleao/gruvbox.nvim", priority = 1000 },
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require 'nordic'.setup {
        telescope = {
          -- Available styles: `classic`, `flat`.
          style = 'classic',
        }
      }
    end
  },
  {
    'rmehri01/onenord.nvim',
    config = function()
      require 'onenord'.setup()
    end
  },
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("everforest").setup({
        background = "hard",
      })
    end,
  },

}
