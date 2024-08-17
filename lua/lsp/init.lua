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
    download_url_template = "https://github.com/%s/releases/download/%s/%s",
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
  require("lsp.keybindings").maplsp(bufnr)
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
    "html",
    "perlnavigator",
    "rust_analyzer",
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
  "html",
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

-- NeoVim 开发的支持
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
lspconfig.lua_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
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

lspconfig.emmet_language_server.setup({
  filetypes = {
    "css",
    "eruby",
    "html",
    "javascript",
    "javascriptreact",
    "less",
    "sass",
    "scss",
    "svelte",
    "pug",
    "typescriptreact",
    "vue",
  },
  init_options = {
    --- @type table<string, any> https://docs.emmet.io/customization/preferences/
    preferences = {},
    --- @type "always" | "never" defaults to `"always"`
    showexpandedabbreviation = "always",
    --- @type boolean defaults to `true`
    showabbreviationsuggestions = true,
    --- @type boolean defaults to `false`
    showsuggestionsassnippets = false,
    --- @type table<string, any> https://docs.emmet.io/customization/syntax-profiles/
    syntaxprofiles = {},
    --- @type table<string, string> https://docs.emmet.io/customization/snippets/#variables
    variables = {},
    --- @type string[]
    excludelanguages = {},
  },
})

lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      diagnostics = {
        enable = true,
      },
    },
  },
})

-- after start lsp server config....
-- change info style of lsp
require("lsp.handlers").setup()
-- start cmp
require("lsp.cmp")
