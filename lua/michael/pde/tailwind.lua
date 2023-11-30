if not require("michael.core").pde.tailwind then
	return {}
end

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"themaxmarchuk/tailwindcss-colors.nvim",
		},
		opts = {
			servers = {
				tailwindcss = {
					filetypes_exclude = { "markdown" },
				},
			},
			setup = {
				tailwindcss = function(_, opts)
					local tw = require("lspconfig.server_configurations.tailwindcss")
					require("tailwindcss-colors").setup()
					local on_attach = function(_, bufnr)
						-- other stuff --
						require("tailwindcss-colors").buf_attach(bufnr)
					end
					tw.default_config.on_attach = on_attach
					opts.filetypes = vim.tbl_filter(function(ft)
						return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
					end, tw.default_config.filetypes)
				end,
			},
		},
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{ "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
		},
		opts = function(_, opts)
			local format_kinds = opts.formatting.format
			opts.formatting.format = function(entry, item)
				format_kinds(entry, item)
				return require("tailwindcss-colorizer-cmp").formatter(entry, item)
			end
		end,
	},
}
