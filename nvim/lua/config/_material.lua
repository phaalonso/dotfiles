vim.g.colorscheme = 'material'
vim.g.material_style = 'deep ocean'

require('material').setup({
	contrast = true,
	borders = false,
	italics = {
		comments = true,
		strings = false,
		keywords = true,
		functions = true,
		variables = false
	},
	contrast_windows = {
		"terminal",
		"packer",
		"qf"
	},
	text_contrast = {
		lighter = false,
		darker = false
	},
	disable = {
		background = false,
		term_colors = false,
		eob_lines = false
	},
	custom_highlights = {}
})
