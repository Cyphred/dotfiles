" Specifies the directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'tomasiser/vim-code-dark'
Plug 'preservim/tagbar'

" Initializes plugin system
call plug#end()

" base vim settings
set number
set relativenumber
set autoindent
set cursorline
set background=dark
highlight LineNr ctermfg=4
highlight CursorLineNr ctermfg=4

" [GitGutter]
" https://github.com/airblade/vim-gitgutter
function! GitStatus()
	let [a,m,r] = GitGutterGetHunkSummary()
	return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}

" [LightLine]
set laststatus=2
let g:lightline = {
	\ 'colorscheme': 'powerline',
	\ }

" NERDTree
map <C-o> :NERDTreeToggle<CR>

" [tagbar]
nmap <C-\> :TagbarToggle<CR>

