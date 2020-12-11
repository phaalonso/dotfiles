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
Plug 'stevearc/vim-arduino'

Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
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

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'voldikss/vim-floaterm'

Plug 'tpope/vim-eunuch'

Plug 'preservim/nerdcommenter'

Plug 'rust-lang/rust.vim'

Plug 'jiangmiao/auto-pairs'
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
Plug 'majutsushi/tagbar'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
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
\	'coc-java',
\   'coc-actions',
\   'coc-angular',
\   'coc-snippets',
\   'coc-lists',
\   'coc-tsserver',
\	'coc-styled-components',
\	'coc-react-refactor',
\   'coc-tslint-plugin',
\   'coc-sql',
\   'coc-html',
\   'coc-emmet',
\   'coc-python',
\   'coc-json',
\   'coc-css',
\   'coc-cssmodules',
\   'coc-markdownlint',
\   'coc-discord-neovim',
\   'coc-eslint',
\   'coc-phpactor',
\	'coc-rls'
\ ]

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" IDE like experiende shortcuts
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>a <Plug>(coc-codeaction)

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
nmap <leader>gh :diffget //3<CR>
nmap <leader>gj :diffget //2<CR>
nmap <leader>gf :G<CR>

" <C-n> in normal mode open NerdTree :)
nmap <C-n> :NERDTreeToggle<CR>
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeIgnore = ['^node_modules$']

" Set fzf layout screen
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

set re=0

" Use mouse to select and resize windows, etc.
if has('mouse')
    set mouse=nv  " Enable mouse in several mode
    set mousemodel=popup  " Set the behaviour of mouse
	let NERDTreeMouseMode=3
endif

" Set <C-p> in normal mode to open FZF
noremap <C-p> :FZF <CR>

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

set guifont=FiraCode\ Nerd\ Font\ Regular:h12
set splitbelow splitright
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
let g:airline_theme = 'dracula'
let g:airline_detect_whitespace=0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1

" NerdTree
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeDirArrows = 1

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

" Transparency
"au ColorScheme * hi Normal ctermbg=none guibg=none
"au ColorScheme myspecialcolors hi Normal ctermbg=blue guibg=blue

"function! s:check_back_space() abort
	"let col = col('.') - 1
	"return !col || getline('.')[col - 1] =~ '\s'
"endfunction

"inoremap <silent><expr> <Tab>
	"\ pumvisible() ? "\<C-n>" :
	"\ <SID>check_back_space() ? "\<Tab>" :
	"\ kite#completion#autocomplete()

"Themes
"colorscheme gruvbox
colorscheme	dracula 
"colorscheme pure_material
"let g:gruvbox_contrast_dark = 'dark'
let g:gruvbox_invert_selection = '0'
"colorscheme palenight
"colorscheme minimalist

" Clipboard yank config in case friends want to edit my code :P
vmap Y "+y
noremap P "+p
"vmap <C-c> "+y
"vmap <C-v> "+p

vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

au BufRead,BufNewFile *.ino,*.pde set filetype=cpp
command! Config execute ":e ~/.config/nvim/init.vim"

" gnvim config
"set guicursor+=a:blinkon333
"set guicursor=
