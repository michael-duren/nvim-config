require("ccc").setup({
	opts = {},
	cmd = { "CccPick", "CccConvert", "CccHighlighterEnable", "CccHighlighterDisable", "CccHighlighterToggle" },
	keys = {
		{ "<leader>zCp", "<cmd>CccPick<cr>", desc = "Pick" },
		{ "<leader>zCc", "<cmd>CccConvert<cr>", desc = "Convert" },
		{ "<leader>zCh", "<cmd>CccHighlighterToggle<cr>", desc = "Toggle Highlighter" },
	},
})
