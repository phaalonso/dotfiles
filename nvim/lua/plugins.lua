local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Is using a standard Neovim install, i.e. built from source or using a
  -- provided appimage.
  use 'lewis6991/impatient.nvim'

  -- Load on an autocommand event
  use {'andymass/vim-matchup', event = 'VimEnter'}

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  use {
    'w0rp/ale',
    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }

  -- Plugins can have post-install/update hooks
  -- use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  -- Post-install/update hook with neovim command
  use {
    'nvim-treesitter/nvim-treesitter',
    event = { "BufRead", "BufNewFile" },
    run = ':TSUpdate'
  }

--  use {
    --'glepnir/galaxyline.nvim', branch = 'main', config = function() require'statusline' end,
    --requires = {'kyazdani42/nvim-web-devicons'}
  --}

  -- Use dependency and run lua function after load
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    -- event = { "CursorMoved", "CursorMovedI" },
    config = function() 
      require('gitsigns').setup()
    end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  use 'folke/tokyonight.nvim'              -- Tokyo night colorscheme

  use "akinsho/nvim-toggleterm.lua"        -- Plugin to easily toggle a terminal
  use "terrortylor/nvim-comment"           -- Comment toggler for Neovim written in Lua
  use "norcalli/nvim-colorizer.lua"        -- Colors highlighter for neovim

  use {                                    -- MAGIC
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Plugins can have post-install/update hooks
  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install', 
    cmd = 'MarkdownPreview'
  }

  use 'rcarriga/nvim-notify'               -- Neovim popup notifications

  use { 'tpope/vim-fugitive' }

  use { 
    'TimUntersberger/neogit',              -- Git integrated
    requires = 'nvim-lua/plenary.nvim' 
  }

  -- Completion
  use {
    {
      "williamboman/nvim-lsp-installer",
      config = function ()
        require('lspinstaller')
      end
    },
    {
        "neovim/nvim-lspconfig",
        after = "nvim-lsp-installer"
    },
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    {
      "hrsh7th/nvim-cmp",
      requires = {
        {
          "KadoBOT/cmp-plugins",
          config = function()
            require("cmp-plugins").setup({
              files = { "*.lua" }  -- default
            })
          end,
        },
      }
    }
  }

  use {
    "folke/which-key.nvim",
    config = function()
      require("whichkey")
    end
  }

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  use "lukas-reineke/indent-blankline.nvim"

  --     ["numToStr/Comment.nvim"] = {
      --module = "Comment",
      --keys = { "gc", "gb" },
      --config = function()
         --require("plugins.configs.others").comment()
      --end,
   --},

end)
