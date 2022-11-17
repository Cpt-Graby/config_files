set cursorline
set colorcolumn=80
set syntax=on
set autoindent      " Auto-indentation des nouvelles lignes
set tabstop=4 
set softtabstop=4
set shiftwidth=4	" Set tab width to 4 columns.
set showmatch  " Show matching words during a search.
set hlsearch " Use highlighting when doing a search.
set incsearch  		" While searching though a file incrementally highlight matching characters as you type.
set showcmd  " Show partial command you type in the last line of the screen.
set showmode  " Show the mode you are on the last line.
set	nu
set rnu			"Show the number of line

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'sainnhe/vim-color-forest-night'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'vim-syntastic/syntastic'
Plug 'alexandregv/norminette-vim'
call plug#end()

" vim lsp https://github.com/prabirshrestha/vim-lsp
" Lsp setting : https://github.com/mattn/vim-lsp-settings

" Settings for norminette https://github.com/alexandregv/norminette-vim
" Enable norminette-vim (and gcc)
let g:syntastic_c_checkers = ['norminette', 'gcc']
let g:syntastic_aggregate_errors = 1

" Set the path to norminette (do no set if using norminette of 42 mac)
" let g:syntastic_c_norminette_exec = 'norminette'

" Support headers (.h)
let g:c_syntax_for_h = 1
let g:syntastic_c_include_dirs = ['include', '../include', '../../include', 'libft', '../libft/include', '../../libft/include']

" Pass custom arguments to norminette (this one ignores 42header)
let g:syntastic_c_norminette_args = '-R CheckTopCommentHeader'

" Check errors when opening a file (disable to speed up startup time)
let g:syntastic_check_on_open = 1

colorscheme gruvbox
nnoremap <C-F> :Files <CR>