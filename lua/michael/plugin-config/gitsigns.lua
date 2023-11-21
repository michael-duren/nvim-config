local icons = require("michael.core.icons")

require("gitsigns").setup({
  signs = {
    add = { text = icons.git.LineAdded },
    change = { text = icons.git.LineModified },
    delete = { text = icons.git.FileDeleted },
    topdelete = { text = icons.git.FileDeleted },
    changedelete = { text = icons.git.LineModified },
    untracked = { text = icons.git.FileUnmerged },
  },
})
