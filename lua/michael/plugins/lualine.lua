local icons = require("michael.core.icons")

local function show_active_lsp_clients()
	local clients = vim.lsp.get_active_clients()
	if next(clients) == nil then
		return ""
	end

	local client_names = {}
	for _, client in pairs(clients) do
		table.insert(client_names, client.name)
	end

	return "[" .. table.concat(client_names, ", ") .. "]"
end

local function trim_text(text, max_length)
	if text:len() > max_length then
		return text:sub(1, max_length - 3) .. "..."
	end
end

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = icons.misc.HalfCircleRightThin, right = icons.misc.HalfCircleLeftThin },
		section_separators = { left = icons.misc.HalfCircleRight, right = icons.misc.HalfCircleLeft },
		disabled_filetypes = {
			statusline = { "alpha" },
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	extensions = {
		"nvim-tree",
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			{
				"branch",
				fmt = function(str)
					return trim_text(str, 15)
				end,
			},
			{
				"diff",
				format = function(str)
					return trim_text(str, 15)
				end,
			},
			{
				"diagnostics",
				format = function(str)
					return trim_text(str, 15)
				end,
			},
		},
		lualine_c = { "filename" },
		lualine_x = { { show_active_lsp_clients, icons_enabled = true, icon = icons.ui.Stacks, padding = 2 } },
		lualine_y = { "encoding", "fileformat", "filetype" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
})
