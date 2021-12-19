local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
	execute 'packadd packer.nvim'
end

require('packer').startup(function()
	use 'wbthomason/packer.nvim'

	use {
		"folke/which-key.nvim",
		config = function()
			require("config.whichkey")	  
		end;
	}

	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/vim-vsnip'

	use { 
		{ 
			'neovim/nvim-lspconfig', 
		},
		{
			"folke/trouble.nvim",
			requires = "kyazdani42/nvim-web-devicons",
			config = function() 
				require("trouble").setup {} 
			end
		},
		{ 
			'ray-x/lsp_signature.nvim',
			event = 'InsertEnter *',
			disable = false
		},
		{ 
			'hrsh7th/nvim-cmp', 
			requires = { 
				'neovim/nvim-lspconfig',
				'hrsh7th/cmp-nvim-lsp',
				'hrsh7th/cmp-nvim-lua',
				'hrsh7th/cmp-nvim-lsp-document-symbol',
				'hrsh7th/cmp-path',
				{ 'onsails/lspkind-nvim', config = [[require('config.lspkind')]] },
				{ 'petertriho/cmp-git', requires = 'nvim-lua/plenary.nvim' }
			},
		},
		{ 'folke/lsp-colors.nvim', opt = true, config = [[require('lsp-colors').setup{}]] }
	}

	use {
		'jose-elias-alvarez/nvim-lsp-ts-utils',
		requires = {
			'neovim/nvim-lspconfig',
			'nvim-lua/plenary.nvim',
			'jose-elias-alvarez/null-ls.nvim'
		}
	}

	use 'windwp/nvim-autopairs'
	use 'kyazdani42/nvim-web-devicons'
	use 'tpope/vim-surround'

	-- use 'chr4/nginx.vim'
	-- use 'junegunn/fzf.vim'

	use 'preservim/vimux'

	-- Themes
	use 'shaunsingh/nord.nvim'
	use 'sainnhe/sonokai'
	--use 'joshdick/onedark.vim'
	use 'sainnhe/gruvbox-material'
	use 'olimorris/onedarkpro.nvim'
	use 'mhartington/oceanic-next'
	use 'marko-cerovac/material.nvim'

	use { 'ayu-theme/ayu-vim', option = [[
	--vim.g.ayu_mirage = true
	]] }

	

	-- GIT
	use 'tpope/vim-fugitive'

	use {
		'lewis6991/gitsigns.nvim',
		requires = {
			'nvim-lua/plenary.nvim'
		},
		config = function()
			require('gitsigns').setup()
		end
	}

	use {
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup { }
		end
	}

	use { 'lukas-reineke/indent-blankline.nvim', config = [[require('config.indent')]] }

	use 'mg979/vim-visual-multi'

	use 'christoomey/vim-tmux-navigator'
	use 'voldikss/vim-floaterm'

	use  'editorconfig/editorconfig-vim'

	use 'cohama/lexima.vim'

	use {
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons',
	}

	use {
		'yamatsum/nvim-nonicons',
		requires = {'kyazdani42/nvim-web-devicons'}
	}

	use {
		'glepnir/galaxyline.nvim', 
		config = [[require('config.statusline')]],
		requires = {'kyazdani42/nvim-web-devicons'}
	}

	use {
		'norcalli/nvim-colorizer.lua',
		config = [[require('colorizer').setup{'css', 'javascript', 'typescript', 'vim', 'lua', 'html'}]],
	}

	use {
		'nvim-telescope/telescope.nvim',
		requires = { 
			'nvim-lua/popup.nvim',
			'nvim-lua/plenary.nvim',
		},
		config = [[require('config.telescope')]]
	}

	use {
		'prettier/vim-prettier',
		run = 'yarn install',
		ft = {'javascript', 'typescript', 'css', 'less', 'scss', 'graphql', 'markdown', 'vue', 'html'}
	}

	use { 
		'nvim-treesitter/nvim-treesitter', 
		run = ':TSUpdate' 
	}

	use { 
		'windwp/nvim-ts-autotag', 
		requires = {
			'nvim-treesitter/nvim-treesitter', 
		}
	}

	use { 
		"rcarriga/vim-ultest", 
		requires = {"vim-test/vim-test"}, 
		run = ":UpdateRemotePlugins" 
	}

	use {
		'akinsho/nvim-bufferline.lua',
		requires = 'kyazdani42/nvim-web-devicons',
		config = [[require('config.bufferline')]],
	}

	use { 'b3nj5m1n/kommentary', config = [[require('config.kommentary')]] }

	use {
		'JoosepAlviste/nvim-ts-context-commentstring',
		requires = {
			'nvim-treesitter/nvim-treesitter'
		}
	}

	use 'tpope/vim-eunuch'

	use { 
		{ 
			'tpope/vim-dadbod',
			cmd = { 'DB' },
		},
		{ 
			'kristijanhusak/vim-dadbod-ui',
			require = 'tpope/vim-dadbod',
			cmd = { 'DBUI' },
		}
	}

	use { 
		'dstein64/vim-startuptime', 
		cmd = 'StartupTime', 
		config = [[vim.g.startuptime_tries = 10]] 
	}

	use { 
		'dsznajder/vscode-es7-javascript-react-snippets', 
		run = 'yarn install --frozen-lockfile && yarn compile'
	}

	use {
		'pwntester/octo.nvim', 
		config=function()
			require"octo".setup()
		end
	}

	use 'matze/vim-move'
	use 'tyrannicaltoucan/vim-deep-space'
	use 'AndrewRadev/tagalong.vim'

	use { 'tami5/lspsaga.nvim', config = [[require('config.lspsaga')]] }
	use { 'glepnir/dashboard-nvim', config = [[require('config.dashboard')]] }
end)
