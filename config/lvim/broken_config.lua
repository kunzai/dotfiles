--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]

vim.opt.shell = "/bin/sh"

-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "tokyonight"
vim.g.tokyonight_style = "night"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode[";"] = ":"
lvim.keys.normal_mode["<leader>md"] = ":MarkdownPreview<CR>"
lvim.keys.normal_mode["<leader>="] = ":resize +10<cr>"
lvim.keys.normal_mode["<leader>\""] = ":resize -10<cr>"
lvim.keys.normal_mode["<leader>["] = ":vertical resize -10<cr>"
lvim.keys.normal_mode["<leader>]"] = ":vertical resize +10<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["v"] = { "<cmd>Vimwiki<CR>", "Vimwiki" }

-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
lvim.plugins = {
    { "folke/tokyonight.nvim" },
    {
      "vimwiki/vimwiki",
      requires = { "davidgranstrom/nvim-markdown-preview", opt = "markdown", "mattn/calendar-vim" }
    },
    { "lukas-reineke/indent-blankline.nvim" }

    --     {
    --       "folke/trouble.nvim",
    --       cmd = "TroubleToggle",
    --     },
}

vim.g['vimwiki_list'] = {
         { path = "~/Nextcloud/vimwiki/work", syntax = "markdown", ext = ".md" },
         { path = "~/Nextcloud/vimwiki/private", syntax = "markdown", ext = ".md" },
         { path = "~/Nextcloud/vimwiki/nolessthanepic", syntax = "markdown", ext = ".md" },
         { path = "~/Nextcloud/vimwiki/", auto_tags = 1 }
}

-- vim instant markdon
vim.g['instant_markdown_autostart'] = 0 -- no autostart
vim.g['instant_markdown_browser'] = 'qutebrowser'

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }



-- highlight yanked stuff
vim.api.nvim_command('au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=150}')

-- my settings
local o = vim.o
local wo = vim.wo
local bo = vim.bo

-- global options
o.pumheight        = 15
o.pumblend         = 20
o.clipboard        = 'unnamedplus' -- Allow use of system clipboard
o.wildoptions      = 'pum' -- Don't use GUI tabline
o.completeopt      = [[menuone,noselect,noinsert]]
o.whichwrap        = 'h,l,<,>,[,],~'
o.listchars        = 'tab:»·,trail:·,nbsp:·,precedes:«,extends:»'
o.backspace        = [[indent,eol,start]] -- Intuitive backspacing in insert mode
o.encoding         = 'utf-8' -- The encoding displayed
o.fileencoding     = 'utf-8' -- The encoding written to file
o.shortmess        = 'aoOTI' -- Shorten messages and don't show intro
o.shortmess:gsub('S', '')
o.mouse            = 'a' -- enable mouse in all modes
o.mousemodel       = 'popup' -- set the behaviour of mouse
o.fileformats      = 'unix,dos' -- File type preferences
o.inccommand       = 'nosplit' -- live preview the :substitute command
o.showbreak        = "\\\\"
o.report           = 0
o.undofile         = true -- use undo file
-- o.undodir          = "/home/kunzai/.config/nvim/undo" NOT WORKING
vim.opt.undodir    = vim.fn.stdpath('config') .. '/undo'
o.undolevels       = 2000 -- Number of undo levels
o.undoreload       = 10000
o.laststatus       = 2 -- Always show the status line
o.showtabline      = 0 -- Show no tabline
o.updatetime       = 250 -- Frequency update
o.scrolloff        = 99 -- Keep at least 2 lines above/below
o.sidescrolloff    = 99 -- Keep at least 5 lines left/right
o.showmatch        = true -- Highlight matching brace
o.title            = false -- change the terminal's title
o.lazyredraw       = true -- Only redraw when necessary
o.splitbelow       = true -- New splits open to right and bottom
o.splitright       = true
o.hlsearch         = true -- Search highlighting
o.incsearch        = true -- Search starts while entering string
o.ignorecase       = true -- Search ignore case
o.smartcase        = true -- Search ignore case unless search contains an uppercase
o.infercase        = true -- Adjust case in insert completion mode
o.wrapscan         = true -- Searches wrap around the end of the file
o.showmatch        = true -- Jump to matching bracket
o.cursorline       = true -- Color the cursorline
o.backup           = false
o.writebackup      = false
o.swapfile         = false -- Turn off swap files
o.hidden           = true -- Buffer becomes hidden when abandoned to prevent need to save
o.autoread         = true -- if a file is changed outside Vim, automatically re-read it
o.startofline      = false -- Cursor in same column for few commands
o.showfulltag      = true -- Show tag and tidy search in completion
o.showmode         = false -- Don't show mode in cmd window
o.showcmd          = false -- Don't show command in status line
o.shiftround       = true -- align indent to next multiple value of shiftwidth
o.shiftwidth       = 2 -- Number of auto-indent spaces
o.softtabstop      = 2 -- Number of spaces per Tab
o.smarttab         = true -- Enable smart-tabs
o.expandtab        = true -- Insert spaces when tab pressed
o.ruler            = true
o.autochdir        = false -- Set the file path as pwd
o.gdefault         = true -- Set searching to global by default
o.wildmenu         = true -- Command line completion help
o.wildignorecase   = true -- Ignore case when completing file names and directories.
o.autowrite        = true -- Write files when switching buffers
o.autoread         = true -- Read files when switching buffers
o.termguicolors    = true -- Enable 24RGB

