-- By: Moieo
require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
	github = {
		download_url_template = "https://ghproxy.com/github.com/%s/releases/download/%s/%s",
	},
})

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

local lspconfig = require("lspconfig")
local navic = require("nvim-navic")
local function on_attach(client, bufnr)
	-- 语法标签
	navic.attach(client, bufnr)
	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
end

-- Setup lspconfig.
require("mason-lspconfig").setup({
	-- 确保安装，根据需要填写
	ensure_installed = {
		"lua_ls",
		"pyright",
		"clangd",
		"jdtls",
		"tsserver",
		"jsonls",
		"yamlls",
		"bashls",
		"gopls",
		"kotlin_language_server",
		"volar",
		"perlnavigator",
	},
})

local servers = {
	"clangd",
	"pyright",
	"jdtls",
	"tsserver",
	"jsonls",
	"yamlls",
	"bashls",
	"gopls",
	"volar",
	"perlnavigator",
}
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { "utf-16" }
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

lspconfig.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim", "opt" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

lspconfig.kotlin_language_server.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	-- cmd = { "kotlin-language-server", "-jvm-target 17" },
	settings = {
		kotlin = {
			compiler = {
				jvm = {
					target = "1.8",
				},
			},
		},
	},
})

lspconfig.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	init_options = {
		preferences = {
			-- fix: File is a CommonJS module; it may be converted to an ES6 module.
			disableSuggestions = true,
		},
	},
})

lspconfig.jsonls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		json = {
			comments = {
				lineComment = "//",
			},
		},
	},
})

-- after start lsp server config....
-- change info style of lsp
require("lsp.handlers").setup()
-- start cmp
require("lsp.cmp")
