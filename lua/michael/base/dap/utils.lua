local M = {}

M.register_dap_icons = function()
  local m_icons = require("michael.core.icons")

  vim.fn.sign_define(
    "DapBreakpoint",
    { text = m_icons.ui.Bug, texthl = "DiagnosticSignError", linehl = "", numhl = "DiagnosticSignError" }
  )
  vim.fn.sign_define("DapStopped", { text = m_icons.ui.Bug, texthl = "", linehl = "DiagnosticSignError", numhl = "" })
  vim.fn.sign_define(
    "DapStopped",
    { text = m_icons.ui.BoldArrowRight, texthl = "", linehl = "DiagnosticSignWarn", numhl = "DiagnosticSignWarn" }
  )

  vim.fn.sign_define("DapBreakpointRejected", {
    text = m_icons.ui.Bug,
    texthl = "DiagnosticSignError",
    linehl = "",
    numhl = "",
  })

  vim.fn.sign_define("DapStopped", {
    text = m_icons.ui.BoldArrowRight,
    texthl = "DiagnosticSignWarn",
    linehl = "Visual",
    numhl = "DiagnosticSignWarn",
  })
end

return M
