local is_windows = require("michael.utils.is_windows")

local function get_dotnet_assembly_name(csproj_path)
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

local function get_dotnet_project_runtime()
	local cmd = "dotnet --list-runtimes"
	local f = io.popen(cmd)
	local runtimes = {}
	for line in f:lines() do
		local runtime = line:match("(.+) %(")
		if runtime then
			table.insert(runtimes, runtime)
		end
	end
	f:close()

	return runtimes
end

return get_dotnet_assembly_name
