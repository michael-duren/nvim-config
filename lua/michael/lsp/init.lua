local m_icons = require("michael.core.icons")
local servers = {
	"clangd",
	"cssls",
	"cssmodules_ls",
	"emmet_ls",
	"eslint",
	"html",
	"jsonls",
	"lemminx",
	"lua_ls",
	"omnisharp",
	"rust_analyzer",
	"tsserver",
	"vimls",
	"html",
}
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = servers,
})

local lspconfig = require("lspconfig")
local lsp_windows = require("lspconfig.ui.windows").default_options
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

-- configure signs
local signs = {
	{ name = "DiagnosticSignError", text = m_icons.diagnostics.Error },
	{ name = "DiagnosticSignWarn", text = m_icons.diagnostics.Warning },
	{ name = "DiagnosticSignHint", text = m_icons.diagnostics.Hint },
	{ name = "DiagnosticSignInfo", text = m_icons.diagnostics.Info },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
end

-- general diagnostic config
local config = {
	float = {
		focusable = true,
		style = "minimal",
		border = "rounded",
	},
	diagnostic = {
		underline = true,
		virtual_text = {
			spacing = 2,
			prefix = m_icons.ui.Circle,
			severity = vim.diagnostic.severity.ERROR,
		},
		signs = {
			active = signs,
		},
		update_in_insert = false,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	},
}

vim.diagnostic.config(config.diagnostic)

-- configure global lsp settings
if vim.g.lsp_setup_ready == nil then
	vim.g.lsp_setup_ready = true

	lsp_windows.border = "rounded"

	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = "*",
		callback = require("michael.utils.format_on_save").format_on_save,
	})

	for _, server in ipairs(servers) do
		lspconfig[server].setup({
			handlers = {
				["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, config.float),
				["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, config.float),
			},
		})
	end
end

require("michael.lsp.web")
require("michael.lsp.lua")
require("michael.lsp.rust")
require("michael.lsp.csharp")
