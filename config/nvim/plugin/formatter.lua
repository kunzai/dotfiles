-- From mhartington
-- local vim = vim
-- local formatter = require("formatter")
-- local prettierConfig = function()
  -- return {
    -- exe = "prettier",
    -- args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
    -- stdin = true
  -- }
-- end
-- local formatterConfig = {
  -- lua = {
    -- function()
      -- return {
        -- exe = "luafmt",
        -- args = {"--indent-count", 2, "--stdin"},
        -- stdin = true
      -- }
    -- end
  -- },
  -- vue = {
    -- function()
      -- return {
        -- exe = "prettier",
        -- args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote", "--parser", "vue"},
        -- stdin = true
      -- }
    -- end
  -- },
  -- rust = {
    -- -- Rustfmt
    -- function()
      -- return {
        -- exe = "rustfmt",
        -- args = {"--emit=stdout"},
        -- stdin = true
      -- }
    -- end
  -- },
  -- swift = {
    -- -- Swiftlint
    -- function()
      -- return {
        -- exe = "swift-format",
        -- args = {vim.api.nvim_buf_get_name(0)},
        -- stdin = true
      -- }
    -- end
  -- },
  -- r = {
    -- function()
      -- return {
        -- exe = "R",
        -- args = {
          -- "--slave",
          -- "--no-restore",
          -- "--no-save",
          -- "-e",
          -- '\'con <- file("stdin"); styler::style_text(readLines(con)); close(con)\'',
          -- "2>/dev/null"
        -- },
        -- stdin = true
      -- }
    -- end
  -- }
-- }
-- local commonFT = {
  -- "css",
  -- "scss",
  -- "html",
  -- "java",
  -- "javascript",
  -- "typescript",
  -- "typescriptreact",
  -- "markdown",
  -- "markdown.mdx",
  -- "json",
  -- "svelte"
-- }
-- for _, ft in ipairs(commonFT) do
  -- formatterConfig[ft] = {
    -- prettierConfig
  -- }
-- end
-- -- Setup functions
-- formatter.setup(
  -- {
    -- logging = false,
    -- filetype = formatterConfig
  -- }
-- )
