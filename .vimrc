" Vim-Plug Section
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'

call plug#end()

" Sets the filetype for syntax highlighting and identation rules
filetype plugin indent on
syntax on

" Show line numbers
set number

" Shows the current line number as absolute, and all other lines as relative
set relativenumber

" Use 2 spaces for tabs - standard for Ruby/Rails
set tabstop=2
set shiftwidth=2
set expandtab

" Smarter indentation
set autoindent
set smartindent

" Better searching
set incsearch
set hlsearch
set ignorecase
set smartcase
