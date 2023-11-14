require('Comment').setup({
  ---Add a space b/w comment and the line
  ---@type boolean
  padding = true,
  ---Line which should be ignored while comment/uncomment.
  ---Could be a regex string or a function that returns a regex string.
  ---Example: Use '^$' to ignore empty lines
  ---@type string|function
  ignore = nil,
  ---Whether to create basic (operator-pending) and extended mappings for NORMAL/VISUAL mode
  ---@type table
  mappings = {
    ---operator-pending mapping
    ---Includes `gcc`, `gcb`, `gc[count]{motion}` and `gb[count]{motion}`
    basic = true,
    ---extended mapping
    ---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
    extended = true,
  },
  -- -LHS of line and block comment toggle mapping in NORMAL/VISUAL mode
  -- -@type table
  toggler = {
    ---line-comment toggle
    line = '<leader>/',
    ---block-comment toggle
    block = 'gbc',
  },
  ---LHS of line and block comment operator-mode mapping in NORMAL/VISUAL mode
  ---@type table
  opleader = {
    ---line-comment opfunc mapping
    line = '<leader>/',
    ---block-comment opfunc mapping
    block = 'gb',
  },
  ---Pre-hook, called before commenting the line
  ---@type function|nil
  pre_hook = nil,
  ---Post-hook, called after commenting is done
  ---@type function|nil
  post_hook = nil,
  ---LHS of visual mode mapping which enables range-commenting
  ---@type string
  ---@default
  -- vleader = 'gc',
  ---LHS of operator pending mode mapping which enables operator-pending commenting
  ---@type string
  ---@default
  ---opleader = 'gc',
})
