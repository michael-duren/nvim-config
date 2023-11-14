local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	-- mason
	{
		"williamboman/mason.nvim",
	},
	-- alpha-nvim
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	},
	-- Comment
	{
		"numToStr/Comment.nvim",
		opts = {
			-- add any options here
			sticky = true,
		},
		lazy = false,
	},
	-- nvim tree
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	-- mason - lsp
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },
	-- zero - lsp
	{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
	{ "neovim/nvim-lspconfig" },
	-- null-ls
	{
		"jose-elias-alvarez/null-ls.nvim",
		lazy = false,
	},
	-- cmp
	{ "hrsh7th/cmp-nvim-lsp" }, -- source for builtin LSP client
	{ "hrsh7th/nvim-cmp", lazy = false }, -- completion plugin
	{ "L3MON4D3/LuaSnip" }, -- Lua snippets engine
	{ "hrsh7th/cmp-buffer" }, -- source for buffer words
	{ "hrsh7th/cmp-path" }, -- source for paths
	{ "hrsh7th/cmp-cmdline" }, -- Cmdline completions
	{ "saadparwaiz1/cmp_luasnip" },
	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		-- run = ":TSUpdate",
		config = function()
			local utils = require("lvim.utils")
			local path = utils.join_paths(get_runtime_dir(), "site", "pack", "lazy", "opt", "nvim-treesitter")
			vim.opt.rtp:prepend(path) -- treesitter needs to be before nvim's runtime in rtp
			require("lvim.core.treesitter").setup()
		end,
		cmd = {
			"TSInstall",
			"TSUninstall",
			"TSUpdate",
			"TSUpdateSync",
			"TSInstallInfo",
			"TSInstallSync",
			"TSInstallFromGrammar",
		},
		event = "User FileOpened",
	},
	-- friendly snippets
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	-- whichkey
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},
	-- theme
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},

	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzy-native.nvim" },
		},
	},
	{ "nvim-lua/popup.nvim" },
	{ "nvim-lua/plenary.nvim" },
	-- toggle term
	{ "akinsho/toggleterm.nvim", version = "*", config = true },
	-- gitsigns
	{ "lewis6991/gitsigns.nvim" },
	-- copilot
	{
		"github/copilot.vim",
		lazy = false,
	},
	-- auto pairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	-- schemastore
	{ "b0o/schemastore.nvim" },
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	-- bufferline
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
	-- lua line
	{
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
		lazy = false,
	},
	{ "arkav/lualine-lsp-progress" },
	-- nvim colorizer
	{ "norcalli/nvim-colorizer.lua", event = "BufRead" },
	-- rust tools
	{ "simrat39/rust-tools.nvim" },
	-- dap
	{ "mfussenegger/nvim-dap" },
	{ "theHamsta/nvim-dap-virtual-text" },
	{ "rcarriga/nvim-dap-ui" },
	-- barbeque
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		opts = {
			-- configurations go here
		},
	},
	{ "folke/neodev.nvim", opts = {} },
}

require("lazy").setup(plugins)
require("mason").setup()
