# NVIM Config

## Pre requisites 

- For some LSP, particularly CSS install this globally
```zsh
npm i --global vscode-langservers-extracted
```

## Status

- Want to redo folder structure, maybe some day

## Tips mostly for myself

- Depending on operating system, this is helpful for finding logs
```vim
`:lua print(vim.fn.stdpath('cache'))`
```

- `:verbose nmap <key>` to find issues with keymaps
