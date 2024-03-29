-- local null_ls = require('null-ls')

-- local formatting = null_ls.builtins.formatting

-- null_ls.setup({
  -- sources = {
    -- formatting.prettier, formatting.black, formatting.gofmt, formatting.shfmt,
    -- formatting.clang_format, formatting.cmake_format, formatting.dart_format,
    -- formatting.lua_format.with({
      -- extra_args = {
        -- '--no-keep-simple-function-one-line', '--no-break-after-operator', '--column-limit=100',
        -- '--break-after-table-lb', '--indent-width=2'
      -- }
    -- }), formatting.isort, formatting.codespell.with({filetypes = {'markdown'}})
  -- },
  -- on_attach = function(client)
    -- if client.resolved_capabilities.document_formatting then
      -- vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    -- end
    -- vim.cmd [[
      -- augroup document_highlight
        -- autocmd! * <buffer>
        -- autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        -- autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      -- augroup END
    -- ]]
  -- end
-- })

-- local null_ls = require("null-ls")
-- local prettier = require("prettier")

-- require("null-ls").config({
    -- sources = {
        -- require("null-ls").builtins.formatting.stylua,
        -- require("null-ls").builtins.completion.spell,
    -- },
-- })
-- require("lspconfig")["null-ls"].setup({
    -- on_attach = my_custom_on_attach,
-- })
-- null_ls.setup({
  -- on_attach = function(client, bufnr)
    -- if client.resolved_capabilities.document_formatting then
      -- vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.formatting()<CR>")
      -- -- format on save
      -- vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
    -- end

    -- if client.resolved_capabilities.document_range_formatting then
      -- vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
    -- end
  -- end,
-- })

-- prettier.setup({
  -- bin = 'prettier', -- or `prettierd`
  -- filetypes = {
    -- "css",
    -- "graphql",
    -- "html",
    -- "javascript",
    -- "javascriptreact",
    -- "json",
    -- "less",
    -- "markdown",
    -- "scss",
    -- "typescript",
    -- "typescriptreact",
    -- "yaml",
  -- },

  -- -- prettier format options
  -- arrow_parens = "always",
  -- bracket_spacing = true,
  -- embedded_language_formatting = "auto",
  -- end_of_line = "lf",
  -- html_whitespace_sensitivity = "css",
  -- jsx_bracket_same_line = false,
  -- jsx_single_quote = false,
  -- print_width = 80,
  -- prose_wrap = "preserve",
  -- quote_props = "as-needed",
  -- semi = true,
  -- single_quote = false,
  -- tab_width = 2,
  -- trailing_comma = "es5",
  -- use_tabs = false,
  -- vue_indent_script_and_style = false,
-- })
