let mapleader = ","

" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" Use NerdTree for file browsing
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'arcticicestudio/nord-vim'
" Nice status bar
Plug 'bling/vim-airline'
" Auto close parens, braces, brackets, etc
Plug 'jiangmiao/auto-pairs'
" Show git stuff in gutter
Plug 'airblade/vim-gitgutter'

" Language Protocol Server and autocompelete
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-vim-lsp'

" Initialize plugin system
call plug#end()


" Configurations
"
" Theme
colorscheme nord

" Line Numbers
set number

" Highlight the line the cursor is on.
set cursorline

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

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
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Git status
nnoremap <leader>w :Gstatus<cr>

" LSP and autocomplete
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
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

