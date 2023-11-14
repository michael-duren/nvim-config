local wk = require("which-key")

wk.register({
  f = {
    name = 'file',
    f = { '<cmd>Telescope find_files<cr>', 'Find File' },
    r = { '<cmd>Telescope oldfiles<cr>', 'Open Recent File' },
  }
})
