-- Compile lua files to bytecode
local present, impatient = pcall(require, "impatient")

if present then
  impatient.enable_profile()
end

-- Use :LuaCacheClear, :LuaCacheLog or LuaCacheProfile
---------------------------------

require('core.options')

vim.o.termguicolors = true

-- vim.g.tokyonight_style = "storm"
vim.g.tokyonight_style = "night"
-- vim.g.tokyonight_transparent = true

vim.cmd [[colorscheme tokyonight]]

require('plugins')

require'nvim-treesitter.configs'.setup {
  ensure_installed = { 'c', 'lua', 'rust', 'go', 'java', 'javascript' },
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
    indent_markers = {
      enable = true,
      icons = {
        corner = "└ ",
        edge = "│ ",
        item = "│ ",
        none = "  ",
      },
    },
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 400,
  },
  filters = {
    dotfiles = true,
  },
})

require("indent_blankline").setup {
  show_current_context = true,
  show_current_context_start = true,
}

require('completion')
