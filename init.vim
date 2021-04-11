if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd!
    autocmd VimEnter * PlugInstall
endif

call plug#begin(stdpath('data') . '/plugged')
Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

Plug 'neovim/nvim-lspconfig'
"Plug 'kabouzeid/nvim-lspinstall'
Plug 'hrsh7th/nvim-compe'
Plug 'nvim-lua/completion-nvim'

Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'

"Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'arcticicestudio/nord-vim'
Plug 'sainnhe/sonokai'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim' 
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
"Plug 'HerringtonDarkholme/yats.vim' " TS Syntax

"Semantic highligthing para python
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

Plug 'editorconfig/editorconfig-vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'christoomey/vim-tmux-navigator'

" GIT
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim', { 'on': 'GV' }

" NerdTree plugins
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'voldikss/vim-floaterm'

Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-dadbod'

Plug 'preservim/nerdcommenter'

Plug 'rust-lang/rust.vim'

Plug 'jiangmiao/auto-pairs'
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}

Plug 'romgrk/barbar.nvim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-symbols.nvim'
call plug#end()

let g:indentLine_enabled = 0
let g:indentLine_char = '|'

let g:gitgutter_sign_added = '▌'
let g:gitgutter_sign_modified = '▌'
let g:gitgutter_sign_removed = '▁'
let g:gitgutter_sign_removed_first_line = '▌'
let g:gitgutter_sign_modified_removed = '▌'
let g:gitgutter_map_keys = 0
"let g:gitgutter_realtime = 1
highlight GitGutterDelete guifg=#F97CA9
highlight GitGutterAdd    guifg=#BEE275
highlight GitGutterChange guifg=#96E1EF
let g:gitgutter_async=0

" Coc configuration ---------------------------

"let g:coc_global_extensions = [
"\ 'coc-json', 
"\ 'coc-angular',
"\ 'coc-snippets',
"\ 'coc-lists',
"\ 'coc-react-refactor',
"\ 'coc-sql',
"\ 'coc-html',
"\ 'coc-emmet',
"\ 'coc-python',
""\ 'coc-css',
""\ 'coc-cssmodules',
""\ 'coc-java',
""\ 'coc-elixir',
""\ 'coc-rls',
"\ 'coc-json',
"\ ]

"if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  "let g:coc_global_extensions += ['coc-prettier']
"endif

"if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  "let g:coc_global_extensions += ['coc-eslint']
"endif

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

"Vim-fugitive
nmap <silent> <leader>gs :Git<CR>
nmap <leader>gh :diffget //3<CR>
nmap <leader>gj :diffget //2<CR>
nmap <leader>gf :G<CR>

" Set fzf layout screen
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

set re=0

" Set <C-p> in normal mode to open FZF
"noremap <C-p> :FZF <CR>
nnoremap <C-p> <cmd>Telescope find_files<cr>

" Desativa setas do teclado
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"Odem de abertura da divisão de tela
set splitbelow splitright
"Numeração relativa como número da linha presente
set number! relativenumber!

set noexpandtab
set softtabstop=4
set tabstop=4
set shiftwidth=4

set autoindent      "Keep indentation from previous line
set smartindent     "Automatically inserts indentation in some cases

syntax on
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:airline_powerline_fonts = 1
let g:airline_detect_whitespace=0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1

" NerdTree
nmap <C-n> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 0
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeDirArrows = 1
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeIgnore = ['^node_modules$']
" Use mouse to select and resize windows, etc.

if has('mouse')
    set mouse=nv  " Enable mouse in several mode
    set mousemodel=popup  " Set the behaviour of mouse
	let NERDTreeMouseMode=3
endif


let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-d>'   " replace C-n
let g:VM_maps['Find Subword Under'] = '<C-d>'   " replace visual C-n

" Barbar.nvim config --------------
" Magic buffer-picking mode
nnoremap <silent> <C-s> :BufferPick<CR>
" Move to previous/next
nnoremap <silent> <A-,> :BufferPrevious<CR>
nnoremap <silent> <A-.> :BufferNext<CR>
" Close buffer
nnoremap <silent> <A-c> :BufferClose<CR>

tnoremap <Esc> <C-\><C-n>
" Transparency
"au ColorScheme * hi Normal ctermbg=none guibg=none
"au ColorScheme myspecialcolors hi Normal ctermbg=blue guibg=blue

" use tab to trigger completion and navigate to the next item
"function! s:check_back_space() abort
	"let col = col('.') - 1
	"return !col || getline('.')[col - 1] =~ '\s'
"endfunction

"inoremap <silent><expr> <Tab>
	"\ pumvisible() ? "\<C-n>" :
	"\ <SID>check_back_space() ? "\<Tab>" :
	"\ kite#completion#autocomplete()


colorscheme sonokai
let g:airline_theme='sonokai'

"Clipboar yank config
vmap Y "+y
vmap P "+p
"vmap <C-c> "+y
"vmap <C-v> "+p

vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

nnoremap   <silent>   <F7>    :FloatermNew<CR>
tnoremap   <silent>   <F7>    <C-\><C-n>:FloatermNew<CR>
nnoremap   <silent>   <F12>   :FloatermToggle<CR>
tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>

"Configure arquivos .ino e .pde para serem identificados como C++
au BufRead,BufNewFile *.ino,*.pde set filetype=cpp
command! Config execute ":e ~/.config/nvim/init.vim"

autocmd FileType elixir setlocal formatprg=mix\ format\ -

let t:is_transparent = 0
function! Toggle_transparent()
	if t:is_transparent == 0
		hi Normal guibg=NONE ctermbg=NONE
		let t:is_transparent = 1
	else
		set background=dark
		let t:is_tranparent = 0
	endif
endfunction
nnoremap <F8> : call Toggle_transparent()<CR>

vnoremap <leader>p "_dP

set completeopt=menuone,noselect
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true

" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
"nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
"nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

lua << EOF
local actions = require('telescope.actions')
require('telescope').setup {
  defaults = {
	 vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
	file_sorter = require'telescope.sorters'.get_fuzzy_file,
	file_ignore_patterns = {
		"node_modules",
		"deps",
		"build",
		"_build",
		"dist"
	},
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    prompt_prefix = ' >',
    color_devicons = true,
  }
}
require('gitsigns').setup()

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
	enable = true,              -- false will disable the whole extension
	disable = { "c", "rust" },  -- list of language that will be disabled
  },
}

require'lspconfig'.gopls.setup{}

require'lspconfig'.tsserver.setup{}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.rust_analyzer.setup {
  capabilities = capabilities,
}

require'lspconfig'.html.setup{}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

require'lspconfig'.pyright.setup{}
EOF
