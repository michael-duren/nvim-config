return {
  {
    "nvim-tree/nvim-web-devicons",
    dependencies = { "DaikyXendo/nvim-material-icon" },
    config = function()
      require("nvim-web-devicons").setup()
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      transparent = false,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      }
    },
    config = function(_, opts)
      local present, tokyonight = pcall(require, "tokyonight")
      if present then
        tokyonight.setup(opts)
        tokyonight.load()
      end
    end
  },
  -- themes / color schemes
  { "HiPhish/nvim-ts-rainbow2" },
}
