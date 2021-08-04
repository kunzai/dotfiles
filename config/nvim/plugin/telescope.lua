local utils = require("utils")
local map = utils.keymap

require'telescope'.load_extension('fzy_native')

map('n', '<leader>ff', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>')
map('n', '<leader>fg', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>')
map('n', '<leader>fb', '<cmd>lua require(\'telescope.builtin\').buffers()<cr>')
map('n', '<leader>fh', '<cmd>lua require(\'telescope.builtin\').help_tags()<cr>')
map('n', '<leader>fr', '<cmd>lua require(\'telescope.builtin\').registers()<cr>')
map('n', '<leader>fc', '<cmd>lua require(\'telescope.builtin\').commands()<cr>')


