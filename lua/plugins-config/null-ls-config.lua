-- By: Moieo
local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.prettier.with({
			filetypes = {
				"html",
				"json",
				"yaml",
				"markdown",
				"vue",
				"css",
				"typescript",
				"typescriptreact",
				"scss",
				"less",
			},
		}),
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.completion.spell,
	},
	null_ls.builtins.diagnostics.shellcheck.with({
		diagnostic_config = {
			-- see :help vim.diagnostic.config()
			underline = true,
			virtual_text = false,
			signs = true,
			update_in_insert = false,
			severity_sort = true,
		},
	}),
})
