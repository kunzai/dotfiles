let mapleader = ","

" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" Use NerdTree for file browsing
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'arcticicestudio/nord-vim'
" Nice status bar
Plug 'bling/vim-airline' " Replace by powerline-status
" Auto close parens, braces, brackets, etc
Plug 'jiangmiao/auto-pairs'
" Show git stuff in gutter
Plug 'airblade/vim-gitgutter'
" Git tool
Plug 'tpope/vim-fugitive'
" nerdcommenter
Plug 'preservim/nerdcommenter'
" Seamless switching between tmux and vim
Plug 'christoomey/vim-tmux-navigator'
" focus content
Plug 'junegunn/goyo.vim'
" CSS colorizer
Plug 'chrisbra/Colorizer'
" Highlight trailing whitespaces
Plug 'ntpeters/vim-better-whitespace'
" Indicator for what was yanked
Plug 'machakann/vim-highlightedyank'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Better than grepping Plug 'mileszs/ack.vim' alignment made easy in Visual mode!  Plug 'junegunn/vim-easy-align'

" Language Protocol Server and autocompelete
" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'neovim/nvim-lsp'
"Plug 'ncm2/ncm2'
"Plug 'roxma/nvim-yarp'
"Plug 'ncm2/ncm2-vim-lsp'

" Notes / Wiki
Plug 'vimwiki/vimwiki'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'
" Plug 'mattn/vim-lsp-settings'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'ncm2/ncm2'
" Plug 'roxma/nvim-yarp'
" Plug 'ncm2/ncm2-vim-lsp'
" Plug 'Shougo/deoplete.nvim'
" Plug 'lighttiger2505/deoplete-vim-lsp'
"lug 'autozimu/LanguageClient-neovim', {
"   \ 'branch': 'next',
"   \ 'do': 'bash install.sh',
"   \ }

" languages
" Plug 'ryanolsonx/vim-lsp-javascript'
"lug 'ryanolsonx/vim-lsp-typescript'
Plug 'dart-lang/dart-vim-plugin'
"lug 'natebosch/vim-lsc'
"lug 'natebosch/vim-lsc-dart'
"lug 'ryanolsonx/vim-lsp-javascript'
call plug#end()

" Some basics:
nnoremap c "_c
set nocompatible
filetype plugin on
syntax on
set encoding=utf-8
set number relativenumber
:set ignorecase " if case sensitive is desired replace with noignorecase


" Configurations
" fix for nerdtree-git-plugin with fish shell
set shell=sh
" Theme
colorscheme nord

" Line Numbers
" set number

" Highlight the line the cursor is on.
" set cursorline

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

" clipboard sharing ???
set clipboard+=unnamedplus

" Use arrow keys to switch tabs
nnoremap <Left> :tabprevious<CR>
nnoremap <Right> :tabnext<CR>

" Nerdtree, if no file is give, open nvim with Nerdtree open
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Nerdtree, if folder is given open Nerdtree and make folder root
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Toggle NerdTree
nnoremap <leader>a :NERDTreeToggle<cr>
" Close vim if the last window open is NerdTree
" autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" Enable autocompletion:
set wildmode=longest,list,full
" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Goyo plugin makes text more readable when writing prose: map <leader>g :Goyo \| set bg=light \| set linebreak<CR>
" Git status
" TODO: Check if we have to remap because of vimwiki
nnoremap <leader>w :Gstatus<cr>

" vimwiki configurarion
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
" vim instant markdon 
let g:instant_markdown_autostart = 0 " no autostart
map <leader>md :InstantMarkdownPreview<CR>

" LSP and autocomplete
" enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=cI
nnoremap <leader>e :LspHover<cr>
nnoremap <leader>d :LspDefinition<cr>

" add swapfile to see if nerdtree error is fixed
" set swapfile
set dir=~/.swap-files

" custum mapping for Goyo
nmap <leader>g :Goyo<CR>

" Nerdcommenter: Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1


" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
"set completeopt=noinsert,menuone,noselect
"nnoremap <leader>e :LspHover<cr>
"nnoremap <leader>d :LspDefinition<cr>

" Dart specific configurations
" https://github.com/dart-lang/dart-vim-plugin/blob/master/README.md#how-do-i-configure-an-lsp-plugin-to-start-the-analysis-server
" let g:lsc_auto_map = v:true
" hightlight html inside dart files
let dart_html_in_string=v:true
" two space intendation
let g:dart_style_guide = 2
" format on save
let g:dart_format_on_save = 1

" Use all the defaults (recommended):
" let g:lsc_auto_map = v:true

" Apply the defaults with a few overrides:
" let g:lsc_auto_map = {'defaults': v:true, 'FindReferences': '<leader>r'}

" Setting a value to a blank string leaves that command unmapped:
" let g:lsc_auto_map = {'defaults': v:true, 'FindImplementations': ''}

" ... or set only the commands you want mapped without defaults.
" Complete default mappings are:
"let g:lsc_auto_map = {
"    \ 'GoToDefinition': '<C-]>',
"    \ 'GoToDefinitionSplit': ['<C-W>]', '<C-W><C-]>'],
"    \ 'FindReferences': 'gr',
"    \ 'NextReference': '<C-n>',
"    \ 'PreviousReference': '<C-p>',
"    \ 'FindImplementations': 'gI',
"    \ 'FindCodeActions': 'ga',
"    \ 'Rename': 'gR',
"    \ 'ShowHover': v:true,
"    \ 'DocumentSymbol': 'go',
"    \ 'WorkspaceSymbol': 'gS',
"    \ 'SignatureHelp': 'gm',
"    \ 'Completion': 'completefunc',
"    \}

"let g:LanguageClient_serverCommands = {
"  \ 'typescript': ['javascript-typescript-stdio']
"  \ }

" Required for operations modifying multiple buffers like rename.
set hidden

" Example config
" autocmd Filetype javascript, typescript, setl omnifunc=v:lua.vim.lsp.omnifunc
" nnoremap <silent> ;dc <cmd>lua vim.lsp.buf.declaration()<CR>
" nnoremap <silent> ;df <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> ;h  <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> ;i  <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> ;s  <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> ;td <cmd>lua vim.lsp.buf.type_definition()<CR>



:lua << EOF
require'nvim_lsp'.tsserver.setup{}
require'nvim_lsp'.html.setup{}
require'nvim_lsp'.dartls.setup{}
EOF


" Use LSP omni-completion in Python files.
autocmd Filetype html, typescript, dart setlocal omnifunc=v:lua.vim.lsp.omnifunc
" Client config!
"let g:LanguageClient_serverCommands = {
"    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
"    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
"    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
"    \ 'python': ['/usr/local/bin/pyls'],
"    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
"    \ }
" Server config
"let g:LanguageClient_rootMarkers = {
"    \ 'javascript': ['jsconfig.json'],
"    \ 'typescript': ['tsconfig.json'],
"    \ }
"
"
"nnoremap <F5> :call LanguageClient_contextMenu()<CR>
"
"function! s:on_lsp_buffer_enabled() abort
"    setlocal omnifunc=lsp#complete
"    setlocal signcolumn=yes
"    nmap <buffer> gd <plug>(lsp-definition)
"    nmap <buffer> <f2> <plug>(lsp-rename)
"    " refer to doc to add more commands
"endfunction
"
"augroup lsp_install
"    au!
"    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
"    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
"augroup END