-- A list of file patterns to ignore when performing expansion and completion.
o.wildignore       = o.wildignore .. '*.so,/min/*'
o.wildignore       = o.wildignore .. '.git,.hg,.svn,.stversions,*.pyc,*.spl,*.o,*.out,*~,%*'
o.wildignore       = o.wildignore .. '*.jpg,*.jpeg,*.png,*.gif,*.log,**/tmp/**'
o.wildignore       = o.wildignore .. '**/node_modules/**,**/bower_modules/**,*/.sass-cache/*'
o.wildignore       = o.wildignore .. '__pycache__,*.egg-info'
o.wildignore       = o.wildignore .. '*.out,*.obj,*.gem,*.pyc,*DS_Store*'
o.wildignore       = o.wildignore .. '*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz'
o.wildignore       = o.wildignore .. '*.swp,*~,._*,*/vendor/cache/*'

-- window-local options
wo.number          = true -- Show line numbers
wo.relativenumber  = true
wo.foldmethod      = 'marker' -- Autofolding
wo.foldmarker      = '/*,*/'
wo.foldnestmax     = 10
wo.breakindent     = true -- Make every wrapped line visually indented.
wo.colorcolumn     = '80' -- Make colorcolumn visible

-- buffer-local options
bo.omnifunc        = 'lsp#omnifunc' -- use omni completion provided by lsp
bo.textwidth       = 100 -- Line wrap (number of cols)
bo.autoindent      = true -- Uses indent from previous line
bo.smartindent     = true -- Like cindent except lil' more clever
bo.copyindent      = true -- Copy the structure of existing line's indent when autoin

-- highlight yanked stuff
vim.api.nvim_command('au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=150}')

-- vim.cmd "set undodir=~/.config/nvim/undo"

-- vim.cmd "set undodir=~/.config/nvim/undo"

--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.

--     filetypes = { "javascript", "python" },

--   },

-- }



-- Additional Plugins

lvim.plugins = {

    { "folke/tokyonight.nvim" },

    {

      "vimwiki/vimwiki",

      requires = { "davidgranstrom/nvim-markdown-preview", opt = "markdown", "mattn/calendar-vim" }

    },

    { "lukas-reineke/indent-blankline.nvim" }



    --     {

    --       "folke/trouble.nvim",

    --       cmd = "TroubleToggle",

    --     },

}



