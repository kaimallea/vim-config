set nocompatible
set laststatus=2
set encoding=utf-8
set t_Co=256
set number

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
