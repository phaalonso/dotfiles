vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")

vim.keymap.set("n", "<leader>F", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>t", "<cmd>TroubleToggle<CR>")

-- Bufferline
vim.keymap.set("n", "<leader>bb", "<cmd>BufferLineCyclePrev<CR>")   -- Volta ao buffer anterior
vim.keymap.set("n", "<leader>bn", "<cmd>BufferLineCycleNext<CR>")   -- Passa para o próximo buffer
vim.keymap.set("n", "<leader>bp", "<cmd>BufferLineTogglePin<CR>")   -- Marca o buffer
vim.keymap.set("n", "<leader>bcc", "<cmd>BufDel<CR>")               -- Fecha o buffer atual e vai pro próximo
vim.keymap.set("n", "<leader>bcp", "<cmd>BufferLinePickClose<CR>")  -- Escolhe um buffer para fechar
