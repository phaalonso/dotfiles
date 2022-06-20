local nvim_lsp = require('lspconfig')
local lsp_installer = require('nvim-lsp-installer')
local cmp = require 'cmp'

require('config.lsp.cmp')

-- local null_ls = require("null-ls")

--[[ null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.code_actions.eslint_d,
        -- null_ls.builtins.formatting.prettier -- prettier, eslint, eslint_d, or prettierd
    },
}) ]]

-- Servidores a serem instalados caso não sejam encontrados
local servers_required = {
  'html',
  'pyright',
  'sumneko_lua',
  'vimls',
  'tsserver',
  'gopls' 
}

-- Install servers present in `servers_required` list
for _, name in pairs(servers_required) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found then
    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  end
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Inicializa os servidores instalados pelo nvim-lsp-install
lsp_installer.on_server_ready(function(server)
    local opts = { capabilities = capabilities }

	-- Customizando LSP para LUA
    if server.name == "sumneko_lua" then
		opts = vim.tbl_deep_extend("force", {
			settins = {
				Lua = {
					diagnostics = {
						-- Get the LSP to recognize the `vim` global
						globals = { 'vim' }
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true)
					},
					telemetry = { enable = false }
				}
			}
		}, opts)
    end
	
	--[[ 
	-- Customizando LSP para TS
	if server.name == 'tsserver' then
		opts.on_attach = function(client)
		opts.init_options = require("nvim-lsp-ts-utils").init_options
			local ts_utils = require("nvim-lsp-ts-utils")

			ts_utils.setup {
				eslint_bin = "eslint_d",
			}

			-- required to fix code action ranges and filter diagnostics
			ts_utils.setup_client(client)
			on_attach(client)

			local opts_key = { silent = true }
			vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts_key)
			vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts_key)
		end
	end ]]

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)

-- nvim_lsp.eslint.setup{}

--[[ nvim_lsp.tsserver.setup {
	init_options = require("nvim-lsp-ts-utils").init_options,
	capabilities = capabilities,
	on_attach = function(client)
        local ts_utils = require("nvim-lsp-ts-utils")

        ts_utils.setup {
            eslint_bin = "eslint_d",
        }

        -- required to fix code action ranges and filter diagnostics
        ts_utils.setup_client(client)
		on_attach(client)
		local opts = { silent = true }
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)
	end,
} ]]
