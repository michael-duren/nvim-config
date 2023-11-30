return {
  -- toggle term
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    lazy = false,
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<c-\>]],
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 1,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "horizontal",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "curved",
          winblend = 3,
          highlights = {
            border = "Normal",
            background = "Normal",
          },
        },
      })

      -- create mappings for 3 terminals
      for i = 1, 3 do
        vim.api.nvim_set_keymap(
          "n",
          "<leader>" .. i,
          "<cmd> ToggleTerm " .. i .. "<CR>",
          { noremap = true, silent = false }
        )
      end
    end
  },
}
