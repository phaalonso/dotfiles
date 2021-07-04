if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim autocmd!  autocmd VimEnter * PlugInstall
endif

" Plugins ---------------------------------------------------------------- {{{

call plug#begin(stdpath('data') . '/plugged')

Plug 'chr4/nginx.vim'

Plug 'jbgutierrez/vim-better-comments'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
"Plug 'HerringtonDarkholme/yats.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'mhartington/formatter.nvim'
Plug 'codehearts/mascara-vim'

Plug 'cohama/lexima.vim'
Plug 'kubejm/jest.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
"Plug 'tzachar/compe-tabnine', { 'do': './install.sh' }
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'

"Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'arcticicestudio/nord-vim'
Plug 'sainnhe/sonokai'
Plug 'joshdick/onedark.vim'
Plug 'jacoborus/tender.vim'
Plug 'rakr/vim-two-firewatch'
Plug 'morhetz/gruvbox'
Plug 'mhartington/oceanic-next'
Plug 'adrian5/oceanic-next-vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim' 
Plug 'maxmellon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

"Semantic highligthing para python
"Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

Plug 'editorconfig/editorconfig-vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'christoomey/vim-tmux-navigator'

" GIT
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'
"Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim', { 'on': 'GV' }

" NerdTree plugins
Plug 'scrooloose/nerdtree'
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'voldikss/vim-floaterm'

Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-surround'

Plug 'preservim/nerdcommenter'

Plug 'rust-lang/rust.vim'

Plug 'jiangmiao/auto-pairs'
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}

Plug 'romgrk/barbar.nvim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-symbols.nvim'

Plug 'rafamadriz/friendly-snippets'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
call plug#end()

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

highlight Comment cterm=italic gui=italic

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
nnoremap <C-p> <cmd>Telescope find_files<cr>

" Desativa setas do teclado
"noremap <Up> <Nop>
"noremap <Down> <Nop>
"noremap <Left> <Nop>
"noremap <Right> <Nop>

set termguicolors

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Theme
syntax on
set nocompatible
"Odem de abertura da divisão de tela
set splitbelow splitright

"Numeração relativa como número da linha presente
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set noexpandtab
set softtabstop=4
set tabstop=4
set shiftwidth=4

set autoindent      "Keep indentation from previous line
set smartindent     "Automatically inserts indentation in some cases

set mmp=2000000

let g:airline_powerline_fonts = 1
let g:airline_detect_whitespace=0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1

" NerdTree ----------------------------------------------------------------------------- {{{
if !exists("nerd_map")
	let nerd_map = 1
	nnoremap <C-n> :NERDTreeToggle<CR>
	nnoremap <leader>f  :NERDTreeFind<CR>
endif

let NERDTreeQuitOnOpen = 0
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeDirArrows = 1
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeIgnore = ['^node_modules$']

" Start with nerdtree and curser in another window
"autocmd VimEnter * NERDTree | wincmd p

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
"autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
			"\ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

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

set foldmethod=indent
set foldlevel=99
	" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker foldlevel=0
augroup END

" Colorscheme -------------------------------------------------------- {{{
set background=dark " or light if you prefer the light version

"colo sonokai
"let g:airline_theme='sonokai'

"colo gruvbox
"let g:airline_theme='gruvbox'
"let g:gruvbox_contrast_dark=soft

"let g:two_firewatch_italics=1
"colo two-firewatch
"let g:airline_theme='twofirewatch' " if you have Airline installed and want the associated theme

"let g:oceanic_next_terminal_bold = 1
"let g:oceanic_next_terminal_italic = 1
"colo OceanicNext

let g:airline_theme='oceanicnext'
let g:oceanic_for_polyglot = 1
let g:oceanic_italic_comments = 1
colo oceanicnext

" }}}

"Clipboar yank config
vmap Y "+y
vmap P "+p
"vmap <C-c> "+y
"vmap <C-v> "+p

vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

nnoremap <silent> <F7>  :FloatermNew<CR>
tnoremap <silent> <F7>  <C-\><C-n>:FloatermNew<CR>
nnoremap <silent> <F12> :FloatermToggle<CR>
tnoremap <silent> <F12> <C-\><C-n>:FloatermToggle<CR>

"Configure arquivos .ino e .pde para serem identificados como C++
au BufRead,BufNewFile *.ino,*.pde set filetype=cpp
command! Config execute ":e ~/.config/nvim/init.vim"
command! Python execute "terminal python3 %"

autocmd FileType elixir setlocal formatprg=mix\ format\ -

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

" Set completeopt to have a better completion experience
set completeopt=menuone,noselect

" Avoid showing message extra message when using completion
set shortmess+=c
set omnifunc=v:lua.vim.lsp.omnifunc

" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
"nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
"nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
"nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
"

