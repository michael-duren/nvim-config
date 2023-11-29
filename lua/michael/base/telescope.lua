return {
  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    cmd = "Telescope",
    keys = {
      {
        "<leader>fr",
        "<cmd>Telescope oldfiles<cr>",
        desc = "Telescope old files"
      },
      {
        "<leader>fb",
        "<cmd>Telescope buffers<cr>",
        desc = "Telescope buffers",
      },
      {
        "<leader>ff",
        "<cmd>Telescope find_files<cr>",
        desc = "Telescope find files",
      },
      {
        "<leader>ft",
        "<cmd>Telescope live_grep<cr>",
        desc = "Telescope live grep",
      },
      {
        "<leader>fd",
        "<cmd>Telescope diagnostics<cr>",
        desc = "Telescope diagnostics",
      },
      {
        "<leader>fs",
        "<cmd>Telescope current_buffer_fuzzy_find<cr>",
        desc = "Telescope current buffer fuzzy find",
      },
      {
        "<leader>fh",
        "<cmd>Telescope help_tags<cr>",
        desc = "Telescope help tags",
      },
      {
        "<leader>fp",
        "<cmd>Telescope commands<cr>",
        desc = "Telescope commands",
      },
      {
        "<leader>fk",
        "<cmd>Telescope keymaps<cr>",
        desc = "Telescope keymaps",
      },
    },
    opts = {
      deafults = {
        mappings = {
          i = {
            ["<C-j>"] = function(...)
              require("telescope.actions").move_selection_next(...)
            end,
            ["<C-k>"] = function(...)
              require("telescope.actions").move_selection_previous(...)
            end,
            ["<C-n>"] = function(...)
              require("telescope.actions").cycle_history_next(...)
            end,
            ["<C-p>"] = function(...)
              require("telescope.actions").cycle_history_prev(...)
            end,
          },

        },
      }
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("fzf")
    end
  },
}
