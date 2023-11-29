local lspconfig = require("lspconfig")
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

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
