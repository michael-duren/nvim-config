local is_windows = require("michael.utils.is_windows")
local M = {}

function M.get_dotnet_assembly_name(csproj_path)
	local default_path = vim.fn.getcwd() .. "/"
	local path = csproj_path or default_path
	local cmd

	if not csproj_path then
		if is_windows() then
			cmd = 'dir "' .. default_path .. '" /B | findstr .csproj'
		else
			cmd = 'ls "' .. default_path .. '"*.csproj 2> /dev/null'
		end

		local f_path = io.popen(cmd)
		if f_path ~= nil then
			path = f_path:read("*l") -- read the first line
			f_path:close()
		end
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

function M.get_dotnet_core_debugger_mason()
	local mason_registry = require("mason-registry")
	local mason = require("mason")
	if not mason_registry.is_installed("netcoredbg") then
		print("netcoredbg is not installed")
		return nil, "netcoredbg is not installed"
	end
	local debugger = mason_registry.get_package("netcoredbg")
	print("Debugger " .. debugger:get_install_path() .. "/netcoredbg")
	if debugger == nil then
		print("Failed to retrieve netcoredbg from Mason registry.")
		return nil, "Failed to retrieve netcoredbg from Mason registry."
	end
	print("Debugger " .. debugger:get_install_path() .. "/netcoredbg")
	if debugger:is_installed() then
		return debugger:get_install_path() .. "/netcoredbg"
	end
end

function M.get_dotnet_core_debugger()
	local main
	local secondary
	local directory_name = "netcoredbg"
	local file_name = "/netcoredbg"
	local home = vim.fn.getenv("HOME")

	if is_windows() then
		main = "C:\\Program Files\\" .. directory_name
		secondary = home .. "\\AppData\\Local\\" .. directory_name
	else
		main = home .. "/.local/bin/" .. directory_name
		secondary = "/usr/local/bin/" .. directory_name
	end

	local found_main = vim.fn.finddir(main, "")
	if found_main ~= "" then
		return main .. file_name
	end

	local found_secondary = vim.fn.finddir(secondary, "")
	if found_secondary ~= "" then
		return secondary .. file_name
	end

	print("Unable to find netcoredbg")
	return nil, "Unable to find netcoredbg"
end

function M.get_debug_extension()
	if is_windows() then
		return ".exe"
	else
		return ".dll"
	end
end

return M
