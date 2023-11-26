local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
local banner = require("michael.core.alpha.banner")
local icons = require("michael.core.icons")

dashboard.section.header.val = banner.banner

dashboard.section.buttons.val = {
	dashboard.button("n", icons.ui.NewFile .. "  > New file", "<CMD>ene!<CR>"),
	dashboard.button("f", icons.ui.File .. " > Find file", "<CMD>Telescope find_files<CR>"),
	dashboard.button("r", icons.ui.Files .. "  > Recent", ":Telescope oldfiles<CR>"),
	dashboard.button("h", icons.ui.FindFile .. "  > Harpoon", ":lua require('harpoon.ui').toggle_quick_menu()<CR>"),
	dashboard.button("s", icons.ui.Gear .. "  > Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
	dashboard.button("q", icons.ui.BoldClose .. " > Quit NVIM", ":qa<CR>"),
}

dashboard.section.footer.val = {
	icons.misc.Heart .. " Configured by Michael Duren " .. icons.diagnostics.Hint,
	dashboard.lsp_client_names,
}

alpha.setup(dashboard.opts)
