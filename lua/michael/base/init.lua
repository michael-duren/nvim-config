return {
  -- start of base
  { "nvim-lua/popup.nvim" },
  { "nvim-lua/plenary.nvim" },

  -- fugitive
  { "tpope/vim-fugitive" },
  -- nvim tree
  -- -- mason - lsp
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },
  -- zero - lsp
  { "neovim/nvim-lspconfig" },
  -- null-ls
  {
    "jose-elias-alvarez/null-ls.nvim",
    lazy = false,
  },
  -- toggle term
  { "akinsho/toggleterm.nvim", version = "*", config = true },
  -- git stuff
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
  { "arkav/lualine-lsp-progress" },
  -- nvim colorizer
  { "norcalli/nvim-colorizer.lua",    event = "BufRead" },
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
  { "folke/neodev.nvim",          opts = {} },
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
  -- nuget specific
  -- cmp nuget
  { "PasiBergman/cmp-nuget" },
  { "folke/trouble.nvim" },
  -- CSS color stuff
  { "uga-rosa/ccc.nvim",         opts = {} },
  -- matching
  {
    "andymass/vim-matchup",
    setup = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
}
