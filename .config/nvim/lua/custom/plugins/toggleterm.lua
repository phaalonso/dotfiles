-- Escape terminal mode using Esc
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>');

-- Adding to which-key
require('which-key').register({
  t = {
    name = "[T]erminal",
    t = { "<cmd>ToggleTerm<cr>", "Toggle term" }
  }
}, { prefix = "<leader>" })

return { 'akinsho/toggleterm.nvim', version = "*", config = true };
