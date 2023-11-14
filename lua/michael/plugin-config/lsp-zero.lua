local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.setup()

lsp.on_attach(function(client, bufnr)
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ timeout_ms = 2000 }) -- Increase timeout to 2000ms
      end,
    })
  end
end)