vim.g['vimwiki_list'] = {

         { path = "~/Nextcloud/vimwiki/work", syntax = "markdown", ext = ".md" },

         { path = "~/Nextcloud/vimwiki/private", syntax = "markdown", ext = ".md" },

         { path = "~/Nextcloud/vimwiki/nolessthanepic", syntax = "markdown", ext = ".md" },

         { path = "~/Nextcloud/vimwiki/", auto_tags = 1 }

}



-- vim instant markdon

vim.g['instant_markdown_autostart'] = 0 -- no autostart

vim.g['instant_markdown_browser'] = 'qutebrowser'



-- Autocommands (https://neovim.io/doc/user/autocmd.html)

-- lvim.autocommands.custom_groups = {

--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },

-- }







-- highlight yanked stuff

vim.api.nvim_command('au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=150}')



-- my settings

local o = vim.o

local wo = vim.wo

local bo = vim.bo



-- global options

o.pumheight = 15

o.pumblend = 20

o.clipboard = 'unnamedplus' -- Allow use of system clipboard

o.wildoptions = 'pum' -- Don't use GUI tabline

o.completeopt = [[menuone,noselect,noinsert]]

o.whichwrap = 'h,l,<,>,[,],~'

o.listchars = 'tab:»·,trail:·,nbsp:·,precedes:«,extends:»'

o.backspace = [[indent,eol,start]] -- Intuitive backspacing in insert mode

o.encoding = 'utf-8' -- The encoding displayed

o.fileencoding = 'utf-8' -- The encoding written to file

o.shortmess = 'aoOTI' -- Shorten messages and don't show intro

o.shortmess:gsub('S', '')

o.mouse = 'a' -- enable mouse in all modes

o.mousemodel = 'popup' -- set the behaviour of mouse

o.fileformats = 'unix,dos' -- File type preferences

o.inccommand = 'nosplit' -- live preview the :substitute command

o.showbreak = "\\\\"

o.report = 0

o.undofile = true -- use undo file

-- o.undodir          = "/home/kunzai/.config/nvim/undo" NOT WORKING

vim.opt.undodir = vim.fn.stdpath('config') .. '/undo'

o.undolevels = 2000 -- Number of undo levels

o.undoreload = 10000

o.laststatus = 2 -- Always show the status line

o.showtabline = 0 -- Show no tabline

o.updatetime = 250 -- Frequency update

o.scrolloff = 99 -- Keep at least 2 lines above/below

o.sidescrolloff = 99 -- Keep at least 5 lines left/right

o.showmatch = true -- Highlight matching brace

o.title = false -- change the terminal's title

o.lazyredraw = true -- Only redraw when necessary

o.splitbelow = true -- New splits open to right and bottom

o.splitright = true

o.hlsearch = true -- Search highlighting

o.incsearch = true -- Search starts while entering string

o.ignorecase = true -- Search ignore case

o.smartcase = true -- Search ignore case unless search contains an uppercase

o.infercase = true -- Adjust case in insert completion mode

o.wrapscan = true -- Searches wrap around the end of the file

o.showmatch = true -- Jump to matching bracket

o.cursorline = true -- Color the cursorline

o.backup = false

o.writebackup = false

o.swapfile = false -- Turn off swap files

o.hidden = true -- Buffer becomes hidden when abandoned to prevent need to save

o.autoread = true -- if a file is changed outside Vim, automatically re-read it

o.startofline = false -- Cursor in same column for few commands

o.showfulltag = true -- Show tag and tidy search in completion

o.showmode = false -- Don't show mode in cmd window

o.showcmd = false -- Don't show command in status line

o.shiftround = true -- align indent to next multiple value of shiftwidth

o.shiftwidth = 2 -- Number of auto-indent spaces

o.softtabstop = 2 -- Number of spaces per Tab

