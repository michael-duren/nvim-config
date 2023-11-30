local M = {}

local lsp_utils = require("michael.base.lsp.utils")
local m_icons = require("michael.core.icons")

local function lsp_init()
	-- LSP handlers configuration
	local signs = {
		{ name = "DiagnosticSignError", text = m_icons.diagnostics.Error },
		{ name = "DiagnosticSignWarn", text = m_icons.diagnostics.Warning },
		{ name = "DiagnosticSignHint", text = m_icons.diagnostics.Hint },
		{ name = "DiagnosticSignInfo", text = m_icons.diagnostics.Info },
	}
	local config = {
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
		},
		diagnostic = {
			underline = true,
			virtual_text = {
				spacing = 2,
				prefix = m_icons.ui.Circle,
				severity = vim.diagnostic.severity.ERROR,
			},
			signs = {
				active = signs,
			},
			update_in_insert = false,
			severity_sort = true,
			float = {
				focusable = true,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		},
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
	end

	-- Diagnostic configuration
	vim.diagnostic.config(config.diagnostic)

	-- Hover configuration
	-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, config.float)

	-- Signature help configuration
	-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, config.float)
end

function M.setup(_, opts)
	lsp_utils.on_attach(function(client, bufnr)
		require("michael.base.lsp.format").on_attach(client, bufnr)
	end)

	lsp_init() -- diagnostics, handlers

	local servers = opts.servers
	local capabilities = lsp_utils.capabilities()

	local function setup(server)
		local server_opts = vim.tbl_deep_extend("force", {
			capabilities = capabilities,
		}, servers[server] or {})

		if opts.setup[server] then
			if opts.setup[server](server, server_opts) then
				return
			end
		elseif opts.setup["*"] then
			if opts.setup["*"](server, server_opts) then
				return
			end
		end
		local ready, lspconfig = pcall(require, "lspconfig")
		if ready and lspconfig[server].setup then
			lspconfig[server].setup(server_opts)
		end
	end

	-- get all the servers that are available thourgh mason-lspconfig
	local have_mason, mlsp = pcall(require, "mason-lspconfig")
	local all_mslp_servers = {}
	if have_mason then
		all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
	end

	local ensure_installed = {} ---@type string[]
	for server, server_opts in pairs(servers) do
		if server_opts then
			server_opts = server_opts == true and {} or server_opts
			-- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
			if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
				setup(server)
			else
				ensure_installed[#ensure_installed + 1] = server
			end
		end
	end

	if have_mason then
		mlsp.setup({ ensure_installed = ensure_installed })
		mlsp.setup_handlers({ setup })
	end
end

return M
