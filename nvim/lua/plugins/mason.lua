return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "dockerfile-language-server",
        "docker-compose-language-service",
        "jdtls",
        "rust-analyzer",
        "typescript-language-server",
        "gopls",
      },
    },
  },
}
