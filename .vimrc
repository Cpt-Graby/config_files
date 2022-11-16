" Some config splitting the screen
set splitbelow splitright
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
set exrc
set noerrorbells
set hlsearch
set relativenumber
set nu
set autoindent
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set syntax=on
set colorcolumn=80
set signcolumn=yes
set hidden

" Vim Plug 
call plug#begin('~/.vim/plugged')
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

" Color theme
set bg=dark
colorscheme dracula

" Remap fzf
nnoremap <C-F> :Files<Cr>
