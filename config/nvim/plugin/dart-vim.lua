local utils = require("utils")
local map = utils.keymap

vim.g['dart_style_guide'] = 2
vim.g['dart_format_on_save'] = 1

map('n', '<leader>', ':DartFmt<cr>', { silent = true })
