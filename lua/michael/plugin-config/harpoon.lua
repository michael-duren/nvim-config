local harpoon = require("harpoon")

harpoon.setup({
	global_settings = {
		save_on_toggle = true,
		save_on_change = true,
	},
})

-- Binding for going to specific marks
for i = 1, 10, 1 do
	vim.keymap.set(
		"n",
		"<leader>" .. i,
		"<cmd>lua require('harpoon.ui').nav_file(" .. i .. ")<CR>",
		{ noremap = true, silent = true }
	)
end
