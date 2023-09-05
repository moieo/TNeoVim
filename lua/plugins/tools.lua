return {
  {
    "stevearc/overseer.nvim",
    config = function()
      require("overseer").setup()
    end,
  },
  --缓冲区浏览器
  "jlanzarotta/bufexplorer",
  -- fzf 文件快速搜索
  "ibhagwan/fzf-lua",
  {
    "s1n7ax/nvim-terminal",
    config = function()
      require("plugins-config.terminal-config")
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    tag = "nightly",
    config = function()
      require("plugins-config.nvimtree-config")
    end,
  },
  "liuchengxu/vista.vim",
  "jiangmiao/auto-pairs",
}
