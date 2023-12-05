local M = {}

M.load_snippets = function(file, ls)
	local snippets = {}

	local content = vim.fn.readfile(file)
	local json_content = table.concat(content, "\n")
	local status, parsed_snippets = pcall(vim.json.decode, json_content)

	if not status then
		print("Error parsing snippets file: " .. file)
		print("Error: " .. parsed_snippets)
		return {}
	end

	for name, snippet in pairs(parsed_snippets) do
		table.insert(
			snippets,
			ls.s({ trig = snippet.prefix, name = name, dscr = snippet.description }, {
				ls.i(1, snippet.body),
			})
		)
	end

	return snippets
end

return M
