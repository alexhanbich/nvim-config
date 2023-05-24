return {
  {
    'sainnhe/gruvbox-material',
    priority = 1000,
  },
{
    'sainnhe/sonokai',
    priority = 1000,
  },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
      require('kanagawa').setup({
        theme = "dragon",
        background = {
          dark = "dragon",
          light = "dragon"
        },
      })
    end
  },
  {
    'AlexvZyl/nordic.nvim',
    priority = 1000,
    config = function()
      require 'nordic'.setup {
        telescope = {
          style = 'classic',
        }
      }
    end
  },
  {
    'rmehri01/onenord.nvim',
    priority = 1000,
    config = function()
      require 'onenord'.setup()
    end

  },
  {
    "neanias/everforest-nvim",
    priority = 1000,
    config = function()
      require("everforest").setup({
        background = "hard",
      })
    end

  },
}
