local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
  execute "packadd packer.nvim"
end

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(
  function()
    -- Packer can manage itself
    use "wbthomason/packer.nvim"
    -- themes
    use "shaunsingh/nord.nvim"
    use "rafamadriz/neon"

    use "christoomey/vim-tmux-navigator" -- easier navigtion

    use "neovim/nvim-lspconfig" --
    use "kabouzeid/nvim-lspinstall"
    use "glepnir/lspsaga.nvim"
    use {"ms-jpq/coq_nvim", branch = "coq"} -- main one
    use {"ms-jpq/coq.artifacts", branch = "artifacts"} -- 9000+ Snippets

    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

-- Install nvim-cmp, and buffer source as a dependency
    -- use {
      -- "hrsh7th/nvim-cmp",
      -- requires = {
        -- "hrsh7th/vim-vsnip",
        -- "hrsh7th/cmp-buffer",
      -- }
    -- }
    use "hoob3rt/lualine.nvim" -- statusbar
    use "kyazdani42/nvim-web-devicons" -- icons for statusbar
    use {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}, {"nvim-telescope/telescope-fzy-native.nvim"}}
    }
    use "tpope/vim-fugitive" -- VimL
    use "mhinz/vim-signify" -- VersionControlSystem changes
    use "winston0410/commented.nvim"
    use "windwp/nvim-autopairs"
    use "mhartington/formatter.nvim"
    use "norcalli/nvim-colorizer.lua" -- Colorizer
    use {"ms-jpq/chadtree", branch = "chad", run = "python3 -m chadtree deps"} -- tree
    -- use {'prettier/vim-prettier', branch='release/0.x', run='yarn install', ft = { "html", "javascript", "typescript", "lua", "dart", "python" }}

    use {"prettier/vim-prettier"}

    use {
      "vimwiki/vimwiki",
      requires = {"suan/vim-instant-markdown", opt = "markdown", "mattn/calendar-vim"}
    }

    use {
      "kristijanhusak/orgmode.nvim",
      config = function()
        require("orgmode").setup {
          org_agenda_files = {"~/Nextcloud/org/*", "~/my-orgs/**/*"},
          org_default_notes_file = "~/Nextcloud/org/refile.org"
        }
      end
    }
    -- flutter
    use {"akinsho/flutter-tools.nvim", requires = "nvim-lua/plenary.nvim"}
    use {"dart-lang/dart-vim-plugin"}

    -- debugger
    use {"rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}}

    -- snippets
    use {
      "rafamadriz/friendly-snippets"
    }
    -- use "L3MON4D3/LuaSnip"

    -- indentiation lines
    use "lukas-reineke/indent-blankline.nvim"
  end
)
