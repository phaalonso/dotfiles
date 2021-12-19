require'nvim-treesitter.configs'.setup {
	ensure_installed = 'maintained',
	incremental_selection = { enable = true },
	autopairs = { enable = true },
	highlight = { enable = true, },
	autotag = { enable = true, },
	context_commentstring = { enable = true }
}

local npairs = require("nvim-autopairs")

npairs.setup({
    check_ts = true,
})

