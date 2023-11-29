return {
  -- for showing indentation lines
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    events = "VeryLazy",
    config = function()
      require("ibl").setup()
    end
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      setup = {
        show_help = true,
        plugins = { spelling = true },
        key_labels = { ["<leader>"] = "SPC" },
        triggers = "auto",
        window = {
          border = "single",        -- none, single, double, shadow
          position = "bottom",      -- bottom, top
          margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]
          padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
          winblend = 0,
        },
        layout = {
          height = { min = 4, max = 25 }, -- min and max height of the columns
          width = { min = 20, max = 50 }, -- min and max width of the columns
          spacing = 3,                    -- spacing between columns
          align = "left",                 -- align columns left, center or right
        },
      },
      defaults = {
        mode = { "n", "v" },
        ["<leader>f"] = { name = "+File" },
        ["<leader>q"] = { name = "+Quit/Session" },
        ["<leader>qq"] = { cmd = "<cmd>q<cr>", desc = "Quit" },
        ["<leader>w"] = { cmd = "<cmd>update!<cr>", desc = "Save" },
      },
    },
    config = function(_, opts)
      local wk = require "which-key"
      wk.setup(opts.setup)
      wk.register(opts.defaults)
    end,
  },
  -- {
  --   "anuvyklack/hydra.nvim",
  --   event = { "VeryLazy" },
  --   opts = {
  --     specs = {},
  --   },
  --   config = function(_, opts)
  --     local hydra = require "hydra"
  --     for s, _ in pairs(opts.specs) do
  --       hydra(opts.specs[s]())
  --     end
  --   end,
  -- },
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    opts = {
      left = {
        { ft = "hydra_hint", title = "Hydra", size = { height = 0.5 }, pinned = true },
      },
    },
  },
}
