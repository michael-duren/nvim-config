local function is_windows()
	return vim.loop.os_uname().sysname == "Windows_NT"
end

return is_windows
