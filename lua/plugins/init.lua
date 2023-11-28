return {
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
		build = ":TSUpdate",
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
	-- telescope
	{ "nvim-telescope/telescope.nvim" },
	{ "nvim-lua/popup.nvim" },
	{ "nvim-lua/plenary.nvim" },
	-- toggle term
	{ "akinsho/toggleterm.nvim", version = "*", config = true },
	-- git stuff
	-- gitsigns
	{ "lewis6991/gitsigns.nvim" },
	-- fugitive
	{ "tpope/vim-fugitive" },
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
	-- neodev, autocomplete for api for neovim
	{ "folke/neodev.nvim", opts = {} },
	-- tailwindcss colors
	{
		"themaxmarchuk/tailwindcss-colors.nvim",
		-- load only on require("tailwindcss-colors")
		-- run the setup function after plugin is loaded
		config = function()
			-- pass config options here (or nothing to use defaults)
			require("tailwindcss-colors").setup()
		end,
	},
	{ "norcalli/nvim-colorizer.lua" }, -- colorize hex colors
	-- markdown preview
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	-- noice
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},
	-- harpoon
	{
		"ThePrimeagen/harpoon",
		event = "BufRead",
		config = function()
			require("harpoon").setup()
		end,
	},
	-- toggle transparency
	{ "xiyaowong/nvim-transparent" }, -- toggle transparency
	-- themes / color schemes
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{ "HiPhish/nvim-ts-rainbow2" },
	-- nuget specific
	-- cmp nuget
	{ "PasiBergman/cmp-nuget" },
	{ "folke/trouble.nvim" },
	-- {
	-- 	"nvim-neotest/neotest",
	-- 	dependencies = {
	-- 		"Issafalcon/neotest-dotnet",
	-- 	},
	-- 	opts = function(_, opts)
	-- 		vim.list_extend(opts.adapters, {
	-- 			require("neotest-dotnet"),
	-- 		})
	-- 	end,
	-- },
}
