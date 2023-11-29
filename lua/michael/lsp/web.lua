local lspconfig = require("lspconfig")
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
local tailwind = require("michael.lsp.tailwind")

if vim.g.lsp_setup_ready == nil then
	tailwind.tailwindcss_config()
	-- See :help lspconfig-setup
	-- web stuff
	lspconfig.html.setup({ capabilities = lsp_capabilities })
	lspconfig.cssls.setup({ capabilities = lsp_capabilities })
	lspconfig.eslint.setup({ capabilities = lsp_capabilities })
	lspconfig.emmet_ls.setup({
		capabilities = lsp_capabilities,
		settings = {
			emmet = {
				config = {
					options = {
						["bem.enabled"] = true,
						["jsx.enabled"] = true,
					},
				},
			},
		},
	})

	lspconfig.tailwindcss.setup({
		capabilities = lsp_capabilities,
		settings = {
			tailwindCSS = {
				lint = {
					cssConflict = "warning",
					invalidApply = "error",
					invalidConfigPath = "error",
					invalidScreen = "error",
					invalidTailwindDirective = "error",
					invalidVariant = "error",
					recommendedVariantOrder = "warning",
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
end