o.smarttab = true -- Enable smart-tabs

o.expandtab = true -- Insert spaces when tab pressed

o.ruler = true

o.autochdir = false -- Set the file path as pwd

o.gdefault = true -- Set searching to global by default

o.wildmenu = true -- Command line completion help

o.wildignorecase = true -- Ignore case when completing file names and directories.

o.autowrite = true -- Write files when switching buffers

o.autoread = true -- Read files when switching buffers

o.termguicolors = true -- Enable 24RGB



-- A list of file patterns to ignore when performing expansion and completion.

o.wildignore = o.wildignore .. '*.so,/min/*'

o.wildignore = o.wildignore .. '.git,.hg,.svn,.stversions,*.pyc,*.spl,*.o,*.out,*~,%*'

o.wildignore = o.wildignore .. '*.jpg,*.jpeg,*.png,*.gif,*.log,**/tmp/**'

o.wildignore = o.wildignore .. '**/node_modules/**,**/bower_modules/**,*/.sass-cache/*'

o.wildignore = o.wildignore .. '__pycache__,*.egg-info'

o.wildignore = o.wildignore .. '*.out,*.obj,*.gem,*.pyc,*DS_Store*'

o.wildignore = o.wildignore .. '*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz'

o.wildignore = o.wildignore .. '*.swp,*~,._*,*/vendor/cache/*'



-- window-local options

wo.number = true -- Show line numbers

wo.relativenumber = true

wo.foldmethod = 'marker' -- Autofolding

wo.foldmarker = '/*,*/'

wo.foldnestmax = 10

wo.breakindent = true -- Make every wrapped line visually indented.

wo.colorcolumn = '80' -- Make colorcolumn visible



-- buffer-local options

bo.omnifunc = 'lsp#omnifunc' -- use omni completion provided by lsp

bo.textwidth = 100 -- Line wrap (number of cols)

bo.autoindent = true -- Uses indent from previous line

bo.smartindent = true -- Like cindent except lil' more clever

bo.copyindent = true -- Copy the structure of existing line's indent when autoin



-- highlight yanked stuff

vim.api.nvim_command('au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=150}')



-- vim.cmd "set undodir=~/.config/nvim/undo"



-- vim.cmd "set undodir=~/.config/nvim/undo"

-- vim.cmd "set undodir=~/.config/nvim/undo"
--     filetypes = { "javascript", "python" },

--   },

-- }



-- Additional Plugins

lvim.plugins = {

    { "folke/tokyonight.nvim" },

    {

      "vimwiki/vimwiki",

      requires = { "davidgranstrom/nvim-markdown-preview", opt = "markdown", "mattn/calendar-vim" }

    },

    { "lukas-reineke/indent-blankline.nvim" }



    --     {

    --       "folke/trouble.nvim",

    --       cmd = "TroubleToggle",

    --     },

}



vim.g['vimwiki_list'] = {

         { path = "~/Nextcloud/vimwiki/work", syntax = "markdown", ext = ".md" },

         { path = "~/Nextcloud/vimwiki/private", syntax = "markdown", ext = ".md" },

         { path = "~/Nextcloud/vimwiki/nolessthanepic", syntax = "markdown", ext = ".md" },

         { path = "~/Nextcloud/vimwiki/", auto_tags = 1 }

}



-- vim instant markdon

vim.g['instant_markdown_autostart'] = 0 -- no autostart

vim.g['instant_markdown_browser'] = 'qutebrowser'



-- Autocommands (https://neovim.io/doc/user/autocmd.html)

-- lvim.autocommands.custom_groups = {

--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },

-- }







-- highlight yanked stuff

vim.api.nvim_command('au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=150}')



-- my settings

local o = vim.o

local wo = vim.wo

local bo = vim.bo



-- global options

o.pumheight = 15

o.pumblend = 20

o.clipboard = 'unnamedplus' -- Allow use of system clipboard

