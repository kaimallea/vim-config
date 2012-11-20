set nocompatible
set laststatus=2
set encoding=utf-8
set t_Co=256
set number
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set mouse=a
set list listchars=tab:→\ ,trail:·

filetype off
filetype plugin indent on
syntax on


set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-powerline'
Bundle 'altercation/vim-colors-solarized'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'tomtom/tcomment_vim'

"SnipMate Dependencies
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/snipmate-snippets"
"SnipMate itself
Bundle "garbas/vim-snipmate"
