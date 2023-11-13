local cmp = require('cmp')
local icons = require('michael.core.icons')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  }),
  formatting = {
  format = function(_, vim_item)
    local icon = icons.kind[vim_item.kind]
    if icon then
      vim_item.kind = icon 
    end
    return vim_item
  end
  }
})
