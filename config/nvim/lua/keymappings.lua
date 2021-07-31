local map = vim.api.nvim_set_keymap

-- map the leader key
map('n', '<Space>', '', {})
vim.g.mapleader = ' '  -- 'vim.g' sets global variables


options = { noremap = true }
optsilent = { silent = true }
map('n', '<leader><esc>', ':nohlsearch<cr>', options)
map('n', '<leader>n', ':bnext<cr>', options)
map('n', '<leader>p', ':bprev<cr>', options)


-- map easy resizing
map('n', '<leader>=', ':resize +10<cr>', optsilent)
map('n', '<leader>\'', ':resize -10<cr>', optsilent)
map('n', '<leader>[', ':vertical resize -10<cr>', optsilent)
map('n', '<leader>]', ':vertical resize +10<cr>', optsilent)

-- make : easier to access, overwrite ;
map('n', ';', ':', {noremap=true})
