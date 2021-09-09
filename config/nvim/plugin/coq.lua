vim.schedule(function ()
  local lsp = require "lspconfig"
  require("packer").loader("coq_nvim coq.artifacts")
 -- local servers = { "pyright", "tsserver", "cssls", "html" }
  lsp.pyright.setup(require("coq")().lsp_ensure_capabilities())
  lsp.tsserver.setup(require("coq")().lsp_ensure_capabilities())
  lsp.cssls.setup(require("coq")().lsp_ensure_capabilities())
  lsp.html.setup(require("coq")().lsp_ensure_capabilities())
  lsp.dartls.setup(require("coq")().lsp_ensure_capabilities())
end)
