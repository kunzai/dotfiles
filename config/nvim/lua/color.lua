-- set nord colorscheme
 -- vim.g.nord_contrast = true
-- vim.g.nord_borders = true
-- vim.g.nord_disable_background = true
-- vim.g.nord_cursorline_transparent = false
-- vim.g.nord_enable_sidebar_background = true
-- require('nord').set()

-- set neon colorscheme
-- vim.g.neon_style = "dark"
-- vim.g.neon_italic_keyword = true
-- vim.g.neon_italic_function = true
-- vim.g.neon_transparent = true
-- vim.cmd[[colorscheme neon]]

-- set neon colorscheme
vim.g.tokyonight_style = "night" -- storm, night or day
-- vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
-- Change the "hint" color to the "orange" color, and make the "error" color bright red
-- vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
vim.cmd[[colorscheme tokyonight]]


-- also set the lualine plugin to the corresponding colorscheme!!!
