return {
  -- harpoon
  {
    "ThePrimeagen/harpoon",
    event = "BufRead",
    keys = {
      -- harpoon
      {
        "<leader>hh",
        "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>",
        desc = "Harpoon toggle quick menu",
      },
      {
        "<leader>ha",
        "<cmd>lua require('harpoon.mark').add_file()<CR>",
        desc = "Harpoon add file",
      },
      {
        "<leader>hj",
        "<cmd>lua require('harpoon.ui').nav_next()<CR>",
        desc = "Harpoon next",
      },
      {
        "<leader>hk",
        "<cmd>lua require('harpoon.ui').nav_prev()<CR>",
        desc = "Harpoon previous",
      },
    },
    config = function()
      require("harpoon").setup({
        global_settings = {
          save_on_toggle = true,
          save_on_change = true,
        },
      })
    end,
  },
}
