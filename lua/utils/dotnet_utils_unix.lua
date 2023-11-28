local M = {}

function M.get_dotnet_assembly_name(csproj_path)
	local default_path = vim.fn.getcwd() .. "/"
	local path = csproj_path or default_path
	local cmd

	if not csproj_path then
		cmd = 'ls "' .. default_path .. '"*.csproj 2> /dev/null'
	end

	local f_path = io.popen(cmd)
	if f_path ~= nil then
		path = f_path:read("*l") -- read the first line
		f_path:close()
	end

	if not path then
		return nil, "No .csproj file found"
	end

	local name_with_extension = path:match("([^/\\]+)%.csproj$")
	if not name_with_extension then
		return nil, "No .csproj file found"
	end

	return name_with_extension
end

function M.get_dotnet_project_runtime(csproj_path)
	local file = io.open(csproj_path, "r")
	if not file then
		return nil, "Unable to open csproj file"
	end

	local target_framework = nil

	for line in file:lines() do
		if line:find("<TargetFramework>") then
			target_framework = line:match("<TargetFramework>(.-)</TargetFramework>")
			break
		end
	end

	file:close()

	if not target_framework then
		return nil, "Unable to find TargetFramework in csproj file"
	end

	return target_framework
end

function M.get_dotnet_core_debugger()
	local file_name = "/netcoredbg"
	local debugger_path = vim.fn.getenv("HOME") .. "/.local/bin" .. file_name

	if vim.fn.executable(debugger_path) == 1 then
		return debugger_path
	else
		print("Unable to find netcoredbg")
		return "netcoredbg"
	end
end

function M.get_debug_extension()
	return ".dll"
end

return M
