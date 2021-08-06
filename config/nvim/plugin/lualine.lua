require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'neon',
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = { { 'mode', upper = true } },
    lualine_b = { { 'branch', icon = '' } },
    lualine_c = { { 'diff', icon = ''}, {'filename'} },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
  },
  extensions = {'chadtree', 'fugitive', 'quickfix'}
}
