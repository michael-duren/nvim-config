return {
  -- for showing indentation lines
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    lazy = false,
    config = function()
      require("ibl").setup()
    end
  },
  {
    "anuvyklack/hydra.nvim",
    event = { "VeryLazy" },
    opts = {
      specs = {},
    },
    config = function(_, opts)
      local hydra = require "hydra"
      for s, _ in pairs(opts.specs) do
        hydra(opts.specs[s]())
      end
    end,
  },
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
