return {
  -- null-ls
  {
    "jose-elias-alvarez/null-ls.nvim",
    lazy = false,
    config = function()
      local null_ls = require("null-ls")
      local lsp_utils = require("lspconfig.util")

      local function file_exists(filename)
        local f = io.open(filename, "r")
        if f ~= nil then
          io.close(f)
          return true
        else
          return false
        end
      end

      local function check_prettier_config(root)
        local config_files = {
          ".prettierrc",
          "prettier.config.js",
          ".prettierrc.js",
          ".prettierrc.json",
          ".prettierrc.yml",
          ".prettierrc.yaml",
          "prettierrc.js",
          "prettierrc.json",
          "prettierrc.yml",
          "prettierrc.yaml",
        }

        for _, config_file in ipairs(config_files) do
          local config_path = lsp_utils.path.join(root, config_file)
          if file_exists(config_path) then
            return true
          end
        end
      end

      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua.with({
            filetypes = { "lua" },
          }),
          null_ls.builtins.formatting.prettier.with({
            filetypes = {
              "javascript",
              "javascriptreact",
              "typescript",
              "typescriptreact",
              "json",
              "yaml",
              "markdown",
              "html",
              "vue",
              "svelte",
              "css",
              "scss",
              "less",
              "graphql",
            },
            extra_args = function(params)
              -- if root has .prettierrc file, don't use any default args
              local root = lsp_utils.find_git_ancestor(params.bufname) or lsp_utils.path.dirname(params.bufname)
              if check_prettier_config(root) then
                return {}
              end

              -- return default args if no .prettierrc found
              return { "--single-quote", "--jsx-single-quote", "--trailing-comma", "--semi" }
            end,
          }),
          null_ls.builtins.formatting.csharpier.with({
            filetypes = { "cs", "vb" },
          }),
          null_ls.builtins.formatting.eslint_d,
        },
      })
    end
  },
}
