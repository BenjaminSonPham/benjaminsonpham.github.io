colorscheme phoenix
PhoenixBlueEighties

set number
set backspace=indent,eol,start
set history=1000
set showcmd
set showmode
set autoread

syntax on

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

filetype plugin on
filetype indent on

set nowrap
set linebreak

set foldmethod=indent   
set foldnestmax=3      
set nofoldenable      

" ================ Scrolling ========================

set scrolloff=7         
set sidescrolloff=14
set sidescroll=1

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital
