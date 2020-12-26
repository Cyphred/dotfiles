" Specifies the directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'tomasiser/vim-code-dark'

" Initializes plugin system
call plug#end()

" base vim settings
set number
set relativenumber
set autoindent
set cursorline
highlight LineNr ctermfg=4
highlight CursorLineNr ctermfg=4

" lightline statusline
set laststatus=2
let g:lightline = {
	\ 'colorscheme': 'powerline',
	\ }

" NERDTree
map <C-o> :NERDTreeToggle<CR>

" color scheme
" colorscheme codedark
colorscheme default
