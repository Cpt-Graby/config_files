" Some config splitting the screen

set noswapfile
set splitbelow splitright
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set cursorline
set colorcolumn=80
syntax on
set autoindent " Auto-indentation des nouvelles lignes
" set noexpandtab " Si l'on veut utiliser des tabs plutot que des espaces
set expandtab
set tabstop=4  " insert 4 espaces dans la tabulation
"set softtabstop=4
set shiftwidth=4 " Set tab width to 4 columns.
set showmatch " Show matching words during a search.
set hlsearch  " Use highlighting when doing a search.
set incsearch " While searching though a file incrementally highlight matching characters as you type.
set showcmd " Show partial command you type in the last line of the screen.
set showmode " Show the mode you are on the last line.
set nu	" Show the number of line
set rnu				

" Vim Plug 

" call plug#begin('~/.vim/plugged')
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
" Plug 'christoomey/vim-tmux-navigator'
" call plug#end()

" " Color theme
" set bg=dark
" colorscheme gruvbox

" Remap fzf
nnoremap <C-F> :Files<Cr>
