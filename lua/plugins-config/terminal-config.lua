vim.o.hidden = true
require("nvim-terminal").setup({
  window = {
    -- Do `:h :botright` for more information
    -- NOTE: width or height may not be applied in some "pos"
    position = "botright",
    -- Do `:h split` for more information
    split = "sp",
    -- Width of the terminal
    width = 50,
    -- Height of the terminal
    height = 10,
  },
})
