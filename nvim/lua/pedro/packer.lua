-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  --use({
  --  'rose-pine/neovim',
  --  as = 'rose-pine',
  --  config = function()
  --	  vim.cmd('colorscheme rose-pine')
  --  end,
  --  })

  use({ 'folke/tokyonight.nvim', as = 'tokyonight' })
  use 'AlexvZyl/nordic.nvim'
  use 'sainnhe/sonokai'
  use {
    "mcchrish/zenbones.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    requires = "rktjmp/lush.nvim"
  }
  use "rebelot/kanagawa.nvim"
  use({ 'projekt0n/github-nvim-theme', tag = 'v0.0.7' })
  --use 'sam4llis/nvim-tundra'

  -- Use dependency and run lua function after load
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    -- event = { "CursorMoved", "CursorMovedI" },
    config = function()
      require('gitsigns').setup()
    end
  }

  use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')

  use('williamboman/mason.nvim')
  use('williamboman/mason-lspconfig.nvim')

  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },

      { 'j-hui/fidget.nvim' },

      { 'onsails/lspkind.nvim' },
      { "folke/neodev.nvim" }
    }
  }

  use("folke/zen-mode.nvim")
  --use("github/copilot.vim")

  use('lukas-reineke/indent-blankline.nvim')

  use('editorconfig/editorconfig-vim')

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    }
  }

  use 'wakatime/vim-wakatime'

  use 'tpope/vim-surround'

  use { "smjonas/inc-rename.nvim", branch = "debug" }

  use { "anuvyklack/windows.nvim",
    requires = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim"
    },
    config = function()
      vim.o.winwidth = 10
      vim.o.winminwidth = 10
      vim.o.equalalways = false
      require('windows').setup()
    end
  }

  use "https://git.sr.ht/~whynothugo/lsp_lines.nvim"

  -- Lua
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end
  }

  use({
    "Pocco81/true-zen.nvim",
    config = function()
      require("true-zen").setup {}
    end,
  })

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use {
    'windwp/nvim-autopairs',
    requires = "hrsh7th/nvim-cmp",
    after = "nvim-cmp",
    config = function()
      --require('pedro.autopairs')
    end
  }

  use {
    'akinsho/bufferline.nvim',
    tag = "v3.*",
    requires = {
      'nvim-tree/nvim-web-devicons',
      'ojroques/nvim-bufdel'
    }
  }

  use { "folke/trouble.nvim", requires = "nvim-tree/nvim-web-devicons" }

  use {
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require 'alpha'.setup(require 'alpha.themes.startify'.config)
    end
  }

  use {
    'RRethy/vim-illuminate',
    config = function()
      require('illuminate').configure()
    end
  }

  use {
    "ThePrimeagen/refactoring.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" }
    }
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use 'jose-elias-alvarez/typescript.nvim'
end)