let g:lexima_no_default_rules = v:true
call lexima#set_default_rules()
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm(lexima#expand('<LT>CR>', 'i'))
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

call defx#custom#option('_', {
      \ 'winwidth': 30,
      \ 'split': 'vertical',
      \ 'show_ignored_files': 0,
      \ 'buffer_name': 'defxplorer',
      \ 'toggle': 1,
      \ 'resume': 1
      \ })

" Toggle Defx using Ctrl + Space
map <C-space> :Defx<CR>

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  " Define mappings
  nnoremap <silent><buffer><expr> <CR> defx#do_action('drop')
  nnoremap <silent><buffer><expr> c
  \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
  \ defx#do_action('open')
  nnoremap <silent><buffer><expr> E
  \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P
  \ defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> o
  \ defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> K
  \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M
  \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C
  \ defx#do_action('toggle_columns',
  \                'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S
  \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> !
  \ defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x
  \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy
  \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
  \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;
  \ defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
  \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
  \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
  \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
  \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
  \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>
  \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
  \ defx#do_action('print')
  nnoremap <silent><buffer><expr> cd
  \ defx#do_action('change_vim_cwd')
endfunction

"---------------------------------------------------------------------
lua << EOF
local actions = require('telescope.actions')

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
	tags = true;
  };
}

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
	file_ignore_patterns = {
		"node_modules",
		"android",
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
  ensure_installed = {
	  'c', 'cpp', 'dart', 'go', 'html', 'python', 'java', 'rust', 'javascript', 'typescript',
  }, 
  ignore_install = { 
	  'cpp',
	  'dart',
	  'java'
  },
  highlight = {
	enable = true,              -- false will disable the whole extension
	additional_vim_regex_highlighting = true,
  },
  indent = {
	enable = true
  }
}

local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  --buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  --buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  --buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
  if client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("v", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
local servers = { "pyls", "rust_analyzer", "tsserver", "gopls", "tsserver", "html" }

for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup { 
		on_attach = on_attach,
		capabilities = capabilities
	}
end

nvim_lsp.diagnosticls.setup {
  filetypes = {"javascript", "javascriptreact", "typescript", "typescriptreact", "css"},
  init_options = {
    filetypes = {
      javascript = "eslint",
      typescript = "eslint",
      javascriptreact = "eslint",
      typescriptreact = "eslint"
    },
    linters = {
      eslint = {
        sourceName = "eslint",
        command = "./node_modules/.bin/eslint",
        rootPatterns = {
          ".eslitrc.js",
          "package.json"
        },
        debounce = 100,
        args = {
          "--cache",
          "--stdin",
          "--stdin-filename",
          "%filepath",
          "--format",
          "json"
        },
        parseJson = {
          errorsRoot = "[0].messages",
          line = "line",
          column = "column",
          endLine = "endLine",
          endColumn = "endColumn",
          message = "${message} [${ruleId}]",
          security = "severity"
        },
        securities = {
          [2] = "error",
          [1] = "warning"
        }
      }
    }
  }
}

require'lspconfig/configs'.emmet_ls = {
  default_config = {
    cmd = {'emmet-ls', '--stdio'};
    filetypes = {'html', 'css', 'jsx', 'tsx'};
	root_dir = require'lspconfig'.util.root_pattern(".git", vim.fn.getcwd()),
  }
}

require'lspconfig'.emmet_ls.setup{
	on_attach = on_attach;
}

-- require'lspconfig'.html.setup{
    --cmd = { "html-languageserver", "--stdio" },
    --filetypes = { "html" },
    --init_options = {
      --configurationSection = { "html", "css", "javascript" },
      --embeddedLanguages = {
        --css = true,
        --javascript = true
      --}
    --},
    --settings = {},
	--on_attach = function(client)
		--client.resolved_capabilities.document_formatting = false
		--on_attach(client)
	--end
--}

require'lspconfig'.cssls.setup {
  capabilities = capabilities,
}

require'lspconfig'.cssls.setup{
    cmd = { "css-languageserver", "--stdio" },
    filetypes = { "css", "scss", "less" },
    settings = {
      css = {
        validate = true
      },
      less = {
        validate = true
      },
      scss = {
        validate = true
      }
	},
	  on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
		on_attach(client)
	  end
}

require('formatter').setup({
  logging = false,
  filetype = {
	  javascript = {
        -- prettier
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
            stdin = true
          }
        end
	},
    typescript = {
		function()
		  return {
			exe = "eslint",
			args = {
			  "--stdin-filename",
			  vim.api.nvim_buf_get_name(0),
			  "--fix",
			  "--cache"
			},
			stdin = false
		  }
		end
    }
  }
})


vim.api.nvim_exec([[
	augroup FormatAutogroup
	  autocmd!
	  autocmd BufWritePost *.js,*.rs,*.lua FormatWrite
	augroup END
]], true)

local lspconfig = require'lspconfig'
lspconfig.ccls.setup {
  init_options = {
    compilationDatabaseDirectory = "build";
    index = {
      threads = 0;
    };
    clang = {
      excludeArgs = { "-frounding-math"} ;
    };
  }
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
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

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
EOF
