return {
  {
    "ntk148v/vim-horizon",
  },
  { "projekt0n/github-nvim-theme", version = "v0.0.7" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    config = function()
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
