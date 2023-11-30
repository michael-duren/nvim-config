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
	-- {
	-- 	"hrsh7th/nvim-cmp",
	-- 	dependencies = {
	-- 		{ "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
	-- 	},
	-- 	opts = function(_, _)
	-- 		local formatter = require("tailwindcss-colorizer-cmp").formatter
	-- 		require("cmp").config.formatting = {
	-- 			format = formatter,
	-- 		}
	-- 	end,
	-- },
}
