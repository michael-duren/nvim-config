return {
  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    cmd = {
      "TSInstall",
      "TSUninstall",
      "TSUpdate",
      "TSUpdateSync",
      "TSInstallInfo",
      "TSInstallSync",
      "TSInstallFromGrammar",
    },
    event = { "User FileOpened", "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = {
          "bash",
          "bicep",
          "c",
          "comment",
          "c_sharp",
          "css",
          "dart",
          "dockerfile",
          "elixir",
          "go",
          "graphql",
          "heex",
          "html",
          "java",
          "javascript",
          "json",
          "jsonc",
          "lua",
          "markdown",
          "markdown_inline",
          "php",
          "python",
          "query",
          "regex",
          "ruby",
          "rust",
          "scss",
          "svelte",
          "toml",
          "tsx",
          "typescript",
          "vim",
          "vimdoc",
          "vue",
          "yaml",
        },

        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          indent = { enable = true },
          additional_vim_regex_highlighting = true,
        },
        indent = { enable = true },
        rainbow = {
          enable = true,
          query = "rainbow-parents",
          strategy = require("ts-rainbow").strategy.global,
        },
      })
    end
  },
}
