return require("packer").startup(
  function()
    -- Packer can manage itself
    use "wbthomason/packer.nvim"
    -- themes
    use "shaunsingh/nord.nvim"
    use "rafamadriz/neon"
    use 'folke/tokyonight.nvim'

    -- easier navigtion
    use "christoomey/vim-tmux-navigator"

    use {
      "neovim/nvim-lspconfig",
      "williamboman/nvim-lsp-installer"
    }
    -- use { 'tami5/lspsaga.nvim' }
    -- use {"ms-jpq/coq_nvim", branch = "coq"} -- main one
    -- use {"ms-jpq/coq.artifacts", branch = "artifacts"} -- 9000+ Snippets
    use "RishabhRD/popfix"
    use "RishabhRD/nvim-lsputils"

    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/vim-vsnip",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip"
      }
    }
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
    -- use "mhartington/formatter.nvim"
    use "norcalli/nvim-colorizer.lua" -- Colorizer
    -- use {"ms-jpq/chadtree", branch = "chad", run = "python3 -m chadtree deps"} -- tree
    -- use {'prettier/vim-prettier', branch='release/0.x', run='yarn install', ft = { "html", "javascript", "typescript", "lua", "dart", "python" }}
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
          'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        config = function() require'nvim-tree'.setup {} end
    }
    use "jose-elias-alvarez/null-ls.nvim"
    use "MunifTanjim/prettier.nvim"

    use {
      "vimwiki/vimwiki",
      requires = {"davidgranstrom/nvim-markdown-preview", opt = "markdown", "mattn/calendar-vim"}
    }

    use {"evanleck/vim-svelte", branch = "main"}
    -- flutter
    use {"akinsho/flutter-tools.nvim", requires = "nvim-lua/plenary.nvim"}
    use {"dart-lang/dart-vim-plugin"}

    -- debugger
    use {"rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}}

    -- snippets
    use {
      "rafamadriz/friendly-snippets"
    }
    use "L3MON4D3/LuaSnip"

    -- indentiation lines
    use "lukas-reineke/indent-blankline.nvim"

    -- fast search
    -- use "ggandor/lightspeed.nvim"
  end
)
