require'nvim-treesitter.configs'.setup {
	ensure_installed = {
		'c', 
		'cpp',
		'dart',
		'go',
		'html',
		'python',
		'java',
		'rust',
		'javascript',
		'typescript',
		'lua'
	}, 
	highlight = {
		enable = true,
	},
}
