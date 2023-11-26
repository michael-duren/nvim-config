local dap = require("dap")

dap.adapters.coreclr = {
	type = "executable",
	command = "/usr/local/bin/netcoredbg/netcoredg",
	args = { "--interpreter=vscode" },
}

dap.configurations.cs = {
	type = "coreclr",
	name = "launch - netcoredbg",
	request = "launch",
	program = function()
		return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
	end,
}