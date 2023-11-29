local ok, ccc = pcall(require, "ccc")

if not ok then
	error("Failed to load ccc: " .. ccc)
end

ccc.setup()
