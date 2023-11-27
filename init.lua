-- core
require("michael.core.autocmds")
require("michael.core.options")
require("michael.core.key-bindings")

require("michael.core.lazy")

-- config neodev before lsp
require("michael.plugins.neodev")

-- lsp
require("michael.lsp")
require("michael.lsp.rust")
require("michael.lsp.csharp")

-- dap
require("michael.dap")
require("michael.dap.csharp")

-- plugin configs
require("michael.plugins.cmp")
require("michael.plugins.alpha")
require("michael.plugins.telescope")
require("michael.plugins.toggleterm")
require("michael.plugins.treesitter")
require("michael.plugins.schemastore")
require("michael.plugins.null-ls")
require("michael.plugins.blankline")
require("michael.plugins.gitsigns")
require("michael.plugins.comment")
require("michael.plugins.lualine")
require("michael.plugins.bufferline")
require("michael.plugins.lsp-zero")
require("michael.plugins.nvimtree")
require("michael.plugins.whichkey")
require("michael.plugins.friendly-snippets")
require("michael.plugins.tailwind-color")
require("michael.plugins.colorizer")
require("michael.plugins.noice")
require("michael.plugins.harpoon")
require("michael.plugins.trouble")

-- colorscheme
require("michael.core.colorscheme")
