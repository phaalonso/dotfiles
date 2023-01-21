vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")

vim.keymap.set("n", "<leader>F", vim.lsp.buf.format)
