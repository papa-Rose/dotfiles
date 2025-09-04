" --- Vim-Plug Section ----
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-rails'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'npm ci'}
Plug 'mattn/emmet-vim'
Plug 'andymass/vim-matchup'
Plug 'Yggdroot/indentLine'

" --- My Color Schemes ---
Plug 'whatyouhide/vim-gotham'
Plug 'cseelus/vim-colors-lucid'
Plug 'nikolvs/vim-sunbather'
Plug 'haishanh/night-owl.vim'

call plug#end()

" --- Editor Configurations ---
" Conditionally enable true color support if the terminal supports it
if has('termguicolors') && ($COLORTERM == 'truecolor' || $COLORTERM == '24bit')
  set termguicolors
endif

" Sets the filetype for syntax highlighting and identation rules
filetype plugin indent on
syntax on

" Colorscheme
colorscheme night-owl

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

" Set a vertical line at the 80th column
set colorcolumn=80

" Highlight the current vertical column
set cursorcolumn

" Highlight the current horizontal line
set cursorline

" --- Ergonomics & Shortcuts ---
" Set the Leader Key to comma
let mapleader=","

" Map jj to escape in Insert Mode
inoremap jj <Esc>

" Map spacebar to enter Command Mode
nnoremap <space> :

" Exit Insert mode after creating  a new line (o, O) below or above
nnoremap o o<esc>
nnoremap O O<esc>

" Yank entire line
nnoremap Y y$

" Faster window navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Disable arrow keys to force learning hjkl
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" Turn off search highlighting with ,/
nnoremap <leader>/ :nohlsearch<CR>


" --- Commands ---
" Automatically remove trailing whitespace on save for specific filetypes
autocmd BufWritePre *.rb,*.html,*.erb,*.js,*.css,*.yml :%s/\s\+$//e


" --- NERDTree Configuration ---
" Toggle NERDTree with <leader> + t (,t)
nnoremap <leader>t :NERDTreeToggle<CR>
" Create a shorter command for NERDTreeToggle
command! NTT NERDTreeToggle


" --- Airline Configuration ---
" Enable powerline fonts for fancy symbols
let g:airline_powerline_fonts = 1
" Enable a tabline at the top for managing buffers
let g:airline#extensions#tabline#enabled = 1
" Enable CoC extension
let g:airline#extensions#coc#enabled = 1
" Choose a theme for the status bar
let g:airline_theme = 'night_owl'


" --- CoC (Autocompletion) Configuration ---
" Use Enter to confirm completion
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Use Tab and Shift+Tab to navigate the completion list
inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#pum#next(1) :
  \ CheckBackspace() ? "\<Tab>" :
  \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction


" --- IndentLine Configuration ---
" Use condition logic for color settings
if &termguicolors
  " Use a hex color for true-color terminals (like iTerm2)
  let g:indentLine_color_gui = '#444444'
else
  " Use a 256-palette color for other terminals
  let g:indentLine_color_term = 239
endif


" --- Load local .vimrc on different machine ---
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
end
