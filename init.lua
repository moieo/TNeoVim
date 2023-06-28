-- By: Moieo
require("config.initialization")
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
  spec = {
    { import = "plugins" },
  },
  git = {
    log = { "-8" },
    timeout = 120,
    url_format = "https://ghproxy.com/github.com/%s.git",
    filter = true,
  },
})
