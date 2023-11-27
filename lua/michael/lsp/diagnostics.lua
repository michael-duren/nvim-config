local m_icons = require("michael.core.icons")

vim.diagnostic.config({
	underline = true,
	virtual_text = {
		spacing = 4,
		prefix = "",
	},
	signs = true,
	update_in_insert = false,
	severity_sort = true,
})

vim.fn.sign_define(
	"DiagnosticSignError",
	{ text = m_icons.diagnostics.Error, texthl = "DiagnosticSignError", linehl = "", numhl = "DiagnosticSignError" }
)
vim.fn.sign_define(
	"DiagnosticSignWarn",
	{ text = m_icons.diagnostics.Warning, texthl = "DiagnosticSignWarn", numhl = "DiagnosticSignWarn" }
)
vim.fn.sign_define(
	"DiagnosticSignInfo",
	{ text = m_icons.diagnostics.Information, texthl = "DiagnosticSignInfo", numhl = "DiagnosticSignInfo" }
)
vim.fn.sign_define(
	"DiagnosticSignHint",
	{ text = m_icons.diagnostics.Hint, texthl = "DiagnosticSignHint", numhl = "DiagnosticSignHint" }
)
