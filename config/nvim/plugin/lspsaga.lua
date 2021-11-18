-- local utils = require("utils")
-- local map = utils.keymap
-- local saga = require 'lspsaga'

-- -- not working completely currently
-- map('n','gh', ':Lspsaga lsp_finder<cr>', { silent= true })

-- -- code action
-- map('n','<leader>ca', ':Lspsaga code_action<cr>', { silent= true })
-- map('v','<leader>ca', ':<C-U>Lspsaga range_code_action<cr>', { silent= true })

-- -- hover
-- map('n', 'K', '<cmd>lua require(\'lspsaga.hover\').render_hover_doc()<cr>', { silent= true })
-- -- nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>

-- -- scroll down hover doc or scroll in definition preview
-- -- map('n', '<C-f>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', { silent= true })
-- -- nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
-- -- scroll up hover doc
-- -- map('n', '<C-b>', '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(-1)<CR>', { silent= true })
-- -- nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

-- -- signaturehelp
-- map('n', 'gs', ':Lspsaga signature_help<cr>', { silent= true })

-- -- rename
-- map('n', 'gr', ':Lspsaga rename<cr>', { silent= true })
-- -- close rename win use <C-c> in insert mode or `q` in noremal mode or `:q`

-- -- preview
-- map('n', 'gd', ':Lspsaga preview_definition<cr>', { silent= true })

-- -- show diagnostic
-- -- map('n', '<leader>cd', '<cmd>lua require"lspsaga.diagnostic".show_line_diagnostics()<cr>', { silent= true })
-- map('n', '<leader>cd', ':Lspsaga show_line_diagnostics<cr>', { silent= true })
-- map('n', '<leader>cc', ':Lspsaga show_cursor_diagnostics<cr>', { silent= true })
-- map('n', '[e', ':Lspsaga diagnostic_jump_next<cr>', { silent= true })
-- map('n', ']e', ':Lspsaga diagnostic_jump_prev<cr>', { silent= true })

-- map('x', '<leader>cv', '<Cmd>lua vim.lsp.buf.range_code_action()<cr>', { silent= true })
-- -- xnoremap <leader>ca <Cmd>lua vim.lsp.buf.range_code_action()<CR>

-- -- saga.init_lsp_saga()

-- saga.init_lsp_saga {
  -- finder_action_keys = {
    -- open = {'<CR>', 'o'}, vsplit = 's',split = 'i',quit = {'q', '<esc>', '<C-c>'},
    -- scroll_down = '<C-f>',scroll_up = '<C-b>'
  -- },
  -- code_action_keys = {
    -- quit = {'q', '<esc>', '<C-c>'}, exec = '<CR>'
  -- },
  -- rename_action_keys = {
    -- quit = {'<esc>', '<C-c>'}, exec = '<CR>'
  -- },
-- }
