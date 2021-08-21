if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim autocmd!  autocmd VimEnter * PlugInstall
endif
" Plugins ---------------------------------------------------------------- {{{

call plug#begin(stdpath('data') . '/plugged')

Plug 'heavenshell/vim-jsdoc'

Plug 'folke/todo-comments.nvim'
Plug 'chr4/nginx.vim'
Plug 'folke/zen-mode.nvim'
Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' }
Plug 'windwp/nvim-ts-autotag'

Plug 'ray-x/lsp_signature.nvim'
Plug 'jbgutierrez/vim-better-comments'
Plug 'ryanoasis/vim-devicons'
"Plug 'HerringtonDarkholme/yats.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

" Vim Only
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'vim-test/vim-test'
Plug 'rcarriga/vim-ultest', { 'do': ':UpdateRemotePlugins' }

Plug 'mhartington/formatter.nvim'
Plug 'codehearts/mascara-vim'

Plug 'cohama/lexima.vim'
Plug 'kubejm/jest.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
"Plug 'tzachar/compe-tabnine', { 'do': './install.sh' }

Plug 'RishabhRD/popfix'
Plug 'glepnir/lspsaga.nvim'

Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'mhinz/vim-startify'
"Plug 'vim-airline/vim-airline'

"Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'shaunsingh/nord.nvim'
Plug 'sainnhe/sonokai'
Plug 'joshdick/onedark.vim'
Plug 'jacoborus/tender.vim'
Plug 'morhetz/gruvbox'
Plug 'mhartington/oceanic-next'
Plug 'adrian5/oceanic-next-vim'
Plug 'ayu-theme/ayu-vim'

Plug 'jbyuki/venn.nvim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'leafgarland/typescript-vim' 
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

Plug 'editorconfig/editorconfig-vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'christoomey/vim-tmux-navigator'

" GIT
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim', { 'on': 'GV' }

" NerdTree plugins
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'voldikss/vim-floaterm'

Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'kristijanhusak/vim-dadbod-completion'
Plug 'tpope/vim-surround'

Plug 'preservim/nerdcommenter'

Plug 'rust-lang/rust.vim'

Plug 'jiangmiao/auto-pairs'
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}

Plug 'romgrk/barbar.nvim'

Plug 'rafamadriz/friendly-snippets'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}

Plug 'akinsho/flutter-tools.nvim'

Plug 'vimwiki/vimwiki'
call plug#end()

lua require('_packer')

" }}}
let g:mascara_apply_at_startup = 1
let g:mascara_italic = [ 'Comment', 'ErrorMsg', 'LineNr' ] " Comments, error messages, line numbers

let g:indentLine_enabled = 1
let g:indentLine_char = '▏'

" Gitgutter ------------------------------------------------------------- {{{
"let g:gitgutter_sign_added = '▌'
"let g:gitgutter_sign_modified = '▌'
"let g:gitgutter_sign_removed = '▁'
"let g:gitgutter_sign_removed_first_line = '▌'
"let g:gitgutter_sign_modified_removed = '▌'
let g:gitgutter_map_keys = 0
"let g:gitgutter_realtime = 1
highlight GitGutterDelete guifg=#F97CA9
highlight GitGutterAdd    guifg=#BEE275
highlight GitGutterChange guifg=#96E1EF
let g:gitgutter_async=0

" }}}

" Vsnip ------------------------------------------------------------ {{{
" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
" }}}

let g:lexima_enable_basic_rules = 1
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
nnoremap <silent> <C-p> <cmd>Telescope find_files<cr>
nnoremap <silent> ;; <Cmd>Telescope help_tags<CR>

" Desativa setas do teclado
"noremap <Up> <Nop>
"noremap <Down> <Nop>
"noremap <Left> <Nop>
"noremap <Right> <Nop>

let g:dart_style_guide = 2

let g:jsdoc_lehre_path='/home/pedro/.yarn/bin/lehre'

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set nocompatible
syntax on
set termguicolors
set splitbelow splitright "Odem de abertura da divisão de tela
set number relativenumber "Numeração relativa como número da linha presente
set noexpandtab
set softtabstop=4
set tabstop=4
set shiftwidth=4
set autoindent      "Keep indentation from previous line
set smartindent     "Automatically inserts indentation in some cases
set mmp=2000000
set foldmethod=indent
set foldlevel=99

augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker foldlevel=0
augroup END

augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave *  if bufname('%') !~ 'NERD_tree_\d\+' | set relativenumber | endif
	autocmd BufLeave,FocusLost,InsertEnter   *  set norelativenumber
augroup END

" NerdTree ----------------------------------------------------------------------------- {{{
if !exists("nerd_map")
	let nerd_map = 1
	nnoremap <C-n> :NERDTreeToggle<CR>
	nnoremap <leader>f  :NERDTreeFind<CR>
	let NERDTreeQuitOnOpen = 0
	let NERDTreeAutoDeleteBuffer = 1
	let NERDTreeDirArrows = 1
	let g:NERDTreeGitStatusWithFlags = 1
	let g:NERDTreeIgnore = ['^node_modules$']
endif

" Start with nerdtree and curser in another window
"autocmd VimEnter * NERDTree | wincmd p

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
"autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
			"\ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" }}}

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


" Colorscheme -------------------------------------------------------- {{{
set background=dark " or light if you prefer the light version

"colo sonokai
"let g:airline_theme='sonokai'

"colo gruvbox
"let g:airline_theme='gruvbox'
"let g:gruvbox_contrast_dark=soft

"let g:oceanic_next_terminal_bold = 1
"let g:oceanic_next_terminal_italic = 1
"colo OceanicNext

" Example config in Vim-Script
let g:material_style = 'deep ocean'
let g:material_italic_comments = 1
let g:material_italic_keywords = 1
let g:material_italic_functions = 1
let g:material_contrast = 1
colorscheme material

"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
"colorscheme ayu

highlight Comment cterm=italic gui=italic

" }}}

"Clipboar yank config
vmap Y "+y
vmap P "+p

nnoremap <silent> <F10>  :set virtualedit=all<CR>
tnoremap <silent> <F10>  <C-\><C-n>:set virtualedit=all<CR>

vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

nnoremap <silent> <F7>  :FloatermNew<CR>
tnoremap <silent> <F7>  <C-\><C-n>:FloatermNew<CR>
nnoremap <silent> <F12> :FloatermToggle<CR>
tnoremap <silent> <F12> <C-\><C-n>:FloatermToggle<CR>

"Configure arquivos .ino e .pde para serem identificados como C++
au BufRead,BufNewFile *.ino,*.pde set filetype=cpp
command! Config execute ":e ~/.config/nvim/init.vim"
command! Python execute "terminal python3 %"

" Transparent ------------------------------------------------------------------------------------------- {{{
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
" }}}

" Avoid showing message extra message when using completion
set shortmess+=c

let g:lexima_no_default_rules = v:true
call lexima#set_default_rules()
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm(lexima#expand('<LT>CR>', 'i'))
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" hrsh7th/nvim-compe
let g:compe.source.vim_dadbod_completion = v:true

"---------------------------------------------------------------------

lua require 'init'
