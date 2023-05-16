return {
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "EdenEast/nightfox.nvim",
    config = function()
      require("nightfox").setup({
        options = {
          styles = {
            comments = "italic",
            keywords = "bold",
            types = "italic,bold",
          },
        },
      })
    end,
  },
  {
    "ntk148v/vim-horizon",
  },
  { "projekt0n/github-nvim-theme", version = "v0.0.7" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
  },
}
