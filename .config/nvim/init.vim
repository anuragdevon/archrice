set rtp +=~/.config/nvim

call plug#begin('/home/anurag/.config/vim/plugged')

Plug 'tomasr/molokai'
Plug 'jiangmiao/auto-pairs' 

call plug#end()

colorscheme molokai

set encoding=utf-8

set number

syntax enable

set noswapfile

set scrolloff=5

set backspace=indent,eol,start

set tabstop=4

set softtabstop=4

set shiftwidth=4

set expandtab

set autoindent

set fileformat=unix
