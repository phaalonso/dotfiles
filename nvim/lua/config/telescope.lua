local actions = require'telescope.actions'
local sorters = require'telescope.sorters'

require('telescope').setup{
	mappings = {
		n = {
			["q"] = actions.close
		},
		i = {
			["<esc>"] = actions.close
		}
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

--require('telescope').load_extension('flutter')

local M = {}
M.search_dotfiles = function()
	require("telescope.builtin").find_files({
		prompt_title = "<VimRC >",
		cwd = "~/.dotfiles"
	})
end

local opts = { noremap=true, silent=true }

return M
