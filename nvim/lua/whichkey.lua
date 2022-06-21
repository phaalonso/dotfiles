local present, wk = pcall(require, "which-key")

if not present then
   return
end

wk.setup {
  plugins = {
		marks = false,
		registers = false,
		spelling = {
      enabled = false,
      suggestions = 20
    },
		presets = {
      operators = false,
      motions = false,
      text_objects = false,
      windows = false,
      nav = false,
      z = false,
      g = false
    }
	}
}

local options = {

   icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "  ", -- symbol used between a key and it's label
      group = "+", -- symbol prepended to a group
   },

   popup_mappings = {
      scroll_down = "<c-d>", -- binding to scroll down inside the popup
      scroll_up = "<c-u>", -- binding to scroll up inside the popup
   },

   window = {
      border = "none", -- none/single/double/shadow
   },

   layout = {
      spacing = 6, -- spacing between columns
   },

   hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },

   triggers_blacklist = {
      -- list of mode / prefixes that should never be hooked by WhichKey
      i = { "j", "k" },
      v = { "j", "k" },
   },
}

local utils = require "core.utils"
local coreMappings = require "core.mappings"

utils.load_mappings(coreMappings, options)

wk.register({
  l = {
		name = "LSP",
		i = {":LspInfo<cr>", "Connected Language Servers"},
		k = {"<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help"},
		K = {"<cmd>Lspsaga hover_doc<cr>", "Hover Commands"},
		w = {'<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', "Add Workspace Folder"},
		W = {'<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', "Remove Workspace Folder"},
		l = {'<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>', "List Workspace Folders"},
		t = {'<cmd>lua vim.lsp.buf.type_definition()<cr>', "Type Definition"},
		d = {'<cmd>lua vim.lsp.buf.definition()<cr>', "Go To Definition"},
		D = {'<cmd>lua vim.lsp.buf.declaration()<cr>', "Go To Declaration"},
		r = {'<cmd>lua vim.lsp.buf.references()<cr>', "References"},
		R = {'<cmd>Lspsaga rename<cr>', "Rename"},
		a = {'<cmd>Lspsaga code_action<cr>', "Code Action"},
		e = {'<cmd>Lspsaga show_line_diagnostics<cr>', "Show Line Diagnostics"},
		n = {'<cmd>Lspsaga diagnostic_jump_next<cr>', "Go To Next Diagnostic"},
		N = {'<cmd>Lspsaga diagnostic_jump_prev<cr>', "Go To Previous Diagnostic"},
		x = {'<cmd>Trouble<cr>', 'Find trouble :(' }
	}
}, { prefix = '<leader>' })