o.wildoptions = 'pum' -- Don't use GUI tabline

o.completeopt = [[menuone,noselect,noinsert]]

o.whichwrap = 'h,l,<,>,[,],~'

o.listchars = 'tab:»·,trail:·,nbsp:·,precedes:«,extends:»'

o.backspace = [[indent,eol,start]] -- Intuitive backspacing in insert mode

o.encoding = 'utf-8' -- The encoding displayed

o.fileencoding = 'utf-8' -- The encoding written to file

o.shortmess = 'aoOTI' -- Shorten messages and don't show intro

o.shortmess:gsub('S', '')

o.mouse = 'a' -- enable mouse in all modes

o.mousemodel = 'popup' -- set the behaviour of mouse

o.fileformats = 'unix,dos' -- File type preferences

o.inccommand = 'nosplit' -- live preview the :substitute command

o.showbreak = "\\\\"

o.report = 0

o.undofile = true -- use undo file

-- o.undodir          = "/home/kunzai/.config/nvim/undo" NOT WORKING

vim.opt.undodir = vim.fn.stdpath('config') .. '/undo'

o.undolevels = 2000 -- Number of undo levels

o.undoreload = 10000

o.laststatus = 2 -- Always show the status line

o.showtabline = 0 -- Show no tabline

o.updatetime = 250 -- Frequency update

o.scrolloff = 99 -- Keep at least 2 lines above/below

o.sidescrolloff = 99 -- Keep at least 5 lines left/right

o.showmatch = true -- Highlight matching brace

o.title = false -- change the terminal's title

o.lazyredraw = true -- Only redraw when necessary

o.splitbelow = true -- New splits open to right and bottom

o.splitright = true

o.hlsearch = true -- Search highlighting

o.incsearch = true -- Search starts while entering string

o.ignorecase = true -- Search ignore case

o.smartcase = true -- Search ignore case unless search contains an uppercase

o.infercase = true -- Adjust case in insert completion mode

o.wrapscan = true -- Searches wrap around the end of the file

o.showmatch = true -- Jump to matching bracket

o.cursorline = true -- Color the cursorline

o.backup = false

o.writebackup = false

o.swapfile = false -- Turn off swap files

o.hidden = true -- Buffer becomes hidden when abandoned to prevent need to save

o.autoread = true -- if a file is changed outside Vim, automatically re-read it

o.startofline = false -- Cursor in same column for few commands

o.showfulltag = true -- Show tag and tidy search in completion

o.showmode = false -- Don't show mode in cmd window

o.showcmd = false -- Don't show command in status line

o.shiftround = true -- align indent to next multiple value of shiftwidth

o.shiftwidth = 2 -- Number of auto-indent spaces

o.softtabstop = 2 -- Number of spaces per Tab

o.smarttab = true -- Enable smart-tabs

o.expandtab = true -- Insert spaces when tab pressed

o.ruler = true

o.autochdir = false -- Set the file path as pwd

o.gdefault = true -- Set searching to global by default

o.wildmenu = true -- Command line completion help

o.wildignorecase = true -- Ignore case when completing file names and directories.

o.autowrite = true -- Write files when switching buffers

o.autoread = true -- Read files when switching buffers

o.termguicolors = true -- Enable 24RGB



-- A list of file patterns to ignore when performing expansion and completion.

o.wildignore = o.wildignore .. '*.so,/min/*'

o.wildignore = o.wildignore .. '.git,.hg,.svn,.stversions,*.pyc,*.spl,*.o,*.out,*~,%*'

o.wildignore = o.wildignore .. '*.jpg,*.jpeg,*.png,*.gif,*.log,**/tmp/**'

o.wildignore = o.wildignore .. '**/node_modules/**,**/bower_modules/**,*/.sass-cache/*'

o.wildignore = o.wildignore .. '__pycache__,*.egg-info'

