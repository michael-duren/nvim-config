return {
	-- -- mason - lsp
	{
		"williamboman/mason.nvim",
		lazy = false,
		cmd = "Mason",
		build = ":MasonUpdate",
		opts = {
			ensure_installed = {
				"shfmt",
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")
			local function ensure_installed()
				for _, tool in ipairs(opts.ensure_installed) do
					local p = mr.get_package(tool)
					if not p:is_installed() then
						p:install()
					end
				end
			end
			if mr.refresh then
				mr.refresh(ensure_installed)
			else
				ensure_installed()
			end
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			local servers = {
				"clangd",
				"cssls",
				"cssmodules_ls",
				"emmet_ls",
				"eslint",
				"html",
				"jsonls",
				"lemminx",
				"lua_ls",
				"omnisharp",
				"rust_analyzer",
				"tsserver",
				"vimls",
				"html",
			}
			require("mason-lspconfig").setup({ ensure_installed = servers })
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "j-hui/fidget.nvim", config = true },
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		opts = {
			servers = {},
			setup = {},
			format = {
				timeout_ms = 3000,
			},
		},
		config = function(plugin, opts)
			require("michael.base.lsp.servers").setup(plugin, opts)
			local client = vim.lsp.start_client({
				cmd = { "/Users/michaelduren/Code/learning/go/go_educational_lsp/main" },
				name = "go_educational_lsp",
			})

			if not client then
				vim.notify("Failed to start go_educational_lsp", vim.log.levels.ERROR)
			end

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "markdown",
				callback = function()
					vim.lsp.buf_attach_client(0, client)
				end,
			})
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "BufReadPre",
		dependencies = { "mason.nvim" },
		opts = function()
			local nls = require("null-ls")
			return {
				root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
				sources = {
					nls.builtins.formatting.shfmt,
				},
			}
		end,
	},

	-- schemastore
	{ "b0o/schemastore.nvim" },
	{ "arkav/lualine-lsp-progress" },

	-- neodev, autocomplete for api for neovim
	{ "folke/neodev.nvim", opts = {} },
}
