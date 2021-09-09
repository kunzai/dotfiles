local utils = require("utils")
local map = utils.keymap
local saga = require 'lspsaga'

-- add your config value here
-- default value
-- use_saga_diagnostic_sign = true
-- error_sign = '',
-- warn_sign = '',
-- hint_sign = '',
-- infor_sign = '',
-- dianostic_header_icon = '   ',
-- code_action_icon = ' ',
-- code_action_prompt = {
--   enable = true,
--   sign = true,
--   sign_priority = 20,
--   virtual_text = true,
-- },
-- finder_definition_icon = '  ',
-- finder_reference_icon = '  ',
-- max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
-- finder_action_keys = {
--   open = 'o', vsplit = 's',split = 'i',quit = 'q',scroll_down = '<C-f>', scroll_up = '<C-b>' -- quit can be a table
-- },
-- code_action_keys = {
--   quit = 'q',exec = '<CR>'
-- },
-- rename_action_keys = {
--   quit = '<C-c>',exec = '<CR>'  -- quit can be a table
-- },
-- definition_preview_icon = '  '
-- "single" "double" "round" "plus"
-- border_style = "single"
-- rename_prompt_prefix = '➤',
-- if you don't use nvim-lspconfig you must pass your server name and
-- the related filetypes into this table
-- like server_filetype_map = {metals = {'sbt', 'scala'}}
-- server_filetype_map = {}

-- saga.init_lsp_saga {
  -- your custom option here
-- }




-- not working completely currently
map('n','gh', ':Lspsaga lsp_finder<cr>', { silent= true })

-- code action
map('n','<leader>ca', ':Lspsaga code_action<cr>', { silent= true })
map('v','<leader>ca', ':<C-U>Lspsaga range_code_action<cr>', { silent= true })

-- hover
map('n', 'K', '<cmd>lua require(\'lspsaga.hover\').render_hover_doc()<cr>', { silent= true })
-- nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>

-- scroll down hover doc or scroll in definition preview
-- map('n', '<C-f>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', { silent= true })
-- nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
-- scroll up hover doc
-- map('n', '<C-b>', '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(-1)<CR>', { silent= true })
-- nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

-- signaturehelp
map('n', 'gs', ':Lspsaga signature_help<cr>', { silent= true })

-- rename
map('n', 'gr', ':Lspsaga rename<cr>', { silent= true })
-- close rename win use <C-c> in insert mode or `q` in noremal mode or `:q`

-- preview
map('n', 'gd', ':Lspsaga preview_definition<cr>', { silent= true })

-- show diagnostic
-- map('n', '<leader>cd', '<cmd>lua require"lspsaga.diagnostic".show_line_diagnostics()<cr>', { silent= true })
map('n', '<leader>cd', ':Lspsaga show_line_diagnostics<cr>', { silent= true })
map('n', '<leader>cc', ':Lspsaga show_cursor_diagnostics<cr>', { silent= true })
map('n', '[e', ':Lspsaga diagnostic_jump_next<cr>', { silent= true })
map('n', ']e', ':Lspsaga diagnostic_jump_prev<cr>', { silent= true })

map('x', '<leader>cv', '<Cmd>lua vim.lsp.buf.range_code_action()<cr>', { silent= true })
-- xnoremap <leader>ca <Cmd>lua vim.lsp.buf.range_code_action()<CR>

-- saga.init_lsp_saga()

saga.init_lsp_saga {
  finder_action_keys = {
    open = {'<CR>', 'o'}, vsplit = 's',split = 'i',quit = {'q', '<esc>', '<C-c>'},
    scroll_down = '<C-f>',scroll_up = '<C-b>'
  },
  code_action_keys = {
    quit = {'q', '<esc>', '<C-c>'}, exec = '<CR>'
  },
  rename_action_keys = {
    quit = {'<esc>', '<C-c>'}, exec = '<CR>'
  },
}
