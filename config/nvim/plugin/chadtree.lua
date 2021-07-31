vim.api.nvim_set_var("chadtree_ignores", { name = {".*", ".git", "vendor", "node_modules"} })
vim.api.nvim_set_var("chadtree_settings", { 
                                           keymap = { tertiary = {"t"}, trash = {'a'} }, 
                                           theme = {text_colour_set = "nord"}
                                          }
                    )

local map = vim.api.nvim_set_keymap
options = { noremap = true }
optsilent = { silent = true }
map('n', '<leader>nn', ':CHADopen<cr>', options)
