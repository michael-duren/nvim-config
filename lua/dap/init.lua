local dap, dapui = require("dap"), require("dapui")
local m_icons = require("michael.core.icons")

vim.fn.sign_define(
	"DapBreakpoint",
	{ text = m_icons.ui.Bug, texthl = "DiagnosticSignError", linehl = "", numhl = "DiagnosticSignError" }
)
vim.fn.sign_define("DapStopped", { text = m_icons.ui.Bug, texthl = "", linehl = "DiagnosticSignError", numhl = "" })
vim.fn.sign_define(
	"DapStopped",
	{ text = m_icons.ui.BoldArrowRight, texthl = "", linehl = "DiagnosticSignWarn", numhl = "DiagnosticSignWarn" }
)

vim.fn.sign_define("DapBreakpointRejected", {
	text = m_icons.ui.Bug,
	texthl = "DiagnosticSignError",
	linehl = "",
	numhl = "",
})

vim.fn.sign_define("DapStopped", {
	text = m_icons.ui.BoldArrowRight,
	texthl = "DiagnosticSignWarn",
	linehl = "Visual",
	numhl = "DiagnosticSignWarn",
})

dap.set_log_level("INFO")

dapui.setup({
	force_buffers = true,
	icons = {
		expanded = m_icons.ui.TriangleShortArrowDown,
		collapsed = m_icons.ui.TriangleShortArrowRight,
		current_frame = m_icons.ui.BoldArrowRight,
	},
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	element_mappings = {},
	expand_lines = true,
	layouts = {
		{
			elements = {
				{ id = "scopes", size = 0.33 },
				{ id = "breakpoints", size = 0.17 },
				{ id = "stacks", size = 0.25 },
				{ id = "watches", size = 0.25 },
			},
			size = 0.33,
			position = "right",
		},
		{
			elements = {
				{ id = "repl", size = 0.45 },
				{ id = "console", size = 0.55 },
			},
			size = 0.27,
			position = "bottom",
		},
	},
	controls = {
		element = "repl",
		enabled = true,
		icons = {
			pause = m_icons.dap.Pause,
			play = m_icons.dap.Play,
			terminate = m_icons.dap.Stop,
			run_last = m_icons.dap.RunLast,
			step_into = m_icons.dap.StepInto,
			step_out = m_icons.dap.StepOut,
			step_over = m_icons.dap.StepOver,
			step_back = m_icons.dap.StepBack,
		},
	},
	floating = {
		max_height = 0.9,
		max_width = 0.5,
		border = "rounded",
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
	render = {
		max_type_length = nil,
		max_value_lines = 100,
		indent = 2,
	},
})
--
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end
