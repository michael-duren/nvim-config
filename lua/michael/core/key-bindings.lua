local buff_kill = require("michael.utils.buff_kill")
local keybindings = {
  -- Options
  { mode = "n", key = "<C-s>",     command = ":w<CR>", description = "Save current buffer" },
  -- Buffer navigation
  {
    mode = "n",
    key = "<C-n>",
    command = ":BufferLineCycleNext<CR>",
    description = "Next buffer"
  },
  {
    mode = "n",
    key = "<C-p>",
    command = ":BufferLineCyclePrev<CR>",
    description = "Previous buffer"
  },
  -- Toggle transparency
  {
    mode = "n",
    key = "Tt",
    command = ":TransparentToggle<CR>",
    description = "Toggle transparency"
  },
  -- Hide search highlight
  {
    mode = "n",
    key = "<leader>h",
    command = ":noh<CR>",
    description = "Hide search highlight"
  },
  -- Window navigation
  {
    mode = "n",
    key = "<C-l>",
    command = "<C-w>l",
    description = "Move to the right window"
  },
  {
    mode = "n",
    key = "<C-h>",
    command = "<C-w>h",
    description = "Move to the left window"
  },
  {
    mode = "n",
    key = "<C-j>",
    command = "<C-w>j",
    description = "Move to the bottom window"
  },
  {
    mode = "n",
    key = "<C-k>",
    command = "<C-w>k",
    description = "Move to the top window"
  },
  -- Nvim tree
  {
    mode = "n",
    key = "<leader>e",
    command = ":NvimTreeToggle<CR>",
    description = "Toggle NvimTree"
  },
  -- Close buffer
  {
    mode = "n",
    key = "<leader>c",
    command = ":bd<CR>",
    description = "Close current buffer"
  },
  { mode = "n", key = "<leader>q", command = ":q<CR>", description = "Quit" },
  -- Splits
  {
    mode = "n",
    key = "|",
    command = ":vsplit<CR>",
    description = "Vertical split"
  },
  {
    mode = "n",
    key = "-",
    command = ":split<CR>",
    description = "Horizontal split"
  },
  {
    mode = "n",
    key = "<M-w>",
    command = ":close<CR>",
    description = "Close current split"
  },
  -- Misc
  {
    mode = "n",
    key = "<leader>pv",
    command = ":Vex<CR>",
    description = "Vex command",
    options = {
      noremap = true, silent = true }
  },
  {
    mode = "n",
    key = "<leader><CR>",
    command = ":so ~/.config/nvim/init.lua<CR>",
    description = "Reload init.lua",
    options = { noremap = true, silent = false }
  },
  {
    mode = "n",
    key = "<leader>w",
    command = ":w<CR>",
    description =
    "Save current buffer",
    options = {
      noremap = true, silent = true }
  },
  -- Telescope
  {
    mode = "n",
    key = "<leader>fr",
    command = "<cmd>Telescope oldfiles<cr>",
    description = "Telescope old files"
  },
  {
    mode = "n",
    key = "<leader>fb",
    command = "<cmd>Telescope buffers<cr>",
    description = "Telescope buffers"
  },
  {
    mode = "n",
    key = "<leader>ff",
    command = "<cmd>Telescope find_files<cr>",
    description = "Telescope find files"
  },
  {
    mode = "n",
    key = "<leader>ft",
    command = "<cmd>Telescope live_grep<cr>",
    description = "Telescope live grep"
  },
  {
    mode = "n",
    key = "<leader>fd",
    command = "<cmd>Telescope diagnostics<cr>",
    description = "Telescope diagnostics"
  },
  {
    mode = "n",
    key = "<leader>fs",
    command = "<cmd>Telescope current_buffer_fuzzy_find<cr>",
    description = "Telescope current buffer fuzzy find"
  },
  {
    mode = "n",
    key = "<leader>fh",
    command = "<cmd>Telescope help_tags<cr>",
    description = "Telescope help tags"
  },
  {
    mode = "n",
    key = "<leader>fp",
    command = "<cmd>Telescope commands<cr>",
    description = "Telescope commands"
  },
  {
    mode = "n",
    key = "<leader>fk",
    command = "<cmd>Telescope keymaps<cr>",
    description = "Telescope keymaps"
  },
  -- LSP
  {
    mode = "n",
    key = "gd",
    command = "<cmd>lua vim.lsp.buf.definition()<CR>",
    description = "LSP go to definition"
  },
  {
    mode = "n",
    key = "gD",
    command = "<cmd>lua vim.lsp.buf.declaration()<CR>",
    description = "LSP go to declaration"
  },
  {
    mode = "n",
    key = "gr",
    command = "<cmd>lua vim.lsp.buf.references()<CR>",
    description = "LSP find references"
  },
  {
    mode = "n",
    key = "gi",
    command = "<cmd>lua vim.lsp.buf.implementation()<CR>",
    description = "LSP go to implementation"
  },
  { mode = "n", key = "K", command = "<cmd>lua vim.lsp.buf.hover()<CR>", description = "LSP hover" },

  -- BufferLine
  {
    mode = "n",
    key = "<leader>Ko",
    command = "<cmd>BufferLineCloseOthers<CR>",
    description = "Close other buffers"
  },
  {
    mode = "n",
    key = "<leader>c",
    command = function() buff_kill() end,
    description = "Close buffer with buff_kill function"
  }

}

for _, bind in ipairs(keybindings) do
  vim.keymap.set(bind.mode, bind.key, bind.command, bind.options or { desc = bind.description })
end
