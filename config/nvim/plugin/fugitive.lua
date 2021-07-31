local map = vim.api.nvim_set_keymap

-- Git fugitive and coc, go hand in hand

options = { noremap = true, silent = true }
map('n', '<leader>gs', ':G<cr>', options)
map('n', '<leader>gt', ':diffget //3<CR>', options)     -- left side
map('n', '<leader>gt', ':diffget //2<CR>', options)     -- right side
map('n', '<leader>gg', ':GFiles<cr>', options)
map('n', '<leader>gf', ':Files<cr>', options)
map('n', '<leader>gl', ':Lines<cr>', options)
map('n', '<leader>gb', ':Buffers<cr>', options)

