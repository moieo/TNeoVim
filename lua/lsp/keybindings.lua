-- By: Moieo
local pluginKeys = {}

-- lsp 回调函数快捷键设置
pluginKeys.maplsp = function(bufnr)
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts) -- 重命名
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	-- code action
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	-- go xx
	vim.keymap.set("n", "gh", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	-- diagnostic
	vim.keymap.set("n", "go", vim.diagnostic.open_float, bufopts)
	vim.keymap.set("n", "gp", vim.diagnostic.goto_prev, bufopts)
	vim.keymap.set("n", "gn", vim.diagnostic.goto_next, bufopts)
	-- vim.keymap.set('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', bufopts)
	-- leader + =
	-- vim.keymap.set("n", "<leader>=", vim.lsp.buf.formatting, bufopts)
	-- vim.keymap.set('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', bufopts)
	-- vim.keymap.set('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', bufopts)
	-- vim.keymap.set('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', bufopts)
	-- vim.keymap.set('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', bufopts)
	-- vim.keymap.set('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', bufopts)
end

return pluginKeys
