return {
  {
    "nvim-treesitter/nvim-treesitter",
    highlight = {
      enable = true,
      disable = function(lang, bufnr) -- Disable in large C++ buffers
        return lang == "sql" and vim.api.nvim_buf_line_count(bufnr) > 50000
      end,
    },
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
