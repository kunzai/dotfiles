local utils = require("utils")
local map = utils.keymap

vim.g['vimwiki_list'] = {
         {path= "~/Nextcloud/vimwiki/work", syntax="markdown", ext=".md"},
         {path= "~/Nextcloud/vimwiki/private", syntax="markdown", ext=".md"},
         {path= "~/Nextcloud/vimwiki/nolessthanepic", syntax="markdown", ext=".md"},
         {path= "~/Nextcloud/vimwiki/", auto_tags=1}
       }

-- vim instant markdon
vim.g['instant_markdown_autostart'] = 0 -- no autostart
vim.g['instant_markdown_browser'] = 'qutebrowser'
map('n', '<leader>md',  ':InstantMarkdownPreview<cr>')

