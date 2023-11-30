return {
	-- nuget specific
	-- cmp nuget
	{ "PasiBergman/cmp-nuget" },
	-- cmp
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{ "hrsh7th/cmp-cmdline" }, -- Cmdline completions
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" }, -- source for builtin LSP client
			{ "hrsh7th/cmp-buffer" }, -- source for buffer words
			{ "hrsh7th/cmp-path" }, -- source for paths
		},
		lazy = false,
		opts = function()
			local cmp = require("cmp")
			require("cmp-nuget").setup({})

			return {
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nuget", keyword_length = 0 },
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
				}),
				formatting = {
					source_name = {
						nuget = "(NuGet)",
					},
				},
			}
		end,
	},
}
