local utils = require("utils")
local map = utils.keymap


require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = true;
    buffer = true;
    calc = false;
    nvim_lsp = true;
    nvim_lua = true;
    treesitter = true;
    vsnip = false;
    ultisnips = false;
    luasnip = true;
  };
}

options = { silent = true, expr = true }
map('i', '<C-Space>', 'compe#complete()', options)
map('i', '<CR>', 'compe#confirm(luaeval("require \'nvim-autopairs\'.autopairs_cr()"))', options)
map('i', '<C-f>', 'compe#scroll({ \'delta\': +4 })', options)
map('i', '<C-d>', 'compe#scroll({ \'delta\': -4 })', options)


-- inoremap <silent><expr> <C-Space> compe#complete()
-- inoremap <silent><expr> <CR>      compe#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr()"))
-- inoremap <silent><expr> <C-e>     compe#close('<C-e>')
-- inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
-- inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })



