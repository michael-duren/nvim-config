return {
	-- dap
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{ "rcarriga/nvim-dap-ui" },
			{ "theHamsta/nvim-dap-virtual-text" },
		},
    -- stylua: ignore
    keys = {
      { "<leader>dR", function() require("dap").run_to_cursor() end,                               desc = "Run to Cursor", },
      { "<leader>dE", function() require("dapui").eval(vim.fn.input "[Expression] > ") end,        desc = "Evaluate Input", },
      { "<leader>dC", function() require("dap").set_breakpoint(vim.fn.input "[Condition] > ") end, desc = "Conditional Breakpoint", },
      { "<leader>dU", function() require("dapui").toggle() end,                                    desc = "Toggle UI", },
      { "<leader>db", function() require("dap").step_back() end,                                   desc = "Step Back", },
      { "<leader>dc", function() require("dap").continue() end,                                    desc = "Continue", },
      { "<leader>dd", function() require("dap").disconnect() end,                                  desc = "Disconnect", },
      { "<leader>de", function() require("dapui").eval() end,                                      mode = { "n", "v" },             desc = "Evaluate", },
      { "<leader>dg", function() require("dap").session() end,                                     desc = "Get Session", },
      { "<leader>dh", function() require("dap.ui.widgets").hover() end,                            desc = "Hover Variables", },
      { "<leader>dS", function() require("dap.ui.widgets").scopes() end,                           desc = "Scopes", },
      { "<leader>di", function() require("dap").step_into() end,                                   desc = "Step Into", },
      { "<leader>do", function() require("dap").step_over() end,                                   desc = "Step Over", },
      { "<leader>dp", function() require("dap").pause.toggle() end,                                desc = "Pause", },
      { "<leader>dq", function() require("dap").close() end,                                       desc = "Quit", },
      { "<leader>dr", function() require("dap").repl.toggle() end,                                 desc = "Toggle REPL", },
      { "<leader>ds", function() require("dap").continue() end,                                    desc = "Start", },
      { "<leader>dt", function() require("dap").toggle_breakpoint() end,                           desc = "Toggle Breakpoint", },
      { "<leader>dx", function() require("dap").terminate() end,                                   desc = "Terminate", },
      { "<leader>du", function() require("dap").step_out() end,                                    desc = "Step Out", },
    },
		opts = {},
		config = function(plugin, opts)
			local m_icons = require("michael.core.icons")
			require("nvim-dap-virtual-text").setup({
				commented = true,
			})
			require("michael.base.dap.utils").register_dap_icons()

			local dap, dapui = require("dap"), require("dapui")
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

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			if opts.setup then
				-- set up debugger
				for k, _ in pairs(opts.setup) do
					opts.setup[k](plugin, opts)
				end
				return
			end

			print("No debugger setup found")
		end,
	},
}
