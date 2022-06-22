local utils = require("utils")
local map = utils.keymap

-- map the leader key
map('n', '<Space>', '', {})
vim.g.mapleader = ' ' -- 'vim.g' sets global variables


local optsilent = { silent = true, noremap = true }
map('n', '<leader><esc>', ':nohlsearch<cr>')
map('n', '<leader>n', ':bnext<cr>')
map('n', '<leader>p', ':bprev<cr>')


-- map easy resizing
map('n', '<leader>=', ':resize +10<cr>', optsilent)
map('n', '<leader>\'', ':resize -10<cr>', optsilent)
map('n', '<leader>[', ':vertical resize -10<cr>', optsilent)
map('n', '<leader>]', ':vertical resize +10<cr>', optsilent)

map('n', ';', ':') -- make :(colon!) easier to access
map("i", "jj", "<Esc>") -- escape with jj

-- code actions
map('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<cr>', optsilent)
map('v', '<leader>ca', ':<C-U>lua vim.lsp.buf.code_action()<cr>', optsilent)

-- hovering
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', options)
map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', options)

-- definition and implementation
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', optsilent)
map('n', 'gD', '<cmd>lua vim.lsp.buf.implementation()<CR>', optsilent)

-- rename
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', optsilent)

-- references
map('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', optsilent)

-- completion
map('n', '<C-space>', '<cmd>lua vim.lsp.buf.completion()<CR>', optsilent)

-- diagnostics
map('n', '<C-n>', '<cmd>lua vim.diagnostic.goto_prev()<CR>', options)
map('n', '<C-p>', '<cmd>lua vim.diagnostic.goto_next()<CR>', options)
map('n', '<leader>e', '<cmd>lua vim.diagnostic.show_line_diagnostics({ focusable = false })<CR>', options)


-- LazyGit
map('n', '<leader>gg', ':LazyGit<CR>', options)
