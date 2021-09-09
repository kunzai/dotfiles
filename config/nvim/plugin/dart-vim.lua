local utils = require("utils")
local map = utils.keymap

vim.g['dart_style_guide'] = 2
vim.g['dart_format_on_save'] = 1

-- instead of manually format dart sources, activate on save with :DartToggleFormatOnSave
-- map('n', '<leader>df', ':DartFmt<cr>', { silent = true })
