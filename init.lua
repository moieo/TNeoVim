-- By: Moieo
require("initialization")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://ghproxy.com/github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "folke/tokyonight.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- require("initialization")
      vim.cmd([[colorscheme tokyonight-storm]])
      vim.opt.termguicolors = true
    end,
  },
  {
    "kyazdani42/nvim-web-devicons",
    lazy = true,
  },
  -- Lualine
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine-config")
    end,
  },
  {
    "kdheepak/tabline.nvim",
    config = function()
      require("tabline-config")
    end,
  },
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
      "hrsh7th/cmp-vsnip",
      "saadparwaiz1/cmp_luasnip",
    },
  },
  -- 标签查看器
  "liuchengxu/vista.vim",
  -- 语法标签
  {
    "SmiteshP/nvim-navic",
    config = function()
      require("navic-config")
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("null-ls-config")
    end,
  },
  -- 对齐线
  "Yggdroot/indentLine",
  {
    "nvim-tree/nvim-tree.lua",
    tag = "nightly",
    config = function()
      require("nvimtree-config")
    end,
  },
  -- 语法高亮
  "leafgarland/typescript-vim",
  "leshill/vim-json",
  "vim-python/python-syntax",
  "posva/vim-vue",
  "udalov/kotlin-vim",
  -- 兼容 .vscode/tasks.json
  {
    "stevearc/overseer.nvim",
    config = function()
      require("overseer").setup()
    end
  },
  -- 补全括号
  "jiangmiao/auto-pairs",
  -- Terminal 终端
  {
    "s1n7ax/nvim-terminal",
    config = function()
      require("terminal-config")
    end,
  },

  -- 错误提示
  {
    "folke/trouble.nvim",
    config = function()
      require("trouble-config")
    end,
  },
  --缓冲区浏览器
  "jlanzarotta/bufexplorer",
  -- fzf 文件快速搜索
  "ibhagwan/fzf-lua",
}, {
  git = {
    log = { "-8" },
    timeout = 120,
    url_format = "https://ghproxy.com/github.com/%s.git",
    filter = true,
  },
})
