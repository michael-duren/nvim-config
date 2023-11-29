local lspconfig = require("lspconfig")
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
local cmp = require("cmp")

local function tailwindcss_config()
	local tw = require("lspconfig.server_configurations.tailwindcss")
	local filetypes_excluded = { "markdown" }

	local new_filetypes = vim.tbl_filter(function(ft)
		return not vim.tbl_contains(filetypes_excluded, ft)
	end, tw.default_config.filetypes)

	lspconfig.tailwindcss.setup({
		capabilities = lsp_capabilities,
		filetypes = new_filetypes,
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
end
