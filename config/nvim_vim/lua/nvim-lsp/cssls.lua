require'nvim_lsp'.cssls.setup{}

  Default Values:
    capabilities = default capabilities, with offsetEncoding utf-8
    cmd = { "css-languageserver", "--stdio" }
    filetypes = { "css", "scss", "less" }
    on_init = function to handle changing offsetEncoding
    root_dir = root_pattern("package.json")
    settings = {
      css = {
        validate = true
      },
      less = {
        validate = true
      },
      scss = {
        validate = true
      }
    }
