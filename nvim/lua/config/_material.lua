vim.g.colorscheme = 'material'
vim.g.material_style = 'deep ocean'

require('material').setup({
	contrast = true,
	borders = true,
	italics = {
		comments = true,
		keywords = true,
		functions = true,
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
