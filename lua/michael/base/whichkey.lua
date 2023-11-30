return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			setup = {
				key_labels = {
					["<leader>"] = "SPC",
				},
				show_help = false,
				plugins = { spelling = true },
				triggers = "auto",
				window = {
					border = "single", -- none, single, double, shadow
					position = "bottom", -- bottom, top
					margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
					padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
					winblend = 0,
				},
				layout = {
					height = { min = 4, max = 25 }, -- min and max height of the columns
					width = { min = 20, max = 50 }, -- min and max width of the columns
					spacing = 3, -- spacing between columns
					align = "left", -- align columns left, center or right
				},
			},
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts.setup)
			local groups = {
				{ key = "C", name = "+Copilot" },
				{ key = "d", name = "+Debug" },
				{ key = "f", name = "+Find" },
				{ key = "g", name = "+Git" },
				{ key = "K", name = "+Kill" },
				{ key = "l", name = "+LSP" },
				{ key = "m", name = "+Markdown" },
				{ key = "n", name = "+Notifications" },
				{ key = "x", name = "+Diagnostics" },
				{ key = "t", name = "+Test" },
			}

			for _, group in ipairs(groups) do
				wk.register({
					[group.key] = {
						name = group.name,
					},
				}, { prefix = "<leader>" })
			end
		end,
	},
}
