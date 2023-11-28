local wk = require("which-key")

wk.setup({
	show_help = false,
	plugins = { spelling = true },
	key_labels = {
		["<leader>"] = "SPC",
	},
	triggers = "auto",
})

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
}

for _, group in ipairs(groups) do
	wk.register({
		[group.key] = {
			name = group.name,
		},
	}, { prefix = "<leader>" })
end
