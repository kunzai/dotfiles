local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'shaunsingh/nord.nvim'
  use "christoomey/vim-tmux-navigator"; -- easier navigtion

  use "neovim/nvim-lspconfig";          -- 

  use {'nvim-treesitter/nvim-treesitter', run=':TSUpdate'};

  use "hrsh7th/nvim-compe";
  use "hoob3rt/lualine.nvim"; -- statusbar
  use 'kyazdani42/nvim-web-devicons'; -- icons for statusbar
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope-fzy-native.nvim'}}
  }
  use 'tpope/vim-fugitive'; -- VimL
  use 'mhinz/vim-signify';                -- VersionControlSystem changes
  use{'winston0410/commented.nvim'}
  use 'windwp/nvim-autopairs';
  use 'mhartington/formatter.nvim'
  use 'norcalli/nvim-colorizer.lua';      -- Colorizer
  use {'ms-jpq/chadtree', branch='chad', run='python3 -m chadtree deps'}; -- tree
  use {'prettier/vim-prettier', branch='release/0.x', run='yarn install', ft = { "html", "javascript", "typescript", "lua", "dart", "phyton" }};


  use {
    'vimwiki/vimwiki',
    opt=true, 
    requires = {'suan/vim-instant-markdown', opt='markdown', 'mattn/calendar-vim'}
  }

  -- flutter 
  use {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim'}
  -- debugger 
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
end)
