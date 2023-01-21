vim.o.termguicolors = true
vim.g.mapleader = " "
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

local set = vim.opt

set.encoding="utf-8"                         -- The encoding displayed
set.fileencoding="utf-8"                     -- The encoding written to file
set.smarttab = true                          -- Makes tabbing smarter will realize you have 2 vs 4
set.expandtab = true                         -- Converts tabs to spaces
set.autoindent = true                        -- Good auto indent
-- set.autochdir = true                         -- Your working directory will always be the same as your working directory
set.clipboard = "unnamedplus"                -- Copy paste between vim and everything else
set.incsearch = true                         -- Sets incremental search
set.shell = "/bin/zsh"                       -- Set your shell to bash or zsh
set.completeopt=menu,menuone,noselect

vim.cmd [[set nocompatible]]                 -- Disable compatibility to old-time vi

------------
-- NVIM UI
------------
set.splitbelow = true                        -- Horizontal splits will automatically be below
set.splitright = true                        -- Vertical splits will automatically be to the right
set.conceallevel = 0                         -- So that I can see `` in markdown files
set.tabstop = 2                              -- Insert 2 spaces for a tab
set.number = true                            -- Line numbers
set.background = "dark"                      -- Tell vim what the background color looks like
set.virtualedit = "onemore"                  -- With This option you can move the cursor one character over the end
set.ignorecase = true                        -- Ignores case when searching
set.smartcase = true                         -- Turns on case sensitive search when letters are capitalized
set.termguicolors = true                     -- Set term gui colors (most terminals support this)
set.laststatus=3                             -- Always display the status line
set.title = true                             -- Show current txt that you editing
set.relativenumber = false                   -- Vim’s absolute, relative and hybrid line numbers
set.cursorline = true                        -- Enable highlighting of the current line
set.shiftwidth = 2                           -- Change the number of space characters inserted for indentation
set.showtabline = 1                          -- Always show tabs
set.cmdheight = 1                            -- More space for displaying messages
set.numberwidth = 5                          -- Set number column width to 2 {default 4}
set.foldenable = false                       -- Disable folding text
vim.cmd [[setlocal conceallevel=2]]          -- Syntax conceal for markdown
vim.cmd [[set noshowmode]]                   -- We don't need to see things like -- INSERT -- anymore
vim.cmd [[syntax enable]]                    -- Enables syntax highlighing
vim.cmd [[set t_Co=256]]                     -- Support 256 colors
vim.cmd [[set et sts=4]]

-----------------
-- Memory, CPU --
-----------------
set.hidden = true                            -- Required to keep multiple buffers open multiple buffers
set.timeoutlen = 500                         -- By default timeoutlen is 1000 ms
set.lazyredraw = true                        -- Disable lazyredraw
set.synmaxcol = 240                          -- Max column for syntax highlight
set.updatetime = 700                         -- ms to wait for trigger an event
