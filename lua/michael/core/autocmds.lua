local function augroup(name)
  return vim.api.nvim_create_augroup("michaelduren" .. name, { clear = true })
end

-- check spelling in text filetypes and wrap
vim.api.nvim_create_autocmd("Filetype", {
  group = augroup("spellcheck"),
  pattern = { "git_commits", "markdown", "text", "textile", "vimwiki" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end
})
