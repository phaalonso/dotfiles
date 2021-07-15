require('formatter').setup({
	logging = false,
	filetype = {
		javascript = {
			function()
				return {
					exe = "prettier",
					args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
					stdin = true
				}
			end
		},
		typescript = {
			function()
				return {
					exe = "eslint",
					args = {
						"--stdin-filename",
						vim.api.nvim_buf_get_name(0),
						"--fix",
						"--cache"
					},
					stdin = false
				}
			end
		}
	}
})
