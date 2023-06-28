return {
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
      require("plugins-config.lualine-config")
    end,
  },
  {
    "kdheepak/tabline.nvim",
    config = function()
      require("plugins-config.tabline-config")
    end,
  },
  "Yggdroot/indentLine",
}
