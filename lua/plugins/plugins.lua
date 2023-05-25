return {
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'tpope/vim-sleuth',
  'nvim-tree/nvim-web-devicons',
  "lukas-reineke/indent-blankline.nvim",
  { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
  {
    'alexhanbich/tabline.nvim',
    config = function()
      require 'tabline'.setup {
        enable = false,
        options = {
          section_separators = {'', ''},
          component_separators = {'', ''},
          max_bufferline_percent = 100,
          show_tabs_always = false,
          show_devicons = true,
          show_bufnr = true,
          show_filename_only = true,
          modified_icon = "+ ",
          modified_italic = false,
          show_tabs_only = false,
        }
      }
    end,
    dependencies = { 'nvim-lualine/lualine.nvim', 'nvim-tree/nvim-web-devicons' }
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      theme = {
        basename = { bold = false }
      },
    },
  },
  {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 700
    end,
    opts = {
      -- triggers = "none",
      show_help = false,
      show_keys = false,
    }
  },
  {
    'Shatur/neovim-session-manager',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = true
  },
  {
    'goolord/alpha-nvim',
    config = function()
      require 'alpha'.setup(require 'start_screen'.config)
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    options = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      }
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        component_separators = ' ▏',
        section_separators = '',
      },
    },
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
}
