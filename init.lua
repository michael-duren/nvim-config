-- core
require("michael.core.autocmds")
require("michael.core.options")
require("michael.core.key-bindings")

-- plugin installs
require("michael.plugins")

-- lsp
require("michael.lsp")
require("michael.lsp.rust")

-- plugin configs
require("michael.plugin-config.cmp")
require("michael.plugin-config.alpha")
require("michael.plugin-config.telescope")
require("michael.plugin-config.toggleterm")
require("michael.plugin-config.schemastore")
require("michael.plugin-config.null-ls")
require("michael.plugin-config.blankline")
require("michael.plugin-config.gitsigns")
require("michael.plugin-config.comment")
require("michael.plugin-config.lualine")
require("michael.plugin-config.bufferline")
require("michael.plugin-config.lsp-zero")
require("michael.plugin-config.nvimtree")
require("michael.plugin-config.whichkey")

-- colorscheme
require("michael.core.colorscheme")
