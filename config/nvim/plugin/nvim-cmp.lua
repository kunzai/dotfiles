  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
-- local servers = { 'pyright', 'tsserver', 'cssls', 'html', 'tailwindcss', 'svelte' }
require('lspconfig')['pyright'].setup {
    capabilities = capabilities
  }

require('lspconfig')['tsserver'].setup {
    capabilities = capabilities
  }

require('lspconfig')['cssls'].setup {
    capabilities = capabilities
  }

require('lspconfig')['html'].setup {
    capabilities = capabilities
  }

require('lspconfig')['tailwindcss'].setup {
    capabilities = capabilities
  }


require('lspconfig')['svelte'].setup {
    capabilities = capabilities
  }

-- local compare = require('cmp.config.compare')
-- local types = require('cmp.types')

-- local WIDE_HEIGHT = 40

-- ---@return cmp.ConfigSchema
-- return function()
  -- return {
    -- completion = {
      -- autocomplete = {
        -- types.cmp.TriggerEvent.TextChanged,
      -- },
      -- completeopt = 'menu,menuone,noselect',
      -- keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
      -- keyword_length = 1,
      -- get_trigger_characters = function(trigger_characters)
        -- return trigger_characters
      -- end
    -- },

    -- snippet = {
      -- expand = function()
        -- error('snippet engine is not configured.')
      -- end,
    -- },

    -- preselect = types.cmp.PreselectMode.Item,

    -- documentation = {
      -- border = { '', '', '', ' ', '', '', '', ' ' },
      -- winhighlight = 'NormalFloat:CmpDocumentation,FloatBorder:CmpDocumentationBorder',
      -- maxwidth = math.floor((WIDE_HEIGHT * 2) * (vim.o.columns / (WIDE_HEIGHT * 2 * 16 / 9))),
      -- maxheight = math.floor(WIDE_HEIGHT * (WIDE_HEIGHT / vim.o.lines)),
    -- },

    -- confirmation = {
      -- default_behavior = types.cmp.ConfirmBehavior.Insert,
      -- get_commit_characters = function(commit_characters)
        -- return commit_characters
      -- end
    -- },

    -- sorting = {
      -- priority_weight = 2,
      -- comparators = {
        -- compare.offset,
        -- compare.exact,
        -- compare.score,
        -- compare.kind,
        -- compare.sort_text,
        -- compare.length,
        -- compare.order,
      -- }
    -- },

    -- event = {},

    -- mapping = {},

    -- formatting = {
      -- deprecated = true,
      -- format = function(_, vim_item)
        -- return vim_item
      -- end
    -- },

    -- experimental = {
      -- ghost_text = false,
    -- },

    -- sources = {},
  -- }
-- end
