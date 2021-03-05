let mapleader = " "

" disable python2
let g:loaded_python_provider = 0
let g:python3_host_prog  = '/usr/bin/python3'

" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')
" colorscheme to use
Plug 'arcticicestudio/nord-vim'
" Nice status bar
Plug 'itchyny/lightline.vim'

" manipulate ' " [ { easier
Plug 'tpope/vim-surround'
" Auto close parens, braces, brackets, etc
Plug 'Raimondi/delimitMate'
" Plug 'jiangmiao/auto-pairs'
" Show vcs stuff
Plug 'mhinz/vim-signify'
" Git tool
Plug 'tpope/vim-fugitive'
" nerdcommenter
Plug 'preservim/nerdcommenter'
" Seamless switching between tmux and vim
Plug 'christoomey/vim-tmux-navigator'
" focus content
" CSS colorizer
Plug 'lilydjwg/colorizer'
" Highlight trailing whitespaces
Plug 'ntpeters/vim-better-whitespace'
" Indicator for what was yanked
Plug 'machakann/vim-highlightedyank'

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Better than grepping Plug 'mileszs/ack.vim' alignment made easy in Visual mode!
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}

" Plug 'junegunn/goyo.vim'
Plug 'jremmen/vim-ripgrep'
" Notes / Wiki
Plug 'vimwiki/vimwiki'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'mattn/calendar-vim'

" zoom in and out
Plug 'szw/vim-maximizer'
" languages
Plug 'dart-lang/dart-vim-plugin'
" Plug 'thosakwe/vim-flutter'
Plug 'Neevash/awesome-flutter-snippets'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
call plug#end()

" Some basics:
filetype plugin on
syntax on
set encoding=utf-8

" Line numbers should appear so:
" set number
set number relativenumber

" panes split how:
set splitbelow splitright

" Search not case-sensitive when only lower-case chars used
set incsearch
set ignorecase
set smartcase
set noswapfile
" get rid of second mode display, lightline handles this
set noshowmode
" netrw
let g:netrw_banner = 0 " remove banner on top
let g:netrw_liststyle = 3 " show tree listing
" let g:netrw_browse_split = 2
" let g:netrw_altv = 1 " open splits to the right
let g:netrw_fastbrowse = 0
let g:netrw_winsize = 25
let g:netrw_preview = 1 " open preview splits to the right

" Per default, netrw leaves unmodified buffers open. This autocmd
" deletes netrw's buffer once it is hidden
autocmd FileType netrw setl bufhidden=delete " or use :qa!
" These next three lines are for the fuzzy search
set nocompatible
set path+=**
set wildmenu

" Disables automatic commenting on newline:
" autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" lightline configurarion
let g:lightline = {
      \ 'colorscheme': 'nord',
 \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'gitbranch', 'readonly', 'relativepath', 'modified', 'paste', 'bufnum' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'gitbranch': 'FugitiveHead'
      \ },
  \ }
set laststatus=2
" Use autocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" use this colorscheme
colorscheme nord

" Highlight the line the cursor is on.
" set cursorline

" folding options
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
" set foldlevel=2

" map vertical resize
nnoremap <silent> <Leader>= :resize +10 <CR>
nnoremap <silent> <Leader>' :resize -10 <CR>
nnoremap <silent> <Leader>[ :vertical resize -10 <CR>
nnoremap <silent> <Leader>] :vertical resize +10 <CR>

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" read/write file when switching buffers
set autowrite
set autoread

" tab settings
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set smarttab

" Automatic indentation is good
set autoindent

" Undo function after reopening
set undofile
set undodir=/tmp
set colorcolumn=80

" clipboard sharing ???
set clipboard+=unnamedplus

" Use arrow keys to switch tabs
nnoremap <Left> :tabprevious<CR>
nnoremap <Right> :tabnext<CR>


" Enable true color
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Keymaps for MaximizerToggle
nnoremap <silent><F3> :MaximizerToggle<CR>
vnoremap <silent><F3> :MaximizerToggle<CR>gv
inoremap <silent><F3> <C-o>:MaximizerToggle<CR>


" Git fugitive and coc, go hand in hand
nnoremap <leader>gs :G<CR>
nnoremap <leader>gt :diffget //3<CR> " left side
nnoremap <leader>gn :diffget //2<CR> " right side
nnoremap <leader>gg :GFiles<CR>
nnoremap <leader>gf :Files<CR>
nnoremap <leader>gl :Lines<CR>
nnoremap <leader>gb :Buffers<CR>

" vimwiki configurarion
let g:vimwiki_list = [
        \ {'path': '~/Nextcloud/vimwiki/work', 'syntax': 'markdown', 'ext': '.md'},
        \ {'path': '~/Nextcloud/vimwiki/private', 'syntax': 'markdown', 'ext': '.md'},
        \ {'path': '~/Nextcloud/vimwiki/nolessthanepic', 'syntax': 'markdown', 'ext': '.md'},
        \ {'path': '~/Nextcloud/vimwiki/','auto_tags':1}]

" vim instant markdon
let g:instant_markdown_autostart = 0 " no autostart
map <leader>md :InstantMarkdownPreview<CR>

" set swapfile
set dir=~/.swap-files

" Nerdcommenter: Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1


" Dart specific configurations
" https://github.com/dart-lang/dart-vim-plugin/blob/master/README.md#how-do-i-configure-an-lsp-plugin-to-start-the-analysis-server
" let g:lsc_auto_map = v:true
" hightlight html inside dart files
let dart_html_in_string=v:true
" two space intendation
let g:dart_style_guide = 2
" format on save
let g:dart_format_on_save = 1

" vim-snipets "*************************************
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" vim-snipets "*************************************


let g:coc_snippet_next = '<tab>'
" prettier start
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" configuration needed for vim-lsp
" :lua << EOF
" require'nvim_lsp'.tsserver.setup{}
" require'nvim_lsp'.html.setup{}
" require'nvim_lsp'.dartls.setup{}
" EOF

" mhinz-signify settings
" default updatetime 4000ms is not good for async update
set updatetime=100

" fzf settings
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using Vim function
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
" " Use LSP omni-completion in Python files.
" autocmd Filetype html, typescript, dart setlocal omnifunc=v:lua.vim.lsp.omnifunc




" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Apply CodeAction to selected region
" Example: <leader>aap for current paragraph, <leader>aw for the current word.
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


set mouse=
