local buff_kill = require("michael.utils.buff_kill")
local keybindings = {
  -- general
  { mode = "n", key = "<C-s>", command = ":w<CR>",       description = "Save current buffer" },
  -- Move lines
  { mode = "n", key = "<A-j>", command = ":m .+1<CR>==", description = "Move line down" },
  { mode = "n", key = "<A-k>", command = ":m .-2<CR>==", description = "Move line up" },
  -- Center after scrolling
  { mode = "n", key = "<C-d>", command = "<C-d>zz" },
  { mode = "n", key = "<C-u>", command = "<C-u>zz" },
  -- Buffer navigation
  {
    mode = "n",
    key = "<C-n>",
    command = ":BufferLineCycleNext<CR>",
    description = "Next buffer",
  },
  {
    mode = "n",
    key = "<C-p>",
    command = ":BufferLineCyclePrev<CR>",
    description = "Previous buffer",
  },
  -- Toggle transparency
  {
    mode = "n",
    key = "Tt",
    command = ":TransparentToggle<CR>",
    description = "Toggle transparency",
  },
  -- Hide search highlight
  {
    mode = "n",
    key = "<leader>h",
    command = ":noh<CR>",
    description = "Hide search highlight",
  },
  -- Window navigation
  {
    mode = "n",
    key = "<C-l>",
    command = "<C-w>l",
    description = "Move to the right window",
  },
  {
    mode = "n",
    key = "<C-h>",
    command = "<C-w>h",
    description = "Move to the left window",
  },
  {
    mode = "n",
    key = "<C-j>",
    command = "<C-w>j",
    description = "Move to the bottom window",
  },
  {
    mode = "n",
    key = "<C-k>",
    command = "<C-w>k",
    description = "Move to the top window",
  },
  -- Nvim tree
  {
    mode = "n",
    key = "<leader>e",
    command = ":NvimTreeToggle<CR>",
    description = "Toggle NvimTree",
  },
  -- Close buffer
  {
    mode = "n",
    key = "<leader>c",
    command = ":bd<CR>",
    description = "Close current buffer",
  },
  { mode = "n", key = "<leader>q", command = ":q<CR>",                           description = "Quit" },
  -- Splits
  {
    mode = "n",
    key = "|",
    command = ":vsplit<CR>",
    description = "Vertical split",
  },
  {
    mode = "n",
    key = "-",
    command = ":split<CR>",
    description = "Horizontal split",
  },
  {
    mode = "n",
    key = "<M-w>",
    command = ":close<CR>",
    description = "Close current split",
  },
  -- Misc
  {
    mode = "n",
    key = "<leader><CR>",
    command = ":so ~/.config/nvim/init.lua<CR>",
    options = { noremap = true, silent = false, desc = "Reload init.lua" },
  },
  {
    mode = "n",
    key = "<leader>w",
    command = ":w<CR>",
    options = {
      noremap = true,
      silent = true,
      desc = "Write current buffer",
    },
  },
  {
    mode = "n",
    key = "<leader>?",
    command = ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>",
    description = "Open settings",
  },
  -- Telescope
  {
    mode = "n",
    key = "<leader>fr",
    command = "<cmd>Telescope oldfiles<cr>",
    description = "Telescope old files",
  },
  {
    mode = "n",
    key = "<leader>fb",
    command = "<cmd>Telescope buffers<cr>",
    description = "Telescope buffers",
  },
  {
    mode = "n",
    key = "<leader>ff",
    command = "<cmd>Telescope find_files<cr>",
    description = "Telescope find files",
  },
  {
    mode = "n",
    key = "<leader>ft",
    command = "<cmd>Telescope live_grep<cr>",
    description = "Telescope live grep",
  },
  {
    mode = "n",
    key = "<leader>fd",
    command = "<cmd>Telescope diagnostics<cr>",
    description = "Telescope diagnostics",
  },
  {
    mode = "n",
    key = "<leader>fs",
    command = "<cmd>Telescope current_buffer_fuzzy_find<cr>",
    description = "Telescope current buffer fuzzy find",
  },
  {
    mode = "n",
    key = "<leader>fh",
    command = "<cmd>Telescope help_tags<cr>",
    description = "Telescope help tags",
  },
  {
    mode = "n",
    key = "<leader>fp",
    command = "<cmd>Telescope commands<cr>",
    description = "Telescope commands",
  },
  {
    mode = "n",
    key = "<leader>fk",
    command = "<cmd>Telescope keymaps<cr>",
    description = "Telescope keymaps",
  },
  -- LSP
  -- basic
  {
    mode = "n",
    key = "gd",
    command = "<cmd>lua vim.lsp.buf.definition()<CR>",
    description = "LSP go to definition",
  },
  {
    mode = "n",
    key = "gD",
    command = "<cmd>lua vim.lsp.buf.declaration()<CR>",
    description = "LSP go to declaration",
  },
  {
    mode = "n",
    key = "gr",
    command = "<cmd>lua vim.lsp.buf.references()<CR>",
    description = "LSP find references",
  },
  {
    mode = "n",
    key = "gi",
    command = "<cmd>lua vim.lsp.buf.implementation()<CR>",
    description = "LSP go to implementation",
  },
  { mode = "n", key = "K",         command = "<cmd>lua vim.lsp.buf.hover()<CR>", description = "LSP hover" },
  -- LSP Menu
  {
    mode = "n",
    key = "<leader>lj",
    command = vim.diagnostic.goto_next,
    description = "go to next error",
  },
  {
    mode = "n",
    key = "<leader>lk",
    command = vim.diagnostic.goto_prev,
    description = "go to previous error",
  },
  { mode = "n", key = "<leader>lr", command = "<cmd>lua vim.lsp.buf.rename()<CR>",      description = "Rename" },
  { mode = "n", key = "<leader>la", command = "<cmd>lua vim.lsp.buf.code_action()<CR>", description = "Code action" },

  -- BufferLine
  {
    mode = "n",
    key = "<leader>Ko",
    command = "<cmd>BufferLineCloseOthers<CR>",
    description = "Close other buffers",
  },
  {
    mode = "n",
    key = "<leader>c",
    command = function()
      buff_kill()
    end,
    description = "Close",
  },
  -- luasnip
  {
    mode = "i",
    key = "<C-j>",
    command = "<cmd>lua require('luasnip').jump(1)<CR>",
    description = "Jump forward",
  },
  {
    mode = "i",
    key = "<C-k>",
    command = "<cmd>lua require('luasnip').jump(-1)<CR>",
    description = "Jump backward",
  },
  {
    mode = "s",
    key = "<C-j>",
    command = "<cmd>lua require('luasnip').jump(1)<CR>",
    description = "Jump forward",
  },
  {
    mode = "s",
    key = "<C-k>",
    command = "<cmd>lua require('luasnip').jump(-1)<CR>",
    description = "Jump backward",
  },
}

for _, bind in ipairs(keybindings) do
  vim.keymap.set(bind.mode, bind.key, bind.command, bind.options or { desc = bind.description })
end
