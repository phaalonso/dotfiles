local actions = require'telescope.actions'
local sorters = require'telescope.sorters'

require('telescope').setup{
	mappings = {
		n = {
			["q"] = actions.close
		},
	},
	file_ignore_patterns = {
		"node_modules",
		"android",
		"deps",
		"build",
		"_build",
		"dist"
	},
	file_sorter = sorters.get_fzy_sorter,
}
