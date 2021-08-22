local nvim_lsp = require'lspconfig'
local handlers = vim.lsp.handlers 

--print(nvim_lsp)

local on_attach = function(client, bufnr)
   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
   local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

   buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

   -- Mappings.
   local opts = { noremap=true, silent=true }
   buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
   buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
   buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
   buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
   buf_set_keymap('n', 'gs', ':Lspsaga lsp_finder<CR>', opts)
   buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
   buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
   buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
   buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
   buf_set_keymap('n', '<space>ca', ':Lspsaga code_action<CR>', opts)
   buf_set_keymap('v', '<space>ca', ':Lspsaga range_code_action<CR>', opts)
   buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
   buf_set_keymap('n', '<space>rn', ':Lspsaga rename<CR>', opts)
   buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
   buf_set_keymap('n', '[d', ':Lspsaga diagnostic_jump_prev<CR>', opts)
   buf_set_keymap('n', ']d', ':Lspsaga diagnostic_jump_next<CR>', opts)
   buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)


   buf_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
   buf_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
   buf_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
   buf_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

   -- Map compe confirm and complete functions
   buf_set_keymap('i', '<cr>', 'compe#confirm("<cr>")', { expr = true })
   buf_set_keymap('i', '<c-space>', 'compe#complete()', { expr = true })

   -- Set some keybinds conditional on server capabilities
   if client.resolved_capabilities.document_formatting then
	   buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
   end
   if client.resolved_capabilities.document_range_formatting then
   buf_set_keymap("v", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
   end

   -- Set autocommands conditional on server_capabilities
   if client.resolved_capabilities.document_highlight then
   vim.api.nvim_exec([[
   hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
   hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
   hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
   augroup lsp_document_highlight
   	autocmd! * <buffer>
   	autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
   	autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
   augroup END
   ]], false)
   end

   -- local pop_opts = { border = "rounded", max_width = 85 }
   -- handlers["textDocument/hover"] = vim.lsp.with(handlers.hover, pop_opts)
   -- handlers["textDocument/signatureHelp"] = vim.lsp.with(handlers.signature_help, pop_opts)
end


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

nvim_lsp.diagnosticls.setup {
	on_attach = on_attach,
	filetypes = {"javascript", "javascriptreact", "typescript", "typescriptreact", "css"},
	init_options = {
		filetypes = {
			javascript = "eslint",
			typescript = "eslint",
			javascriptreact = "eslint",
			typescriptreact = "eslint"
		},
		linters = {
			eslint = {
				sourceName = "eslint",
				command = "./node_modules/.bin/eslint",
				rootPatterns = {
					".eslitrc.js",
					"package.json"
				},
				debounce = 100,
				args = {
					"--cache",
					"--stdin",
					"--stdin-filename",
					"%filepath",
					"--format",
					"json"
				},
				parseJson = {
					errorsRoot = "[0].messages",
					line = "line",
					column = "column",
					endLine = "endLine",
					endColumn = "endColumn",
					message = "${message} [${ruleId}]",
					security = "severity"
				},
				securities = {
					[2] = "error",
					[1] = "warning"
				}
			}
		}
	}
}

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
local servers = { "rust_analyzer", "gopls", "tsserver" }

-- print(on_attach)
-- print(capabilities)
-- print(servers)

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
   	 capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

nvim_lsp.pyright.setup{
	cmd = { "pyright-langserver", "--stdio" },
	on_attach = on_attach,
	capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    },
}

nvim_lsp.html.setup {
	cmd = { "html-languageserver", "--stdio" },
	filetypes = { "html" },
	init_options =  {
		configurationSection = { "html", "css", "javascript" },
		embeddedLanguages = {
			css = true,
			javascript = true,
		}
	}
}

nvim_lsp.ccls.setup {
   init_options = {
	   compilationDatabaseDirectory = "build";
	   index = {
		   threads = 0;
	   };
	   clang = {
		   excludeArgs = { "-frounding-math"} ;
	   };
   }
}

--require('flutter-tools').setup {
	--ui = {
		---- the border type to use for all floating windows, the same options/formats
		---- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
		--border = "rounded",
	--},
	--widget_guides = {
		--enabled = false,
	--},
	--lsp = {
		--on_attach = on_attach,
		--capabilities = capabilities,
		--flags = {
			--debounce_text_changes = 150
		--}
	--}
--}
