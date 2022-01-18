local utils = require("utils")
local map = utils.keymap

require'telescope'.load_extension('fzy_native')

map('n', '<leader>ff', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>')
map('n', '<leader>fg', '<cmd>lua require(\'telescope.builtin\').git_files()<cr>')
map('n', '<leader>fl', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>')
map('n', '<leader>fs', '<cmd>lua require(\'telescope.builtin\').grep_string()<cr>')
map('n', '<leader>fb', '<cmd>lua require(\'telescope.builtin\').buffers()<cr>')
map('n', '<leader>fh', '<cmd>lua require(\'telescope.builtin\').help_tags()<cr>')
map('n', '<leader>fr', '<cmd>lua require(\'telescope.builtin\').registers()<cr>')
map('n', '<leader>fc', '<cmd>lua require(\'telescope.builtin\').commands()<cr>')

-- flutter
map('n', '<leader>fu', '<cmd>lua require(\'telescope\').extensions.flutter.commands()<cr>')


