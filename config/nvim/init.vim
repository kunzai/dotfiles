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
Plug 'neovim/nvim-lsp'

" Notes / Wiki
Plug 'vimwiki/vimwiki'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

" languages
Plug 'dart-lang/dart-vim-plugin'
call plug#end()

" Some basics:
" nnoremap c "_c
set nocompatible
filetype plugin on
syntax on
set encoding=utf-8
set number relativenumber
" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Goyo plugin makes text more readable when writing prose: map <leader>g :Goyo \| set bg=light \| set linebreak<CR>

" Configurations
" fix for nerdtree-git-plugin with fish shell
set shell=sh
" Theme
colorscheme nord


" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" read/write file when switching buffers
"set autowrite
set autowriteall
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
" nnoremap <Left> :tabprevious<CR>
" nnoremap <Right> :tabnext<CR>

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

" Git status
" TODO: Check if we have to remap because of vimwiki
nnoremap <leader>w :Gstatus<cr>

" vimwiki configurarion
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
" vim instant markdon 
let g:instant_markdown_autostart = 0 " no autostart
map <leader>md :InstantMarkdownPreview<CR>
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


" hightlight html inside dart files
let dart_html_in_string=v:true
" two space intendation
let g:dart_style_guide = 2
" format on save
let g:dart_format_on_save = 1

" Required for operations modifying multiple buffers like rename.
set hidden


:lua << EOF
  require'nvim_lsp'.tsserver.setup{}
  require'nvim_lsp'.html.setup{}
  require'nvim_lsp'.dartls.setup{}
  require'nvim_lsp'.cssls.setup{}
  require'nvim_lsp'.jsonls.setup{}
EOF

