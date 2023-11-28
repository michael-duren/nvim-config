local function augroup(name)
	return vim.api.nvim_create_augroup("michaelduren" .. name, { clear = true })
end

-- check spelling in text filetypes and wrap
vim.api.nvim_create_autocmd("Filetype", {
	group = augroup("spellcheck"),
	pattern = { "git_commits", "markdown", "text", "textile", "vimwiki" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

-- Go to last loction when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup("last_loc"),
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})
