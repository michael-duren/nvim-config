local nvim_lsp = require("lspconfig")

local on_attach = function(_, bufnr)
	-- other stuff --
	require("tailwindcss-colors").buf_attach(bufnr)
end

nvim_lsp["tailwindcss"].setup({
	-- other settings --
	on_attach = on_attach,
})
