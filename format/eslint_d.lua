-- 设置 eslint_d 语法检查
local eslint = {
  lintCommand = 'eslint_d -f unix --stdin --stdin-filename ${INPUT}',
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = {
    '%f:%l:%c: %trror: %m',
    '%f:%l:%c: %tarning: %m',
    '%f:%l:%c: %m'
  },
  formatCommand = 'eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}',
  formatStdin = true
}

-- 设置 Mason.nvim 的 LSP 客户端
require('lspconfig').efm.setup {
  filetypes = {"javascript", "javascriptreact", "typescript", "typescriptreact"},
  init_options = {documentFormatting = true},
  settings = {
    rootMarkers = {".git/"},
    languages = {
      javascript = {eslint},
      javascriptreact = {eslint},
      typescript = {eslint},
      typescriptreact = {eslint}
    }
  },
  cmd = {'eslint_d', '--stdio'},
  on_attach
}

