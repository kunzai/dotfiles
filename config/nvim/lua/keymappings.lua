local utils = require("utils")
local map = utils.keymap

-- map the leader key
map('n', '<Space>', '', {})
vim.g.mapleader = ' '  -- 'vim.g' sets global variables


optsilent = { silent = true }
map('n', '<leader><esc>', ':nohlsearch<cr>')
map('n', '<leader>n', ':bnext<cr>')
map('n', '<leader>p', ':bprev<cr>')


-- map easy resizing
map('n', '<leader>=', ':resize +10<cr>', optsilent)
map('n', '<leader>\'', ':resize -10<cr>', optsilent)
map('n', '<leader>[', ':vertical resize -10<cr>', optsilent)
map('n', '<leader>]', ':vertical resize +10<cr>', optsilent)

map('n', ';', ':')        -- make : easier to access
map("i", "jj", "<Esc>")   -- escape with jj
