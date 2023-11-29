local ok, comment = pcall(require, "Comment")
if not ok then
	return
end

local function pre_hook(ctx)
	local U = require("Comment.utils")

	local location = nil
	if ctx.ctype == U.ctype.blockwise then
		location = require("ts_context_commentstring.utils").get_cursor_location()
	else
		location = require("ts_context_commentstring.utils").get_visual_start_location()
	end

	return require("ts_context_commentstring.internal").calculate_commentstring({
		key = ctx.ctype == U.ctype.linewise and "__default" or "__multiline",
		location = location,
	})
end

comment.setup({
	---Add a space b/w comment and the line
	---@type boolean
	padding = true,
	---Line which should be ignored while comment/uncomment.
	---Could be a regex string or a function that returns a regex string.
	---Example: Use '^$' to ignore empty lines
	---@type string|function
	ignore = nil,
	---Whether to create basic (operator-pending) and extended mappings for NORMAL/VISUAL mode
	---@type table
	mappings = {
		---operator-pending mapping
		---Includes `gcc`, `gcb`, `gc[count]{motion}` and `gb[count]{motion}`
		basic = true,
		---extended mapping
		---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
		extended = true,
	},
	-- -LHS of line and block comment toggle mapping in NORMAL/VISUAL mode
	-- -@type table
	toggler = {
		---line-comment toggle
		line = "<leader>/",
		---block-comment toggle
		block = "gbc",
	},
	---LHS of line and block comment operator-mode mapping in NORMAL/VISUAL mode
	---@type table
	opleader = {
		---line-comment opfunc mapping
		line = "<leader>/",
		---block-comment opfunc mapping
		block = "gb",
	},
	---Pre-hook, called before commenting the line
	---@type function|nil
	pre_hook = pre_hook,
	---Post-hook, called after commenting is done
	---@type function|nil
	post_hook = nil,
	extra = {
		above = "gcO",
		below = "gco",
		eol = "gcA",
	},
	sticky = true,
})

-- quicker loading, less backwords compatibility
vim.g.skip_ts_context_commentstring_module = true

-- disable previous gb and gc mappings
vim.api.nvim_set_keymap("n", "gb", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gc", "<Nop>", { noremap = true, silent = true })
