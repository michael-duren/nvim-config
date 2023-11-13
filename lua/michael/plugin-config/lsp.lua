local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(_, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr })
end)

---
-- Replace these language servers
-- with the ones you have installed in your system
---
-- local servers = {
--   'bashls',
--   'clangd',
--   'cmake',
--   'cssls',
--   'dockerls',
--   'gopls',
--   'html',
--   'jsonls',
--   'pyright',
--   'rust_analyzer',
--   'sumneko_lua',
--   'tsserver',
--   'vimls',
--   'yamlls',
-- }

require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { "tsserver" },
  handlers = {
    lsp_zero.default_setup,
  },
})

local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Prevent multiple instance of lsp servers
-- if file is sourced again
if vim.g.lsp_setup_ready == nil then
  vim.g.lsp_setup_ready = true

  -- See :help lspconfig-setup
  lspconfig.html.setup({ capabilities = lsp_capabilities, })
  lspconfig.cssls.setup({ capabilities = lsp_capabilities, })
  lspconfig.eslint.setup({ capabilities = lsp_capabilities, })
  -- configure lua lsp
  lspconfig.lua_ls.setup({
    capabilities = lsp_capabilities,
    cmd = { "lua-language-server" },
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        runtime = {
          version = 'LuaJIT',
          path = vim.split(package.path, ';'),
        },
        workspace = {
          library = {
            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
            [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
          },
        },
      },
    },
  })

  lspconfig.tsserver.setup({
    capabilities = lsp_capabilities,
    settings = {
      completions = {
        completeFunctionCalls = true
      }
    },
  })
end
