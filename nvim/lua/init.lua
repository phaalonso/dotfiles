-- vim.lsp.set_log_level("debug")
local g = vim.g;

g.EditorConfig_exclude_patterns = { 'fugitive://.*' } -- Telescope configuration

require('plugins')
require('config.treesitter')
require('config._lsp')
require('config.auto_pairs')
require('config.nvim_tree')

-- Colorschemes

require('colorschemes.gruvbox')
require('colorschemes.oceanic_next')
require('colorschemes.material')

vim.cmd([[
	colorscheme onedark
]])


-- Vim visual multi
g.VM_maps = {}
g.VM_maps['Find Under']         = '<C-d>'   -- replace C-n
g.VM_maps['Find Subword Under'] = '<C-d>'   -- replace visual C-n

--vim.cmd([[
  --augroup packer_user_config
    --autocmd!
    --autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  --augroup end
--]])

vim.cmd([[
	augroup filetype_vim
		autocmd!
		autocmd FileType vim setlocal foldmethod=marker foldlevel=0
	augroup END
]])

--require('lspsaga').init_lsp_saga()

local options = { noremap = true, silent = false }

local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end	

buf_set_keymap('n', '<leader>ft', '<cmd>TodoTrouble<CR>', options)
buf_set_keymap('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<CR>', options)
buf_set_keymap('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<CR>', options)
buf_set_keymap('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<CR>', options)
buf_set_keymap('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<CR>', options)
buf_set_keymap('n', '<leader>ss', '<cmd>lua require("telescope.builtin").spell_suggest()<CR>', options)
buf_set_keymap('n', '<leader>cmd', '<cmd>lua require("telescope.builtin").commands()<CR>', options)
buf_set_keymap('n', '<leader>a', '<cmd>lua require("telescope.builtin").lsp_code_actions()<CR>', options)
buf_set_keymap('n', '<leader>ra', '<cmd>lua require("telescope.builtin").lsp_range_code_actions()<CR>', options)
buf_set_keymap('n', 'gd', '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>', options)
buf_set_keymap('n', 'gi', '<cmd>lua require("telescope.builtin").lsp_implementations()<CR>', options)
