local present, impatient = pcall(require, "impatient")

if present then
   impatient.enable_profile()
end

require('core.options')

vim.g.tokyonight_style = "storm"
vim.g.tokyonight_transparent = true

vim.cmd [[colorscheme tokyonight]]

require('plugins')

require'nvim-treesitter.configs'.setup {
  ensure_installed = { 'c', 'lua', 'rust', 'go', 'java', 'javascript' },
  sync_install = false, -- Install parsers synchronously (only applied to `ensure_installed`)
  --ignore_install = { "javascript" },

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
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
  },
  filters = {
    dotfiles = true,
  },
})

require('completion')
