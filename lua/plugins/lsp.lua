return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("lsp")
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", --neovim 内置 LSP 客户端的 nvim-cmp 源
      --以下插件可选，可以根据个人喜好删减
      "onsails/lspkind-nvim", --美化自动完成提示信息
      "hrsh7th/cmp-buffer",   --从buffer中智能提示
      "hrsh7th/cmp-nvim-lua", --nvim-cmp source for neovim Lua API.
      -- "octaltree/cmp-look", --用于完成英语单词
      "hrsh7th/cmp-path",     --自动提示硬盘上的文件
      -- "hrsh7th/cmp-calc", --输入数学算式（如1+1=）自动计算
      -- "f3fora/cmp-spell", --nvim-cmp 的拼写源基于 vim 的拼写建议
      "hrsh7th/cmp-emoji", --输入: 可以显示表情
      "hrsh7th/cmp-cmdline",
      {
        "L3MON4D3/LuaSnip",
        version = "2.*",
        build = "make install_jsregexp",
        dependencies = {
          "saadparwaiz1/cmp_luasnip",     -- Snippets source for nvim-cmp
          "rafamadriz/friendly-snippets", --代码段合集
        },
        config = function()
          require("plugins-config.luasnip-config")
        end,
      },
    },
  },
  {
    "folke/trouble.nvim",
    config = function()
      require("plugins-config.trouble-config")
    end,
  },
  "leafgarland/typescript-vim",
  "leshill/vim-json",
  "vim-python/python-syntax",
  "posva/vim-vue",
  "udalov/kotlin-vim",
  {
    "SmiteshP/nvim-navic",
    config = function()
      require("plugins-config.navic-config")
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("plugins-config.null-ls-config")
    end,
  },
  "khaveesh/vim-fish-syntax", -- fish shell syntax
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require 'nvim-treesitter.configs'.setup {
        ensure_installed = {},
        sync_install = false,
        auto_install = false,
        ignore_install = {},
        highlight = {
          enable = true,
          disable = {},
          additional_vim_regex_highlighting = false,
        },
      }
    end
  }
}
