-- global table to keep track of buffers
local buffer_history = {}

local function update_buf_history()
	local bufnr = vim.api.nvim_get_current_buf()
	local buftype = vim.api.nvim_buf_get_option(bufnr, "buftype")
	local bufname = vim.api.nvim_buf_get_name(bufnr)

	if buftype == "terminal" or buftype == "nofile" or bufname == "" then
		return
	end

	-- Remove the current buffer if it's already in the table
	for _, v in ipairs(buffer_history) do
		if v == bufnr then
			table.remove(buffer_history, bufnr)
			break
		end
	end

	-- Add the current buffer to the start of the table
	if bufnr ~= 1 then
		table.insert(buffer_history, 1, bufnr)
	end
end

-- Setup autocommand
vim.api.nvim_create_autocmd("BufEnter", {
	callback = update_buf_history,
})

-- Function to toggle between two most recent buffers
function ToggleBuffer()
	if #buffer_history > 1 then
		-- Switch to the second most recent buffer
		vim.api.nvim_set_current_buf(buffer_history[2])
	end
end

vim.api.nvim_set_keymap("n", "<C-a>", ":lua ToggleBuffer()<CR>", { noremap = true, silent = true })
