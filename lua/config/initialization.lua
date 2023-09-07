-- By: Moieo
-- 主题
-- vim.cmd([[colorscheme tokyonight-storm]])
--
-- vim.opt.termguicolors = true
-- 显示行号
vim.o.number = 1
-- 高亮光标所在列
-- vim.o.cursorcolumn
-- tab 宽度
vim.o.tabstop = 2
-- 高亮光标所在行
vim.o.cursorline = 1
-- 自动缩进时,缩进长度
vim.o.shiftwidth = 2
-- 输入Tab字符时,自动替换成空格
-- vim.o.expandtab = 1
-- 自动缩进
vim.o.autoindent = 1
-- softtabstop的值为负数,会使用shiftwidth的值,两者保持一致,方便统一缩进.
vim.o.softtabstop = -1
-- 空格代替tab
vim.cmd([[set expandtab]])
-- 取消自动折行
vim.cmd([[set nowrap]])
-- 语法检查
vim.cmd([[syntax on]])

-- 鼠标拖动
vim.cmd([[set mouse-=i]])

vim.api.nvim_set_keymap("n", "z<tab>", ":tabnext<CR>", {})
vim.api.nvim_set_keymap("n", "ztn", ":tabnew<CR>", {})

-- 对齐线
vim.g["indentLine_enabled"] = 1
vim.g["indentLine_char"] = "┊"
vim.g["indentLine_conceallevel"] = 2
-- 语法高亮
-- Python
vim.g["python_highlight_all"] = 1
-- Vue
vim.g["vue_pre_processors"] = { "pug", "scss" }
-- vim.api.nvim_set_keymap('', '<c-f>', ':Neoformat<CR>', { noremap = true })
-- 任务插件
-- require("overseer").setup()
-- 任务管理器
vim.api.nvim_set_keymap("n", "ztt", ":OverseerToggle<CR>", {})
vim.api.nvim_set_keymap("n", "zto", ":OverseerRun<CR>", {})
vim.api.nvim_set_keymap("n", "ztc", ":OverseerRunCmd<CR>", {})
-- vista 开关
vim.api.nvim_set_keymap("n", "zv", ":Vista!!<CR>", {})

-- 切换窗格
vim.api.nvim_set_keymap("n", "z<down>", "<C-w><down>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "z<up>", "<C-w><up>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "z<left>", "<C-w><left>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "z<right>", "<C-w><right>", { noremap = true, silent = true })

-- 内置终端
vim.api.nvim_set_keymap("t", "<ESC>", "<C-\\><C-n>", { noremap = true })

vim.api.nvim_set_keymap("n", "zfm", "<cmd>lua vim.lsp.buf.format({ timeout_ms = 5000 })<CR>", { silent = true })

-- vim.api.nvim_set_keymap("n", "zgh", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", {})

-- 打开缓冲区浏览器
vim.api.nvim_set_keymap("n", "zb", "<cmd>BufExplorerVerticalSplit<CR>", {})

-- 文件搜索热键
vim.api.nvim_set_keymap("n", "zs", "<cmd>FzfLua files<CR>", {})

-- 恢复缓冲区光标位置
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.fn.setpos(".", vim.fn.getpos("'\""))
      vim.cmd("silent! foldopen")
    end
  end,
})

-- 保存时格式化代码
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function() end,
})

-- 代码折叠
-- vim.o.foldmethod = 'indent'

-- 文件类型工具
--[[
local setFileType = function(pattern, type_)
	vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
		pattern = pattern,
		callback = function()
			vim.o.filetype = type_
		end,
	})
end ]]
