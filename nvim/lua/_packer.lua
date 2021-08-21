local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
	execute 'packadd packer.nvim'
end

require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use 'kyazdani42/nvim-web-devicons'

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

	-- use {
		--"nvim-telescope/telescope-frecency.nvim",
		--config = function()
			--require"telescope".load_extension("frecency")
			--requires = {"tami5/sql.nvim"}
		--end
	--}

	use 
	{
		'nvim-telescope/telescope.nvim',
		requires = { 
			'nvim-lua/popup.nvim',
			'nvim-lua/plenary.nvim',
		},
		config = [[require('config._telescope)]]
	}
end)
