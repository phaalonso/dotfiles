return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "typescript",
        "go",
        "bash",
        "html",
        "javascript",
        "json",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "vim",
        "c",
        "gomod",
        "php",
        "phpdoc",
      })
    end,
  },
}
