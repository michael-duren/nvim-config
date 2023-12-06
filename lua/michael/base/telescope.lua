return {
	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		cmd = "Telescope",
		keys = {
			{
				"<leader>fr",
				"<cmd>Telescope oldfiles<cr>",
				desc = "Telescope old files",
			},
			{
				"<leader>fb",
				"<cmd>Telescope buffers<cr>",
				desc = "Telescope buffers",
			},
			{
				"<leader>ff",
				"<cmd>Telescope find_files<cr>",
				desc = "Telescope find files",
			},
			{
				"<leader>ft",
				"<cmd>Telescope live_grep<cr>",
				desc = "Telescope live grep",
			},
			{
				"<leader>fd",
				"<cmd>Telescope diagnostics<cr>",
				desc = "Telescope diagnostics",
			},
			{
				"<leader>fs",
				"<cmd>Telescope current_buffer_fuzzy_find<cr>",
				desc = "Telescope current buffer fuzzy find",
			},
			{
				"<leader>fh",
				"<cmd>Telescope help_tags<cr>",
				desc = "Telescope help tags",
			},
			{
				"<leader>fp",
				"<cmd>Telescope commands<cr>",
				desc = "Telescope commands",
			},
			{
				"<leader>fk",
				"<cmd>Telescope keymaps<cr>",
				desc = "Telescope keymaps",
			},
			-- git telescope
			{
				"<leader>gb",
				"<cmd>Telescope git_branches<CR>",
				desc = "Git branches",
			},
			{
				"<leader>gc",
				"<cmd>Telescope git_commits<CR>",
				desc = "Git commits",
			},
			-- find help
			{
				"<leader>fh",
				"<cmd>Telescope help_tags<CR>",
				desc = "Find help",
			},
		},
		opts = {
			deafults = {
				mappings = {
					i = {
						["<C-j>"] = function(...)
							require("telescope.actions").move_selection_next(...)
						end,
						["<C-k>"] = function(...)
							require("telescope.actions").move_selection_previous(...)
						end,
						["<C-n>"] = function(...)
							require("telescope.actions").cycle_history_next(...)
						end,
						["<C-p>"] = function(...)
							require("telescope.actions").cycle_history_prev(...)
						end,
					},
				},
			},
		},
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)
			telescope.load_extension("fzf")
			-- Add harpoon to telescope
			telescope.load_extension("harpoon")

			-- Telescope live_grep in git root
			-- Function to find the git root directory based on the current buffer's path
			local function find_git_root()
				-- Use the current buffer's path as the starting point for the git search
				local current_file = vim.api.nvim_buf_get_name(0)
				local current_dir
				local cwd = vim.fn.getcwd()
				-- If the buffer is not associated with a file, return nil
				if current_file == "" then
					current_dir = cwd
				else
					-- Extract the directory from the current file's path
					current_dir = vim.fn.fnamemodify(current_file, ":h")
				end

				-- Find the Git root directory from the current file's path
				local git_root =
					vim.fn.systemlist("git -C " .. vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")[1]
				if vim.v.shell_error ~= 0 then
					print("Not a git repository. Searching on current working directory")
					return cwd
				end
				return git_root
			end

			local function live_grep_git_root()
				local git_root = find_git_root()
				if git_root then
					require("telescope.builtin").live_grep({
						search_dirs = { git_root },
					})
				end
			end

			vim.api.nvim_create_user_command("LiveGrepGitRoot", live_grep_git_root, {})
		end,
	},
}
