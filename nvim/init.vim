lua require('init')

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Desativa setas do teclado
"noremap <Up> <Nop>
"noremap <Down> <Nop>
"noremap <Left> <Nop>
"noremap <Right> <Nop>

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

"augroup numbertoggle
	"autocmd!
	"autocmd BufEnter,FocusGained,InsertLeave *  if bufname('%') !~ 'NERD_tree_\d\+' | set relativenumber | endif
	"autocmd BufLeave,FocusLost,InsertEnter   *  set norelativenumber
"augroup END

" Use mouse to select and resize windows, etc.

if has('mouse')
	set mouse=nv  " Enable mouse in several mode
	set mousemodel=popup  " Set the behaviour of mouse
endif

nnoremap <C-n> :NvimTreeToggle<CR>

" Barbar.nvim config --------------
" Magic buffer-picking mode
nnoremap <silent> <C-s> :BufferLinePick<CR>
" Move to previous/next
nnoremap <silent> <A-,> :BufferLineCyclePrev<CR>
nnoremap <silent> <A-.> :BufferLineCycleNext<CR>
" Close buffer
nnoremap <silent> <A-c> :BufferLinePickClose<CR>

tnoremap <Esc> <C-\><C-n>

set background=dark " or light if you prefer the light version
set termguicolors

highlight Comment cterm=italic gui=italic

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

nnoremap <leader>df :lua require('config._telescope').search_dotfiles()<CR>

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

"autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