o.wildignore = o.wildignore .. '*.out,*.obj,*.gem,*.pyc,*DS_Store*'

o.wildignore = o.wildignore .. '*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz'

o.wildignore = o.wildignore .. '*.swp,*~,._*,*/vendor/cache/*'



-- window-local options

wo.number = true -- Show line numbers

wo.relativenumber = true

wo.foldmethod = 'marker' -- Autofolding

wo.foldmarker = '/*,*/'

wo.foldnestmax = 10

wo.breakindent = true -- Make every wrapped line visually indented.

wo.colorcolumn = '80' -- Make colorcolumn visible



-- buffer-local options

bo.omnifunc = 'lsp#omnifunc' -- use omni completion provided by lsp

bo.textwidth = 100 -- Line wrap (number of cols)

bo.autoindent = true -- Uses indent from previous line

bo.smartindent = true -- Like cindent except lil' more clever

bo.copyindent = true -- Copy the structure of existing line's indent when autoin



-- highlight yanked stuff

vim.api.nvim_command('au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=150}')



-- vim.cmd "set undodir=~/.config/nvim/undo"



-- vim.cmd "set undodir=~/.config/nvim/undo"


--   },

-- }



-- Additional Plugins

lvim.plugins = {

    { "folke/tokyonight.nvim" },

    {

      "vimwiki/vimwiki",

      requires = { "davidgranstrom/nvim-markdown-preview", opt = "markdown", "mattn/calendar-vim" }

    },

    { "lukas-reineke/indent-blankline.nvim" }



    --     {

    --       "folke/trouble.nvim",

    --       cmd = "TroubleToggle",

    --     },

}



vim.g['vimwiki_list'] = {

         { path = "~/Nextcloud/vimwiki/work", syntax = "markdown", ext = ".md" },

         { path = "~/Nextcloud/vimwiki/private", syntax = "markdown", ext = ".md" },

         { path = "~/Nextcloud/vimwiki/nolessthanepic", syntax = "markdown", ext = ".md" },

         { path = "~/Nextcloud/vimwiki/", auto_tags = 1 }

}



-- vim instant markdon

vim.g['instant_markdown_autostart'] = 0 -- no autostart

vim.g['instant_markdown_browser'] = 'qutebrowser'



-- Autocommands (https://neovim.io/doc/user/autocmd.html)

-- lvim.autocommands.custom_groups = {

--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },

-- }







-- highlight yanked stuff

vim.api.nvim_command('au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=150}')



-- my settings

local o = vim.o

local wo = vim.wo

local bo = vim.bo



-- global options

o.pumheight = 15

o.pumblend = 20

o.clipboard = 'unnamedplus' -- Allow use of system clipboard

o.wildoptions = 'pum' -- Don't use GUI tabline

o.completeopt = [[menuone,noselect,noinsert]]

o.whichwrap = 'h,l,<,>,[,],~'

o.listchars = 'tab:»·,trail:·,nbsp:·,precedes:«,extends:»'

o.backspace = [[indent,eol,start]] -- Intuitive backspacing in insert mode

o.encoding = 'utf-8' -- The encoding displayed

o.fileencoding = 'utf-8' -- The encoding written to file

o.shortmess = 'aoOTI' -- Shorten messages and don't show intro

o.shortmess:gsub('S', '')

o.mouse = 'a' -- enable mouse in all modes

o.mousemodel = 'popup' -- set the behaviour of mouse

o.fileformats = 'unix,dos' -- File type preferences

o.inccommand = 'nosplit' -- live preview the :substitute command

o.showbreak = "\\\\"

o.report = 0

o.undofile = true -- use undo file

-- o.undodir          = "/home/kunzai/.config/nvim/undo" NOT WORKING

vim.opt.undodir = vim.fn.stdpath('config') .. '/undo'

o.undolevels = 2000 -- Number of undo levels

o.undoreload = 10000

o.laststatus = 2 -- Always show the status line

