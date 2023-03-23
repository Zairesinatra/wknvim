-- 在 LSP 缓存创建时为 null-ls.nvim 启用格式化选项
return {
  "jose-elias-alvarez/null-ls.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup {
      sources = {
        -- 使用 Prettier 进行格式化
        null_ls.builtins.formatting.prettierd.with({
          filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
          args = {
            "--stdin-filepath", "%filepath",
            "--single-quote",
            "--trailing-comma", "all",
            "--print-width", "80",
            "--tab-width", "2",
            "--no-semi"
          },
          to_stdin = true
        })
      },
      on_attach = function(client)
        if client.server_capabilities.document_formatting then
          vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
        end
      end
    }
  end
}
