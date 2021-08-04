local utils = require("utils")
local map = utils.keymap

vim.api.nvim_set_var("chadtree_ignores", { name = {".*", ".git", "vendor", "node_modules"} })
vim.api.nvim_set_var("chadtree_settings", { 
  keymap = { tertiary = {"t"}, trash = {'a'} }, 
  theme = {text_colour_set = "nord"}
})

map('n', '<leader>nn', ':CHADopen<cr>')
