vim.lsp.set_log_level("debug")

require('plugins')
require('treesitter')

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

--require('lspsaga').init_lsp_saga()

