local cmp = require('cmp')
local lspkind = require 'lspkind'
local lspkingConfig = require 'config._lspkind'

cmp.setup({
	completion = {
		completopt = "menu, menuone, noinsert"
	},
	mapping = {
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4), ['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm({
			select = true,
		}),
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end,
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'buffer', keywork_length = 5 },
		{ name = 'vsnip' },
		-- { name = "path" },
		{ name = 'nvim_path' },
		-- { name = 'nvim_lua' },
		{ name = 'cmp_git' },
	}),
	formatting = {
		format = {lspkind.cmp_format({
			menu = lspkingConfig.symbol_map
		})},
	},
	experimental = {
		native_menu = false,
		ghost_text = true
	},
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	}
})

--[[ cmp.setup.cmdline('/', {
	sources = {
		{ name = 'buffer' }
	}
})

cmp.setup.cmdline(':', {
	sources = cmp.config.sources({
		{ name = 'path' },
		{ name = 'cmdline' }
	})
}) ]]

require("cmp_git").setup({
    filetypes = { "gitcommit" },
    remotes = { "upstream", "origin" }, -- in order of most to least prioritized
    git = {
        commits = {
            limit = 100,
        },
    },
    github = {
        issues = {
            filter = "all", -- assigned, created, mentioned, subscribed, all, repos
            limit = 100,
            state = "open", -- open, closed, all
        },
        mentions = {
            limit = 100,
        },
        pull_requests = {
            limit = 100,
            state = "open", -- open, closed, merged, all
        },
    },
})