o.showtabline = 0 -- Show no tabline

o.updatetime = 250 -- Frequency update

o.scrolloff = 99 -- Keep at least 2 lines above/below

o.sidescrolloff = 99 -- Keep at least 5 lines left/right

o.showmatch = true -- Highlight matching brace

o.title = false -- change the terminal's title

o.lazyredraw = true -- Only redraw when necessary

o.splitbelow = true -- New splits open to right and bottom

o.splitright = true

o.hlsearch = true -- Search highlighting

o.incsearch = true -- Search starts while entering string

o.ignorecase = true -- Search ignore case

o.smartcase = true -- Search ignore case unless search contains an uppercase

o.infercase = true -- Adjust case in insert completion mode

o.wrapscan = true -- Searches wrap around the end of the file

o.showmatch = true -- Jump to matching bracket

o.cursorline = true -- Color the cursorline

o.backup = false

o.writebackup = false

o.swapfile = false -- Turn off swap files

o.hidden = true -- Buffer becomes hidden when abandoned to prevent need to save

o.autoread = true -- if a file is changed outside Vim, automatically re-read it

o.startofline = false -- Cursor in same column for few commands

o.showfulltag = true -- Show tag and tidy search in completion

o.showmode = false -- Don't show mode in cmd window

o.showcmd = false -- Don't show command in status line

o.shiftround = true -- align indent to next multiple value of shiftwidth

o.shiftwidth = 2 -- Number of auto-indent spaces

o.softtabstop = 2 -- Number of spaces per Tab

o.smarttab = true -- Enable smart-tabs

o.expandtab = true -- Insert spaces when tab pressed

o.ruler = true

o.autochdir = false -- Set the file path as pwd

o.gdefault = true -- Set searching to global by default

o.wildmenu = true -- Command line completion help

o.wildignorecase = true -- Ignore case when completing file names and directories.

o.autowrite = true -- Write files when switching buffers

o.autoread = true -- Read files when switching buffers

o.termguicolors = true -- Enable 24RGB



-- A list of file patterns to ignore when performing expansion and completion.

o.wildignore = o.wildignore .. '*.so,/min/*'

o.wildignore = o.wildignore .. '.git,.hg,.svn,.stversions,*.pyc,*.spl,*.o,*.out,*~,%*'

o.wildignore = o.wildignore .. '*.jpg,*.jpeg,*.png,*.gif,*.log,**/tmp/**'

o.wildignore = o.wildignore .. '**/node_modules/**,**/bower_modules/**,*/.sass-cache/*'

o.wildignore = o.wildignore .. '__pycache__,*.egg-info'

o.wildignore = o.wildignore .. '*.out,*.obj,*.gem,*.pyc,*DS_Store*'

o.wildignore = o.wildignore .. '*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz'

o.wildignore = o.wildignore .. '*.swp,*~,._*,*/vendor/cache/*'



-- window-local options

wo.number = true -- Show line numbers

wo.relativenumber = true

wo.foldmethod = 'marker' -- Autofolding

wo.foldmarker = '/*,*/'

wo.foldnestmax = 10

wo.breakindent = true -- Make every wrapped line visually indented.

wo.colorcolumn = '80' -- Make colorcolumn visible



-- buffer-local options

bo.omnifunc = 'lsp#omnifunc' -- use omni completion provided by lsp

bo.textwidth = 100 -- Line wrap (number of cols)

bo.autoindent = true -- Uses indent from previous line

bo.smartindent = true -- Like cindent except lil' more clever

bo.copyindent = true -- Copy the structure of existing line's indent when autoin



-- highlight yanked stuff

vim.api.nvim_command('au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=150}')



-- vim.cmd "set undodir=~/.config/nvim/undo"



-- vim.cmd "set undodir=~/.config/nvim/undo"
-- vim.cmd "set undodir=~/.config/nvim/undo"
