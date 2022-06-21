require("nvim-lsp-installer").setup({
    automatic_installation = false,
    ensure_installed = { 'typescript', 'java' },
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

