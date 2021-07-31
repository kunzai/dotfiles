vim.cmd("filetype plugin indent on")

require('plugins')
require('settings')
require('keymappings')


-- set nord colorscheme
vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_disable_background = false
vim.g.nord_cursorline_transparent = true
vim.g.nord_enable_sidebar_background = true
require('nord').set()
