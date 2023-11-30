return {
	-- start of base
	{ "nvim-lua/popup.nvim" },
	{ "nvim-lua/plenary.nvim" },

	-- nvim tree
	-- copilot
	{
		"github/copilot.vim",
		lazy = false,
	},
	-- auto pairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	-- nvim colorizer
	{ "norcalli/nvim-colorizer.lua", event = "BufRead" },
	-- rust tools
	{ "simrat39/rust-tools.nvim" },
	-- tailwindcss colors
	{
		"themaxmarchuk/tailwindcss-colors.nvim",
		-- load only on require("tailwindcss-colors")
		-- run the setup function after plugin is loaded
		config = function()
			-- pass config options here (or nothing to use defaults)
			require("tailwindcss-colors").setup()
		end,
	},
	{ "norcalli/nvim-colorizer.lua" }, -- colorize hex colors
	-- markdown preview
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	-- CSS color stuff
	{ "uga-rosa/ccc.nvim", opts = {} },
	-- matching
	{
		"andymass/vim-matchup",
		event = "CursorMoved",
		setup = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,
	},
}
