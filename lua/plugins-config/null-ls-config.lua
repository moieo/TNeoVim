-- By: Moieo
local null_ls = require("null-ls")
local helpers = require("null-ls.helpers")

-- 设置文件类型
vim.cmd("autocmd BufNewFile,BufRead Caddyfile setlocal filetype=Caddyfile")

-- 创建 Caddy 格式化器
local caddy_fmt = helpers.make_builtin({
	method = null_ls.methods.FORMATTING,
	filetypes = { "Caddyfile" },
	generator_opts = {
		command = "caddy",
		args = { "fmt", "$FILENAME" },
		format = "raw",
	},
	factory = helpers.formatter_factory,
})

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.prettier.with({
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
				"css",
				"scss",
				"less",
				"html",
				"json",
				"jsonc",
				"yaml",
				"markdown",
				"markdown.mdx",
				"graphql",
				"handlebars",
			},
		}),
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.diagnostics.golangci_lint,
		null_ls.builtins.diagnostics.fish,
		null_ls.builtins.diagnostics.flake8,
		null_ls.builtins.diagnostics.jsonlint,
		null_ls.builtins.diagnostics.php,
		null_ls.builtins.diagnostics.yamllint,
		null_ls.builtins.formatting.perltidy,
		null_ls.builtins.formatting.phpcsfixer,
		null_ls.builtins.formatting.autopep8,
		null_ls.builtins.formatting.beautysh,
		null_ls.builtins.formatting.fish_indent,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.rustfmt,
		null_ls.builtins.formatting.clang_format,
		null_ls.builtins.formatting.cmake_format,
		null_ls.builtins.formatting.nginx_beautifier,
		null_ls.builtins.formatting.sqlformat,
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
		caddy_fmt,
	},
})
