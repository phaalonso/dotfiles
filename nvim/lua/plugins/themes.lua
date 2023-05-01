return {
  {
    "ntk148v/vim-horizon",
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    config = function()
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
