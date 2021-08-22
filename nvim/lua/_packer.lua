local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
	execute 'packadd packer.nvim'
end

-- Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' }

require('packer').startup(function()
	use 'wbthomason/packer.nvim'

	use { 
		{ 
			'neovim/nvim-lspconfig', 
			config = [[require('config._lsp')]] 
		},
		{ 
			'onsails/lspkind-nvim',
			config = [[require('config.lspkind')]],
		},
		{ 
			'hrsh7th/nvim-compe', 
			requires = { 'neovim/nvim-lspconfig' },
			config = [[require('config.compe')]], 
			event = 'InsertEnter *',
		},
		{
			"folke/trouble.nvim",
			requires = "kyazdani42/nvim-web-devicons",
			config = function() 
				require("trouble").setup {} 
				vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>", {silent = true, noremap = true})
			end
		},
		{ 
			'ray-x/lsp_signature.nvim',
			config = function()
				require "lsp_signature".setup {  }
			end,
			event = 'InsertEnter *',
		},
		{
			'kosayoda/nvim-lightbulb',
			config = function() 
				vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
			end
		},
		{ 'folke/lsp-colors.nvim', opt = true, config = [[require('lsp-colors').setup{}]] }
	}

	use 'kyazdani42/nvim-web-devicons'

	use { 
		'jbyuki/venn.nvim', -- Draw ASCII diagramns in Vim
		event = 'InsertEnter *',
	} 

	use 'tpope/vim-surround'
	use 'chr4/nginx.vim'

	--use '/usr/bin/fzf'
	use 'junegunn/fzf.vim'

	use { 
		'heavenshell/vim-jsdoc', 
		ft = { 'js', 'jsx', 'ts', 'tsx' },
		event = 'InsertEnter *',
	}

	use { 
		'windwp/nvim-ts-autotag', 
		ft = { 'js', 'jsx', 'ts', 'tsx', 'html', 'php' }
	}

	use { 'shaunsingh/nord.nvim', opt = true }
	use { 'sainnhe/sonokai', opt = true }
	use { 'joshdick/onedark.vim', opt = true }
	use { 'jacoborus/tender.vim', opt = true }
	use { 'morhetz/gruvbox', opt = true }
	use { 'sainnhe/gruvbox-material', opt = true }
	use { 'mhartington/oceanic-next', opt = true }
	use { 'adrian5/oceanic-next-vim', opt = true }
	use { 'ayu-theme/ayu-vim', opt = true }

	-- GIT
	use { 
		{ 'tpope/vim-fugitive' },
		{
			'junegunn/gv.vim',
			require = 'tpope/vim-fugitive',
			--opt = true,
			cmd = {'GV'}
		},
		{
			'lewis6991/gitsigns.nvim',
			requires = {
				'nvim-lua/plenary.nvim'
			},
			config = function()
				require('gitsigns').setup()
			end
		}
	}

	use {
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup {
			  -- your configuration comes here
			  -- or leave it empty to use the default settings
			  -- refer to the configuration section below
			}
		end
	}

	use {
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup {
				char = '▏',
				buftype_exclude = { "terminal" }

			}
		end
	}

	use {
		'mg979/vim-visual-multi',
		branch = 'master'
	}

	use 'christoomey/vim-tmux-navigator'
	use 'voldikss/vim-floaterm'

	use { 
		'editorconfig/editorconfig-vim',
		event = 'InsertEnter *',
	}

	use { 
		'cohama/lexima.vim' , -- Auto close characters
		event = 'InsertEnter *',
	} 

	use 'mhinz/vim-startify'

	use { 
		'marko-cerovac/material.nvim', 
		config = [[require('config._material')]] 
	}

	use {
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons'
	}

	use {
		'yamatsum/nvim-nonicons',
		requires = {'kyazdani42/nvim-web-devicons'}
	}

	use {
		'glepnir/galaxyline.nvim', 
		branch = 'main', 
		config = [[require('config.statusline')]],
		requires = {'kyazdani42/nvim-web-devicons'}
	}

	-- use {
		--"nvim-telescope/telescope-frecency.nvim",
		--config = function()
			--require"telescope".load_extension("frecency")
			--requires = {"tami5/sql.nvim"}
		--end
	--}
	
	  -- Highlight colors
	use {
		'norcalli/nvim-colorizer.lua',
		ft = { 'css', 'javascript', 'vim', 'html' },
		config = [[require('colorizer').setup {'css', 'javascript', 'vim', 'lua', 'html'}]],
	}

	use 
	{
		'nvim-telescope/telescope.nvim',
		requires = { 
			'nvim-lua/popup.nvim',
			'nvim-lua/plenary.nvim',
		},
		config = [[require('config._telescope')]]
	}

	use {
        'prettier/vim-prettier',
        run = 'yarn install',
        ft = {'javascript', 'typescript', 'css', 'less', 'scss', 'graphql', 'markdown', 'vue', 'html'}
    }

	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use { "rcarriga/vim-ultest", requires = {"vim-test/vim-test"}, run = ":UpdateRemotePlugins" }

	use { 
		'dart-lang/dart-vim-plugin',
		disable = true
	}

	use { 
		'thosakwe/vim-flutter',
		disable = true,
		require = 'dart-lang/dart-vim-plugin'
	}

	use {
		'akinsho/flutter-tools.nvim', 
		requires = { 
			'neovim/nvim-lspconfig',
			'nvim-lua/plenary.nvim',
		},
		ft = { 'dart' }
	}

	use { 
		'mhartington/formatter.nvim',
		config = [[require('config._formatter')]],
		cmd = { 'Format' }
	}

	use {
		'akinsho/nvim-bufferline.lua',
		requires = 'kyazdani42/nvim-web-devicons',
		config = [[require('config.bufferline')]],
	}

	use { 'vimwiki/vimwiki', ft = { 'md' } }

	use 'preservim/nerdcommenter'

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
		'leafgarland/typescript-vim',
		ft = { 'js', 'jsx', 'ts', 'tsx' },
		disabled = true,
	}
	use { 
		'peitalin/vim-jsx-typescript',
		ft = { 'js', 'jsx', 'ts', 'tsx' },
		require = 'leafgarland/typescript-vim',
		disabled = true,
	}

	use { 
		'styled-components/vim-styled-components', 
		ft = { 'js', 'jsx', 'ts', 'tsx' },
		disabled = true,
	}

	use { 
		{
			'hrsh7th/vim-vsnip',
			event = 'InsertEnter *',
		},
		{
			'hrsh7th/vim-vsnip-integ',
			require = { 'hrsh7th/vim-vsnip' },
			event = 'InsertEnter *',
		}
	}

	-- Profiling
	use { 'dstein64/vim-startuptime', cmd = 'StartupTime', config = [[vim.g.startuptime_tries = 10]] }
end)

vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])
