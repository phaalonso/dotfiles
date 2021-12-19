vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_window_picker_exclude = {
	filetype = { 
		'notify',
		'packer',
		'qf',
		'dashboard'
	}
}

require'nvim-tree'.setup {
	auto_open = 1,
	auto_close = 1,
	git = {
		ignore = true
	},
	view = {
		width = 25
	}
}
