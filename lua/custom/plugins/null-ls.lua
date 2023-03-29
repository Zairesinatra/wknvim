-- 使用 autocmd 在文件保存时触发对应的 LSP 命令
vim.cmd([[autocmd BufWritePre *.js,*.ts,*.jsx,*.tsx,*.vue,*.css,*.scss,*.less,*.html,*.yaml,*.graphql,*.json lua vim.lsp.buf.format({async=true})]])
-- null-ls.nvim
return {
  "jose-elias-alvarez/null-ls.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config = function()
    local null_ls = require("null-ls")
    -- 获取当前打开文件所在目录的路径
    local path = vim.fn.expand('%:p:h')
    -- 判断该目录下是否存在 eslint
    local has_eslint = vim.fn.executable(path .. '/node_modules/.bin/eslint') == 1
    if has_eslint then
      -- print("Use Eslint that exists in the project")
    else
      -- print('Use Eslint globally')
    end
    -- vim.notify(vim.fn.glob(vim.fn.getcwd() .. "/.eslintrc*"))
    null_ls.setup {
      sources = {
        --[[ null_ls.builtins.formatting.stylua.with({
          extra_args = { "--config-path", vim.fn.expand("~/.config/nvim/.stylua.toml") },
        }), ]]--
        null_ls.builtins.diagnostics.eslint.with({
          prefer_local = "node_modules/.bin",
        }),
        -- gitsigns 是一个可选的参数，用于在当前行的上下文中提供与 Git 相关的代码操作
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.code_actions.eslint.with({
          prefer_local = "node_modules/.bin",
        }),
        -- 使用 Prettier 进行格式化
        null_ls.builtins.formatting.prettier.with({
          filetypes = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "vue",
            "css",
            "scss",
            "less",
            "html",
            "yaml",
            "json",
            "graphql",
          },
          prefer_local = "node_modules/.bin",
          --[[
          args = {
            -- "--stdin-filepath", "%filepath",
            -- "--double-quote",
            -- "--trailing-comma", "all",
            -- "--print-width", "80",
            -- "--tab-width", "2",
            "--semi","false"
          },
          extra_args = {
            "--semi","false"
          },
          timeout = 10000,
          ]]--
        }),
      },
      -- #{m}: message
      -- #{s}: source name (defaults to null-ls if not specified)
      -- #{c}: code (if available)
      -- 提示格式 [eslint] xxx
      diagnostics_format = "[#{s}] #{m}",
    }
  end
}
