return {
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'tpope/vim-sleuth',
  'nvim-tree/nvim-web-devicons',
  'lukas-reineke/indent-blankline.nvim',
  'mbbill/undotree',
  'Shatur/neovim-session-manager',
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },
  {
    'alexhanbich/harpoon',
    dependencies = {
      'nvim-lua/plenary.nvim'
    }
  },
  {
    'goolord/alpha-nvim',
    config = function()
      require 'alpha'.setup(require 'setup.alpha'.config)
    end
  },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
      "rcarriga/nvim-notify",
    }
  },
  {
    'utilyre/barbecue.nvim',
    name = 'barbecue',
    version = '*',
    dependencies = {
      'SmiteshP/nvim-navic',
      'nvim-tree/nvim-web-devicons', -- optional dependency
    },
    opts = {
      theme = {
        basename = { bold = false }
      },
    },
  },
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = true
  },
  {
    'lewis6991/gitsigns.nvim',
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
