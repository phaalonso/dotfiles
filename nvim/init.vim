lua require('init')

let g:indentLine_enabled = 1

" Vsnip ------------------------------------------------------------ {{{
" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
" }}}

let g:lexima_enable_basic_rules = 1

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" Set fzf layout screen
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

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

" Use mouse to select and resize windows, etc.

if has('mouse')
	set mouse=nv  " Enable mouse in several mode
	set mousemodel=popup  " Set the behaviour of mouse
endif


let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-d>'   " replace C-n
let g:VM_maps['Find Subword Under'] = '<C-d>'   " replace visual C-n

" Barbar.nvim config --------------
" Magic buffer-picking mode
nnoremap <silent> <C-s> :BufferLinePick<CR>
" Move to previous/next
nnoremap <silent> <A-,> :BufferLineCyclePrev<CR>
nnoremap <silent> <A-.> :BufferLineCycleNext<CR>
" Close buffer
nnoremap <silent> <A-c> :BufferLinePickClose<CR>

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
"set shortmess+=c 
"let g:lexima_no_default_rules = v:true call lexima#set_default_rules()
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm(lexima#expand('<LT>CR>', 'i'))
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

"---------------------------------------------------------------------
