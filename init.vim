" ___ _   _ ___ _______     _____ __  __ 
"|_ _| \ | |_ _|_   _\ \   / /_ _|  \/  |
" | ||  \| || |  | |  \ \ / / | || |\/| |
" | || |\  || |  | |_  \ V /  | || |  | |
"|___|_| \_|___| |_(_)  \_/  |___|_|  |_|
                                        
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd!
    autocmd VimEnter * PlugInstall
endif

call plug#begin(stdpath('data') . '/plugged')

Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

"Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'arcticicestudio/nord-vim'
Plug 'ayu-theme/ayu-vim' " or other package manager
Plug 'sainnhe/sonokai'

"Plug 'jparise/vim-graphql'
"Plug 'elixir-editors/vim-elixir'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim' 
Plug 'peitalin/vim-jsx-typescript'
Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

"Semantic highligthing para python
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

Plug 'editorconfig/editorconfig-vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'christoomey/vim-tmux-navigator'

Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim', { 'on': 'GV' }

" NerdTree plugins
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'airblade/vim-gitgutter'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'voldikss/vim-floaterm'

Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-dadbod'

Plug 'preservim/nerdcommenter'

Plug 'rust-lang/rust.vim'

Plug 'jiangmiao/auto-pairs'
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
Plug 'majutsushi/tagbar'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()

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

let g:coc_global_extensions = [
\   'coc-angular',
\	'coc-db',
\   'coc-snippets',
\   'coc-lists',
\   'coc-tsserver',
\   'coc-styled-components',
\   'coc-react-refactor',
\   'coc-tslint-plugin',
\   'coc-sql',
\   'coc-html',
\   'coc-emmet',
\   'coc-python',
\   'coc-css',
\   'coc-cssmodules',
\   'coc-markdownlint',
\   'coc-java',
"\   'coc-discord-neovim',
"\	 'coc-elixir',
"\   'coc-eslint',
"\   'coc-phpactor',
"\	'coc-rls',
\	'coc-prettier'
\ ]

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" IDE like experiende shortcuts
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> <C-a> :CocAction<CR>

" Show documentation of iten in cursor position
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nmap <F2> <Plug>(coc-rename)

" Show sugestions
inoremap <silent><expr> <c-space> coc#refresh()

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>qf  <Plug>(coc-fix-current)

function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

" Tab select the sugestion, use <C-n> and <C-p> to navigate
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<C-g>u\<TAB>"

"Vim-fugitive
nmap <silent> <leader>gs :Git<CR>
nmap <leader>gh :diffget //3<CR>
nmap <leader>gj :diffget //2<CR>
nmap <leader>gf :G<CR>

" <C-n> in normal mode open NerdTree :)

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

"Font utilizada por interfaces GUI
set guifont=Fira\ Code\ Nerd\ Regular:h12
"set guicursor+=a:blinkon333
"set guicursor=

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

"Themes

" Nord
"colorscheme	nord 
"let g:airline_theme = 'nord'

" Sonokai
colorscheme sonokai
let g:airline_theme='sonokai'
"colorscheme pure_material
"colorscheme palenight
"colorscheme minimalist

"GRUVBOX
"colorscheme gruvbox
"let g:gruvbox_contrast_dark = 'dark'
"let g:gruvbox_invert_selection = '0'

"AYU
"colorscheme ayu
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme

" IndentLine {{
let g:indentLine_char = ''
let g:indentLine_first_char = ''
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
" }}

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
EOF
