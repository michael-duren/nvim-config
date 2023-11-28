vim.opt.scrolloff = 8
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.termguicolors = true

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

vim.g.mapleader = " "

-- stop vim from autocommenting next line
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
	end,
})

-- 4 tab spacing for cs files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "cs",
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4
		vim.opt_local.softtabstop = 4
	end,
})

-- 4 tab spacing for rs files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "rs",
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4
		vim.opt_local.softtabstop = 4
	end,
})

-- copy to and from system clipboard
vim.o.clipboard = "unnamedplus"
