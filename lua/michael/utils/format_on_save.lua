local M = {}

M.format_on_save = function()
  local bufnr = vim.api.nvim_get_current_buf()
  if vim.lsp.buf.server_ready() then
    vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 2000})
  end
end

return M
