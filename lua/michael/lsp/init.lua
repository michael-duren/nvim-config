local lsp_zero = require("lsp-zero")
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
}

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = servers,
	handlers = {
		lsp_zero.default_setup,
	},
})

local lspconfig = require("lspconfig")
local lsp_windows = require("lspconfig.ui.windows").default_options
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Prevent multiple instance of lsp servers
-- if file is sourced again
if vim.g.lsp_setup_ready == nil then
	vim.g.lsp_setup_ready = true

	lsp_windows.border = "rounded"

	-- See :help lspconfig-setup
	lspconfig.html.setup({ capabilities = lsp_capabilities })
	lspconfig.cssls.setup({ capabilities = lsp_capabilities })
	lspconfig.eslint.setup({ capabilities = lsp_capabilities })
	-- configure lua lsp
	lspconfig.lua_ls.setup({
		capabilities = lsp_capabilities,
		cmd = { "lua-language-server" },
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
					disable = { "missing-fields" },
				},
				runtime = {
					version = "LuaJIT",
					path = vim.split(package.path, ";"),
				},
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
					},
				},
			},
		},
	})

	lspconfig.tsserver.setup({
		capabilities = lsp_capabilities,
		settings = {
			completions = {
				completeFunctionCalls = true,
			},
		},
	})

	local lsp_window_settings = {
		border = "rounded",
	}

	for _, server in ipairs(servers) do
		lspconfig[server].setup({
			handlers = {
				["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, lsp_window_settings),
				["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, lsp_window_settings),
			},
		})
	end
end
