vim.lsp.set_log_level("debug")

local g = vim.g;

g.EditorConfig_exclude_patterns = { 'fugitive://.*' } -- Telescope configuration

g.indentLine_enabled = 1

g.gruvbox_material_background = 'medium'
g.gruvbox_material_enable_italic = 1
g.gruvbox_material_disable_italic_comment = 0
g.gruvbox_material_enable_bold = 1

g.airline_theme='sonokai'

g.oceanic_next_terminal_bold = 1
g.oceanic_next_terminal_italic = 1

vim.cmd([[
	colorscheme onedark
]])

require('plugins')
require('treesitter')

vim.g.wiki_root = '~/notes'
vim.g.wiki_filetypes = {'md'}
vim.g.wiki_link_extension = '.md'


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

--require('lspsaga').init_lsp_saga()

