local lsp = require("lsp-zero")

require("neodev").setup()
require("inc_rename").setup()
require("lsp_lines").setup()


--lsp.preset("recommended")

lsp.set_preferences({
  suggest_lsp_servers = true,
  setup_servers_on_start = true,
  set_lsp_keymaps = true,
  configure_diagnostics = true,
  cmp_capabilities = true,
  manage_nvim_cmp = true,
  call_servers = 'local',
  sign_icons = {
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = ''
  },
})

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'sumneko_lua',
  'rust_analyzer',
  'intelephense',
  'jdtls'
})

-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      },
      completion = {
        callSnippet = "Replace"
      }
    }
  }
})

lsp.configure('jdtls', {
  vmargs = {
    "-XX:+UseParallelGC",
    "-XX:GCTimeRatio=4",
    "-XX:AdaptiveSizePolicyWeight=90",
    "-Dsun.zip.disableMemoryMapping=true",
    "-Djava.import.generatesMetadataFilesAtProjectRoot=false",
    "-Xmx1G",
    "-Xms100m",
  },
  use_lombok_agent = true
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

local lspkind = require('lspkind')

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
    })
  }
})

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I'
  }
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gD", "<cmd>Trouble lsp_definitions<CR>", opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "gR", "<cmd>Trouble lsp_references<CR>", opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "gI", "<cmd>Trouble lsp_implementations<CR>", opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>lr", ":IncRename ", opts)
  --vim.keymap.set("n", "<leader>rn", function()
  --  return ":IncRename " .. vim.fn.expand("<cword>")
  --  end, { expr = true })
  vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

  vim.keymap.set("", "<leader>ll", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })
end)

--lsp.nvim_workspace()
lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
  virtual_lines = { only_current_line = true }
})

require("typescript").setup({})


-------------------------
-- Null ls
-------------------------

local null_ls = require("null-ls")
local null_opts = lsp.build_options('null-ls', {})

local diagnostics = null_ls.builtins.diagnostics;
local formatting = null_ls.builtins.formatting;
local code_actions = null_ls.builtins.code_actions;

null_ls.setup({
  on_attach = function(client, bufnr)
    null_opts.on_attach(client, bufnr)

    -- Format using only null-ls
    local format_cmd = function(input)
      vim.lsp.buf.format({
        id = client.id,
        timeout_ms = 5000,
        async = input.bang,
      })
    end

    local bufcmd = vim.api.nvim_buf_create_user_command
    bufcmd(bufnr, 'NullFormat', format_cmd, {
      bang = true,
      range = true,
      desc = 'Format using null-ls'
    })
  end,
  debug = false,
  debounce = 150,
  update_in_insert = false,
  sources = {
    code_actions.eslint_d,
    diagnostics.eslint_d.with({
      diagnostics_format = "[#{s}] #{m}\n(#{c})",
    }),
    code_actions.refactoring,
    code_actions.shellcheck,
    diagnostics.shellcheck,
    diagnostics.php,
    --diagnostics.phpmd,
    diagnostics.phpstan,
    diagnostics.todo_comments,
    formatting.editorconfig_checker,
    null_ls.builtins.formatting.prettierd,
    --null_ls.builtins.formatting.stylua,
    --null_ls.builtins.formatting.shfmt,
  },
})

-- Use mason.nvim to facilitate installing null-ls builtins
require('mason-null-ls').setup({
  ensure_installed = nil,
  automatic_installation = true,
  automatic_setup = false,
})
