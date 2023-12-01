local lspconfig = require("lspconfig")
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
local cmp = require("cmp")
local M = {}

M.tailwindcss_config = function()
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

-- Custom formatter for nvim-cmp
M.custom_cmp_formatter = function(entry, item)
	local format_kinds = cmp.config.formatting.format
	format_kinds(entry, item)
	return require("tailwindcss-colorizer-cmp").formatter(entry, item)
end

return M
