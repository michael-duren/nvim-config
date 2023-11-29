return {
  -- bufferline
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    lazy = false,
    config = function()
      local icons = require("michael.core.icons")

      require("bufferline").setup({
        options = {
          mode = "buffer",
          numbers = "none",
          close_command = "bdelete! %d",
          right_mouse_command = "bdelete! %d",
          left_mouse_command = "buffer %d",
          middle_mouse_command = nil,
          indicator = { icon = "|", style = "icon" },
          buffer_close_icon = icons.ui.Close,
          modified_icon = icons.git.LineModified,
          close_icon = icons.ui.Close,
          left_trunc_marker = icons.ui.ArrowCircleLeft,
          right_trunc_marker = icons.ui.ArrowCircleRight,
          name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
            if buf.name:match("%.md") then
              return vim.fn.fnamemodify(buf.name, ":t:r")
            end
          end,
          max_name_length = 18,
          max_prefix_length = 15, -- prefix used when a buffer is deduplicated
          tab_size = 18,
          diagnostics = "nvim_lsp",
          diagnostics_indicator = function(count)
            return "(" .. count .. ")"
          end,
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              text_align = "center",
            },
          },
          show_buffer_icons = true,
          show_buffer_close_icons = true,
          show_close_icon = false,
          show_tab_indicators = true,
          persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
          -- can also be a table containing 2 custom separators
          -- [focused and unfocused]. eg: { '|', '|' }
          separator_style = "thin",
          enforce_regular_tabs = true,
          always_show_bufferline = true,
          sort_by = "id",
          hover = {
            enabled = true,
            delay = 200,
            reveal = { "close" },
          },
        },
      })
    end
  },
}
