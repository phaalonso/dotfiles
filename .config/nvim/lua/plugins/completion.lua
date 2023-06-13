return {
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },
  {
    "olexsmir/gopher.nvim",
    dependencies = { -- dependencies
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    ft = "go",
    config = function()
      require("gopher").setup({})
    end,
    build = function()
      vim.cmd([[silent! GoInstallDeps]])
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
  -- add symbols-outline
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },

  {
    "dmmulroy/tsc.nvim",
    config = function()
      require("tsc").setup({
        enable_progress_notifications = true,
      })
    end,
  },

  -- add tsserver and setup with typescript.nvim instead of lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      init = function()
        require("lazyvim.util").on_attach(function(_, buffer)
          -- stylua: ignore
          vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
          vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
        end)
      end,
    },
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- tsserver will be automatically installed with mason and loaded with lspconfig
        dockerls = {},
        docker_compose_language_service = {},
        intelephense = {
          ---@type lspconfig.options.intelephense
          init_options = {
            licenseKey = os.getenv("INTELEPHENSE_LICENSE_KEY"),
            files = {
              maxSize = 1000000,
            },
          },
        },
        ---@type lspconfig.options.lua_ls
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
              },
            },
          },
        },
        gopls = {
          cmd = { "gopls" },
          filetypes = { "go", "gomod", "gowork", "gotmpl" },
          settings = {
            gopls = {
              completeUnimported = true,
              usePlaceholders = true,
              analyses = {
                unusedparams = true,
              },
            },
          },
        },
        phpactor = {
          init_options = {
            ["language_server_phpstan.enabled"] = false,
            ["language_server_psalm.enabled"] = false,
            ["language_server.diagnostics_on_update"] = true,
            ["language_server.diagnostics_on_save"] = true,
            ["language_server.diagnostics_on_open"] = true,
          },
        },
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- Specify * to use this function as a fallback for any server
        tsserver = function(_, opts)
          require("lazyvim.util").on_attach(function(client, buffer)
            if client.name == "tsserver" then
              -- stylua: ignore
              vim.keymap.set("n", "<leader>co", "<cmd>TypescriptOrganizeImports<CR>", { buffer = buffer, desc = "Organize Imports" })
              -- stylua: ignore
              vim.keymap.set("n", "<leader>cR", "<cmd>TypescriptRenameFile<CR>", { desc = "Rename File", buffer = buffer })

              -- stop tsserver from handling formatting
              client.server_capabilities.documentFormattingProvider = false
              client.server_capabilities.documentRangeFormattingProvider = false
            end
          end)
          require("typescript").setup({ server = opts })
          return true
        end,
        -- ["*"] = function(server, opts) end,
        intelephense = function(_, opts)
          require("lazyvim.util").on_attach(function(client, buffer)
            -- Intelephense
            if client.name == "intelephense" then
              client.server_capabilities.documentFormattingProvider = true -- Formatting handled by null-ls
              client.server_capabilities.documentRangeFormattingProvider = true -- Formatting handled by null-ls

              client.server_capabilities.codeActionProvider = false -- Handled by phpactor
              client.server_capabilities.renameProvider = false -- Handled by phpactor
              -- vim.notify(vim.inspect(client.name))
              -- vim.notify(vim.inspect(client.server_capabilities))
            end
          end)
        end,
        phpactor = function(_, opts)
          require("lazyvim.util").on_attach(function(client, buffer)
            -- Phpactor
            if client.name == "phpactor" then
              client.server_capabilities.documentDiagnosticsProvider = false -- Diagnostics handled by intelephense

              client.server_capabilities.documentFormattingProvider = false -- Formatting handled by null-ls
              client.server_capabilities.documentRangeFormattingProvider = false -- Formatting handled by null-ls

              -- vim.notify(vim.inspect(client.name))
              -- vim.notify(vim.inspect(client.server_capabilities))
            end
          end)
        end,
      },
    },
  },
}
