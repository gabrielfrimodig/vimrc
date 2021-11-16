syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set relativenumber
set nu
set nowrap
set smartcase
set nohlsearch!
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set belloff=all
set autoindent
set exrc
set guicursor=
set hidden
set scrolloff=8
" set signcolumn=yes

set t_Co=256
set encoding=UTF-8      " Needed for icons
set hlsearch
set laststatus=2

" set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgray

"au FileType c,cpp call rainbow#load()    " For spc filetypes only
let g:rainbow_active=1
"let g:airline_theme='one'

highlight VertSplit cterm=NONE
set fillchars+=vert:\

map <C-l> :tabn<CR>
map <C-h> :tabp<CR>
map <C-n> :tabnew<CR>

imap ii <Esc>
nmap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :set hlsearch!<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Keppings it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ'z

" Jumplist mutations
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Undo breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ? ?,<c-g>u
inoremap ! !<c-g>u

" Moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==

" Unhighlight text after search
nnoremap <silent> <esc> :noh<cr><esc>
nnoremap <esc>^[ <esc>^[

set termguicolors
let ayucolor="light"
let ayucolor="mirage"
let ayucolor="dark"

" ag items. Silent ag
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor\ --column
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
endif

" Function StripTrailingWhitespaces()
function! <SID>StripTrailingWhitespaces()
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'            " Lightline statusbar
Plug 'preservim/nerdtree'               " Nerd tree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'preservim/nerdcommenter'          " Nerd comments
Plug 'frazrepo/vim-rainbow'             " Rainbow
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ayu-theme/ayu-vim'
" Plug 'vifm/vifm.vim'
" Plug 'dense-analysus/ale'               " ALE
" Plug 'git@github.com:Valloric/YouCompleteMe.git'
Plug 'pacokwon/onedarkhc.vim'

call plug#end()
