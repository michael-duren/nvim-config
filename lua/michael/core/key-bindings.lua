--options
-- save
vim.keymap.set("n", "<C-s>", ":w<CR>")

-- buffer
vim.keymap.set("n", "<C-n>", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<C-p>", ":BufferLineCyclePrev<CR>")

--togle transparent
vim.keymap.set("n", "Tt", ":TransparentToggle<CR>")

-- switch windows
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')

-- nvim tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- close buffer
vim.keymap.set("n", '<leader>q', ':q<CR>')

vim.keymap.set("n", "|", ":vsplit<CR>")
vim.keymap.set("n", "-", ":split<CR>")
vim.keymap.set("n", "<M-w>", ":close<CR>")

vim.api.nvim_set_keymap('n', '<leader>pv', ':Vex<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><CR>', ':so ~/.config/nvim/init.lua<CR>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })

-- source init.lua
vim.keymap.set("n", "<leader><CR>", ":so ~/.config/nvim/init.lua<CR>")

-- telescope
vim.keymap.set('n', '<leader>?', '<cmd>Telescope oldfiles<cr>')
vim.keymap.set('n', '<leader>b', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>ts', '<cmd>Telescope live_grep<cr>', {remap = true})
vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>')
vim.keymap.set('n', '<leader>fs', '<cmd>Telescope current_buffer_fuzzy_find<cr>')
vim.keymap.set('n', '<leader>p', '<cmd>Telescope commands<cr>')

-- "n - mode , nore no recursive execution, map"
-- nnoremap <leader>pv :Vex<CR>
