-- core
require("michael.core.autocmds")
require("michael.core.options")
require("michael.core.key-bindings")

-- plugin installs
require("michael.plugins")

-- config neodev before lsp
require("michael.plugin-config.neodev")

-- lsp
require("michael.lsp")
require("michael.lsp.rust")
require("michael.lsp.csharp")

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
require("michael.plugin-config.friendly-snippets")
require("michael.plugin-config.tailwind-color")
require("michael.plugin-config.colorizer")
require("michael.plugin-config.noice")

-- colorscheme
require("michael.core.colorscheme")
