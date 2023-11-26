local dap = require("dap")
local dotnet_utils = require("michael.utils.dotnet_utils")
local installed_path = dotnet_utils.get_dotnet_core_debugger()

if installed_path == nil then
	print("No dotnet core debugger found")
	installed_path = "netcoredbg"
end

dap.adapters.coreclr = {
	type = "executable",
	command = dotnet_utils.get_dotnet_core_debugger(),
	args = { "--interpreter=vscode" },
}
dap.adapters.netcoredbg = {
	type = "executable",
	command = dotnet_utils.get_dotnet_core_debugger(),
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
				return vim.fn.input(vim.fn.getcwd() .. "/bin/Debug/net8.0/")
			end
			local runtime = dotnet_utils.get_dotnet_project_runtime(vim.fn.getcwd() .. "/" .. proj_name .. ".csproj")

			if runtime == nil then
				print("Unable to find TargetFramework in csproj file")
				return vim.fn.input(vim.fn.getcwd() .. "/bin/Debug/net8.0/" .. proj_name)
			end

			return vim.fn.input(
				vim.fn.getcwd() .. "/bin/Debug/" .. runtime .. "/" .. proj_name .. dotnet_utils.get_debug_extension()
			)
		end,
	},
}
