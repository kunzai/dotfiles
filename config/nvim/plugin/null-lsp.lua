local M = {}

local null_ls = require("null-ls")

local prettierd_filetypes = { unpack(null_ls.builtins.formatting.prettierd.filetypes) }
table.insert(prettierd_filetypes, "jsonc")

M.sources = {
  null_ls.builtins.formatting.prettierd.with({
    filetypes = prettierd_filetypes,
  }),
  null_ls.builtins.formatting.trim_whitespace.with({
    filetypes = { "plantuml" },
  }),
  null_ls.builtins.formatting.stylua,
  null_ls.builtins.diagnostics.selene.with({
    name = "selene",
  }),
  null_ls.builtins.diagnostics.shellcheck,
  null_ls.builtins.code_actions.shellcheck,
  null_ls.builtins.formatting.shfmt,
  null_ls.builtins.diagnostics.hadolint,
  null_ls.builtins.diagnostics.markdownlint,
  null_ls.builtins.diagnostics.write_good,
  null_ls.builtins.diagnostics.misspell,
  null_ls.builtins.formatting.gofumpt,
}

-- M.config = {
  -- on_attach = require("lsp.utils").base_config.on_attach,
  -- sources = M.sources,
-- }

function M.setup()
  null_ls.setup(M.config)
end

return M


-- require("null-ls").setup({
-- sources = {
-- require("null-ls").builtins.formatting.prettier,
-- require("null-ls").builtins.diagnostics.eslint,
-- require("null-ls").builtins.completion.spell,
-- },
-- -- you can reuse a shared lspconfig on_attach callback here
-- on_attach = function(client)
-- if client.resolved_capabilities.document_formatting then
-- vim.cmd([[
-- augroup LspFormatting
-- autocmd! * <buffer>
-- autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
-- augroup END
-- ]])
-- end
-- end,
-- })
