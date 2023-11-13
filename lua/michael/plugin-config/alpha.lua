local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
local banner = require("michael.core.alpha.banner")

dashboard.section.header.val = banner.banner

dashboard.section.buttons.val = {
  dashboard.button("n", "  > New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("f", "  > Find file", ":cd $HOME/Workspace | Telescope find_files<CR>"),
  dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
  dashboard.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
  dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
}

dashboard.section.footer.val = {
  "LSP client:  ",
  dashboard.lsp_client_names,
}

alpha.setup(dashboard.opts)
