-- By: Moieo
-- Configure lsp information display style
local M = {}

M.setup = function()
	-- replace the lsp info symbol
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	-- set the style of lsp info
	local config = {
		-- show signs
		signs = {
			active = signs,
		},
		underline = true,
		virtual_text = false,
		update_in_insert = false,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
      severity_limit = "Warning",
		},
	}

	vim.diagnostic.config(config)
  -- vim.api.nvim_command('autocmd CursorMoved * lua vim.diagnostic.open_float()')
	-- set the popup window border
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

return M
