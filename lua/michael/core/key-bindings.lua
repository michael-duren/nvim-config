local buff_kill = require("michael.utils.buff_kill")

local keybindings = {
	-- general
	{ mode = "n", key = "<C-s>", command = ":w<CR>", description = "Save current buffer" },
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
		key = "<leader>T",
		command = ":TransparentToggle<CR>",
		description = "Toggle transparency",
	},
	-- Hide search highlight
	{
		mode = "n",
		key = "<leader>H",
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
	{ mode = "n", key = "<leader>q", command = ":q<CR>", description = "Quit" },
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
	{ mode = "n", key = "K", command = "<cmd>lua vim.lsp.buf.hover()<CR>", description = "LSP hover" },
	{
		mode = "n",
		key = "<leader>lf",
		command = "<cmd>lua vim.lsp.buf.format()<CR>",
		description = "LSP format",
	},
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
	{
		mode = "n",
		key = "<leader>lr",
		command = "<cmd>lua vim.lsp.buf.rename()<CR>",
		description = "Rename",
	},
	{
		mode = "n",
		key = "<leader>R",
		command = "<cmd>LspRestart<CR>",
		description = "Restart LSP",
	},
	{
		mode = "n",
		key = "<leader>la",
		command = "<cmd>lua vim.lsp.buf.code_action()<CR>",
		description = "Code action",
	},
	{
		mode = "n",
		key = "<leader>ld",
		command = "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>",
		description = "Buffer Diagnostics",
	},
	{
		mode = "n",
		key = "<leader>lD",
		command = "<cmd>Telescope lsp_document_diagnostics bufnr=0 theme=get_ivy<cr>",
		description = "Document Diagnostics",
	},
	{
		mode = "n",
		key = "<leader>ll",
		command = "<cmd>lua vim.lsp.codelens.run()<cr>",
		description = "CodeLens Action",
	},
	{
		mode = "n",
		key = "<leader>li",
		command = "<cmd>LspInfo<cr>",
		description = "Info",
	},
	{
		mode = "n",
		key = "<leader>lI",
		command = "<cmd>Mason<cr>",
		description = "Mason Info",
	},
	{
		mode = "n",
		key = "<leader>lq",
		command = "<cmd>lua vim.diagnostic.setloclist()<cr>",
		description = "Quickfix",
	},
	{
		mode = "n",
		key = "<leader>ls",
		command = "<cmd>Telescope lsp_document_symbols<cr>",
		description = "Document Symbols",
	},
	{
		mode = "n",
		key = "<leader>lS",
		command = "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
		description = "Workspace Symbols",
	},
	{
		mode = "n",
		key = "<leader>le",
		command = "<cmd>Telescope quickfix<cr>",
		description = "Telescope Quickfix",
	},

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
	-- markdown preview
	{
		mode = "n",
		key = "<leader>mp",
		command = "<cmd>MarkdownPreviewToggle<CR>",
		description = "Markdown preview",
	},
	-- toggle term
	{
		mode = "t",
		key = "<Esc>",
		command = "<C-\\><C-n>",
		description = "Exit terminal mode",
	},
	-- stop running process in toggle term
	{
		mode = "t",
		key = "<C-c",
		command = "<C-\\><C-n>:stop<CR>",
		description = "Stop running process",
	},
	-- copilot
	{
		mode = "n",
		key = "<leader>Ce",
		command = "<cmd>Copilot enable<CR>",
		options = { silent = false, noremap = true, desc = "Enable copilot" },
	},
	{
		mode = "n",
		key = "<leader>Cd",
		command = "<cmd>Copilot disable<CR>",
		options = { silent = false, noremap = true, desc = "Disable copilot" },
	},
	{
		mode = "n",
		key = "<leader>Cs",
		command = "<cmd>Copilot status<CR>",
		options = { silent = false, noremap = true, desc = "Copilot status" },
	},
	-- gitsigns
	{
		mode = "n",
		key = "<leader>gB",
		command = "<cmd>Gitsigns blame_line<CR>",
		description = "Blame line",
	},
	{
		mode = "n",
		key = "<leader>U",
		command = "<cmd>Lazy update<CR>",
		description = "Lazy update",
	},
}

for _, bind in ipairs(keybindings) do
	vim.keymap.set(bind.mode, bind.key, bind.command, bind.options or { desc = bind.description })
end
