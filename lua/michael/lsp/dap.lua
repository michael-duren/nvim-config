local dap, dapui = require("dap"), require("dapui")
local m_icons = require("michael.core.icons")
local dotnet_utils = require("michael.utils.dotnet_utils")

dap.adapters.coreclr = {
	type = "executable",
	command = "/usr/local/bin/netcoredbg/netcoredbg",
	args = { "--interpreter=vscode" },
}

dap.configurations.cs = {
	{
		type = "coreclr",
		name = "launch - netcoredbg",
		request = "launch",
		program = function()
			local proj_name = dotnet_utils.get_dotnet_assembly_name()
			if proj_name == nil then
				print("No .csproj file found")
				return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/net8.0/", "file")
			end
			local runtime = dotnet_utils.get_dotnet_project_runtime(vim.fn.getcwd() .. "/" .. proj_name .. ".csproj")

			if runtime == nil then
				print("Unable to find TargetFramework in csproj file")
				return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/net8.0/" .. proj_name, "file")
			end

			return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/" .. runtime .. "/" .. proj_name, "file")
		end,
	},
}

dapui.setup({
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
	},
	expand_lines = true,
	layouts = {
		elements = {
			{ id = "scopes", size = 0.25 },
			{ "breakpoints", size = 0.25 },
			{ id = "stacks", size = 0.25 },
			{ id = "watches", size = 0.25 },
		},
		size = 40,
		position = "left",
		{
			elements = {
				{ id = "repl", size = 0.5 },
				{ id = "console", size = 0.5 },
			},
			size = 0.25, -- 25% of total lines
			position = "bottom", -- bottom panel
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
		max_height = nil, -- These can be integers or a float between 0 and 1.
		max_width = nil, -- Floats will be treated as percentage of your screen.
		mappings = {
			close = { "q", "<Esc>" },
		},
		border = "rounded",
	},
	windows = { indent = 1 },
	render = {
		max_type_length = nil, -- can be int or nil
		max_value_lines = 100,
		indent = 1,
	},
})

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end
