set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'wombat256.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'tpope/vim-sensible'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'klen/python-mode'
Plugin 'Lokaltog/vim-powerline'
Plugin 'jistr/vim-nerdtree-tabs'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
colorscheme wombat256mod
set hlsearch
set incsearch
set number
set relativenumber
set ruler

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set autoindent
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set laststatus=2

let mapleader = ","

set ignorecase
set smartcase
set gdefault

nnoremap <leader><space> :noh<cr>
" nnoremap <tab> %
" vnoremap <tab> %

set formatoptions=qrn1
" set colorcolumn=85

set list
set listchars=tab:▸\ ,trail:·

nnoremap j gj
nnoremap k gk
inoremap jj <ESC>

set mouse=a
nnoremap <silent> <2-LeftMouse> :let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<cr>:set hls<cr>
nnoremap <silent> <leader>h :let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<cr>:set hls<cr>

nnoremap <leader><S-k> 0xx<Esc>
nnoremap <leader>k 0i#<space><Esc>


" github.com/mbrochh
" " http://www.youtube.com/watch?v=YhqsjUUHj6g
" " Vim as a Python IDE
" " Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %
"
" " Better copy & paste
set pastetoggle=<F2>
" set clipboard=unnamed
" set bs=2
"
" Quicksave command
noremap <C-z> :update<CR>
" voremap <C-z> :update<CR>
" ioremap <C-z> :update<CR>
"
" Quick quit command
noremap <leader>e :quit<cr>
" noremap <leader>E :qa!<cr>
"
" bind Ctrl+<movement> keys to move around the windows
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
"
" easier mving between tabs
" map <leader>n <esc>:tabprevious<cr>
" map <leader>m <esc>:tabnext<cr>

" map sort function to a key
vnoremap <leader>s :sort<cr>

" easier moving f code blocks
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Showing line numbers and length
" set number
" set tw=79  " width of document (used by gd)
" set nowrap  " don't automatically wrap on load
" set fo-=t  " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=grey
"
" easier formatting of paragraphs
" vmap Q gq
" nmap Q gqap
"
" Disable stupid backup and swap files - they trigger too many events
" set nobackup
" set nowritebackup
" set noswapfile
"
" Plugins:
" vim-powerline
" ctrlp
" python-mode
" python_editing

au BufRead,BufNewFile *.conf set filetype=yaml

set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

