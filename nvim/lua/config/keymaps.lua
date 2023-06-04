-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- This file is automatically loaded by lazyvim.plugins.config

local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- Move to window using the <ctrl> hjkl keys with TmuxNavigation
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "Go to left window" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "Go to right window" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "Go to upper window" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "Go to lower window" })

vim.g["surround_no_mappings"] = 1
-- Just the defaults copied here.
map("n", "ds", "<Plug>Dsurround")
map("n", "cs", "<Plug>Csurround")
map("n", "cS", "<Plug>CSurround")
map("n", "ys", "<Plug>Ysurround")
map("n", "yS", "<Plug>YSurround")
map("n", "yss", "<Plug>Yssurround")
map("n", "ySs", "<Plug>YSsurround")
map("n", "ySS", "<Plug>YSsurround")

-- The conflicting ones. Note that `<Plug>(leap-cross-window)`
-- _does_ work in Visual mode, if jumping to the same buffer,
-- so in theory, `gs` could be useful for Leap too...
map("x", "gs", "<Plug>VSurround")
map("x", "gS", "<Plug>VgSurround")
