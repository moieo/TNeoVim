-- By: Moieo
-- By: Moieo
vim.cmd([[packadd packer.nvim]])

require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	-- Theme
	use({
		"folke/tokyonight.nvim",
		branch = "main",
	})

	-- Lualine
	use("nvim-lualine/lualine.nvim")
	-- tabline
	use({
		"kdheepak/tabline.nvim",
		requires = { { "hoob3rt/lualine.nvim", opt = true }, { "kyazdani42/nvim-web-devicons", opt = true } },
	})
	-- If you want to have icons in your statusline choose one of these
	use("kyazdani42/nvim-web-devicons")

	-- lsp
	-- use "williamboman/nvim-lsp-installer"
	-- use 'neovim/nvim-lspconfig'
	-- use 'williamboman/mason.nvim'
	-- use 'williamboman/mason-lspconfig.nvim'
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})

	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp", --neovim 内置 LSP 客户端的 nvim-cmp 源
			--以下插件可选，可以根据个人喜好删减
			"onsails/lspkind-nvim", --美化自动完成提示信息
			"hrsh7th/cmp-buffer", --从buffer中智能提示
			"hrsh7th/cmp-nvim-lua", --nvim-cmp source for neovim Lua API.
			-- "octaltree/cmp-look", --用于完成英语单词
			"hrsh7th/cmp-path", --自动提示硬盘上的文件
			"hrsh7th/cmp-calc", --输入数学算式（如1+1=）自动计算
			-- "f3fora/cmp-spell", --nvim-cmp 的拼写源基于 vim 的拼写建议
			"hrsh7th/cmp-emoji", --输入: 可以显示表情
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-vsnip",
			"saadparwaiz1/cmp_luasnip",
		},
	})

	use("hrsh7th/vim-vsnip")

	-- 标签查看器
	use("liuchengxu/vista.vim")

	-- 语法标签
	-- navic
	use("SmiteshP/nvim-navic")

	-- 格式化
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("null-ls").setup()
		end,
		requires = { "nvim-lua/plenary.nvim" },
	})

	-- 异步语法检查
	-- use 'dense-analysis/ale'

	-- 对齐线
	use("Yggdroot/indentLine")

	-- 文件树
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})

	-- 语法高亮
	use("leafgarland/typescript-vim")
	use("leshill/vim-json")
	use("vim-python/python-syntax")
	use("posva/vim-vue")
	use("udalov/kotlin-vim")

	-- 任务插件
	use({
		"stevearc/overseer.nvim",
		config = function()
			require("overseer").setup()
		end,
	})

	-- 补全括号
	use("jiangmiao/auto-pairs")

	-- Terminal
	use("s1n7ax/nvim-terminal")

	-- 错误提示
	use({
		"folke/trouble.nvim",
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
	})

  -- 缓冲区浏览器
  use("jlanzarotta/bufexplorer")
end)
-- 初始化配置
require("initialization")

-- navic
require("navic-config")

-- lualine
require("lualine-config")

-- tabline
require("tabline-config")

-- lsp
require("lsp")

-- null-ls
require("null-ls-config")

-- nvim-tree
require("nvimtree-config")

-- null-ls
require("null-ls-config")

-- nvim-tree
require("nvimtree-config")

-- trouble
require("trouble-config")

-- terminal
require("terminal-config")
