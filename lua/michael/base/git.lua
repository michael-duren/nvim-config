return {
	-- fugitive
	{
		"tpope/vim-fugitive",
		keys = {
			{
				"<leader>gd",
				"<cmd> Gvdiffsplit <CR>",
				desc = "View diff for file",
			},
			{
				"<leader>gs",
				"<cmd> G<CR>",
				desc = "Git status",
			},
			{
				"<leader>gp",
				"<cmd> Git push<CR>",
				desc = "Git push",
			},
			{
				"<leader>gP",
				"<cmd> Git pull<CR>",
				desc = "Git pull",
			},
			{
				"<leader>gC",
				"<cmd> Git commit<CR>",
				desc = "Git commit",
			},
			{
				"<leader>gl",
				"<cmd> Git log<CR>",
				desc = "Git log",
			},
		},
	},

	-- gitsigns
	{
		"lewis6991/gitsigns.nvim",

		event = "BufRead",
		config = function()
			local icons = require("michael.core.icons")

			require("gitsigns").setup({
				signs = {
					add = {
						hl = "GitSignsAdd",
						text = icons.ui.BoldLineLeft,
						numhl = "GitSignsAddNr",
						linehl = "GitSignsAddLn",
					},
					change = {
						hl = "GitSignsChange",
						text = icons.ui.BoldLineLeft,
						numhl = "GitSignsChangeNr",
						linehl = "GitSignsChangeLn",
					},
					delete = {
						hl = "GitSignsDelete",
						text = icons.ui.Triangle,
						numhl = "GitSignsDeleteNr",
						linehl = "GitSignsDeleteLn",
					},
					topdelete = {
						hl = "GitSignsDelete",
						text = icons.ui.Triangle,
						numhl = "GitSignsDeleteNr",
						linehl = "GitSignsDeleteLn",
					},
					changedelete = {
						hl = "GitSignsChange",
						text = icons.ui.BoldLineLeft,
						numhl = "GitSignsChangeNr",
						linehl = "GitSignsChangeLn",
					},
				},
				signcolumn = true,
				numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
				linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
				word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
				watch_gitdir = {
					follow_files = true,
				},
				attach_to_untracked = true,
				current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
					delay = 1000,
					ignore_whitespace = false,
					virt_text_priority = 100,
				},
				current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
				sign_priority = 6,
				update_debounce = 100,
				status_formatter = nil, -- Use default
				max_file_length = 40000, -- Disable if file is longer than this (in lines)
				preview_config = {
					-- Options passed to nvim_open_win
					border = "single",
					style = "minimal",
					relative = "cursor",
					row = 0,
					col = 1,
				},
				yadm = {
					enable = false,
				},
			})
		end,
	},
}
