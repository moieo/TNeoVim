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
local lspconfig = require("lspconfig")
local navic = require("nvim-navic")
local function on_attach(client, bufnr)
	-- 语法标签
	navic.attach(client, bufnr)
	-- Mappings.
  require('lsp.keybindings').maplsp(bufnr)
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
					target = "17",
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
