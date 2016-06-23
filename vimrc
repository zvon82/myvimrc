set nocompatible              " be iMproved, required
filetype off                  " required

" Remove ALL autocommands for the current group.
"autocmd! подсветка не работает после

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" colorschemes:
Plugin 'wombat256.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'w0ng/vim-hybrid'
Plugin 'morhetz/gruvbox'
Plugin 'altercation/vim-colors-solarized'

Plugin 'davidhalter/jedi-vim'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tommcdo/vim-exchange'
Plugin 'kien/ctrlp.vim'
"Plugin 'JazzCore/ctrlp-cmatcher' Control-T matcher
Plugin 'scrooloose/nerdtree'
Plugin 'klen/python-mode'
Plugin 'scrooloose/syntastic'
Plugin 'Konfekt/FastFold'
Plugin 'Lokaltog/vim-powerline'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'sessionman.vim'

Plugin 'jceb/vim-orgmode'
Plugin 'vim-scripts/utl.vim'

" Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
" Plugin 'honza/vim-snippets'

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
" colorscheme wombat256mod
colorscheme hybrid
" let g:solarized_termcolors=256
set background=dark
" colorscheme solarized
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

set encoding=utf-8
set fileformat=unix
set list
set listchars=tab:▸\ ,trail:·
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    lang mes en
    set guifont=Consolas:h11:cANSI
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    set guioptions-=m
    set guioptions-=T
  endif
endif

nnoremap j gj
nnoremap k gk
inoremap жж <ESC>
inoremap ;; <ESC>

set mouse=a
nnoremap <silent> <2-LeftMouse> :let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<cr>:set hls<cr>
nnoremap <silent> <leader>h :let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<cr>:set hls<cr>

"nnoremap <leader><S-k> 0xx<Esc>
"nnoremap <leader>k 0i#<space><Esc>


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
" nnoremap <F1> :NERDTreeToggle<cr>
nnoremap <c-b> :CtrlPBuffer<cr>
" nnoremap <F2> :TagbarToggle<cr>
"
" Quicksave command
noremap <leader>s :update<CR>
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
"vnoremap <leader>s :sort<cr>

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


autocmd BufRead,BufNewFile *.conf set filetype=yaml
autocmd FileType org let maplocalleader = "\\"

" set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
" not working set langmap=ж\;,Ж\:,б\,,Б\<,ю\.,Ю\>,э\',Э\",х\[,Х\{,ъ\],Ъ\}
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan


" Pymode
let g:pymode_rope = 0
let g:pymode_rope_vim_completion = 0
let g:pymode_virtualenv = 1
let g:pymode_lint = 0
let g:pymode_lint_write = 0
let g:pymode_run = 0
let g:pymode_syntax = 1
let g:pymode_syntax_slow_sync = 0
set completeopt-=preview


" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
    \ "mode": "passive",
    \ "active_filetypes": [],
    \ "passive_filetypes": [] }


" FastFold
let g:python_fold = 1

