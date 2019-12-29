set rnu
set noshowmode
set cursorline
set autoindent
set incsearch 
set hlsearch 
set backspace=indent,eol,start
set shiftwidth=2
set smartindent
set expandtab
let mapleader = " "
let g:mapleader = " " 
packloadall
helptags ALL
syntax enable

" --------------- vim-plug ----------

call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'junegunn/vim-easy-align'
Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'jelera/vim-javascript-syntax'
Plug 'kien/ctrlp.vim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tomtom/tcomment_vim'
Plug 'ervandew/supertab'
Plug 'junegunn/limelight.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jiangmiao/auto-pairs'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/1.x',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'vue',
    \ 'lua',
    \ 'php',
    \ 'python',
    \ 'ruby',
    \ 'html',
    \ 'swift' ] }

call plug#end()

" ----------- THEME ----------
let g:dracula_italic = 0
colorscheme dracula
" ----------- lightline ----------

let g:lightline = {
      \ 'colorscheme': 'materia',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

"----------- ctrlP -------------

set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|tox|ico|git|hg|svn))$'
let g:ctrlp_user_command = "find %s -type f | grep -Ev '"+ g:ctrlp_custom_ignore +"'"
let g:ctrlp_use_caching = 1

" --------------- REMAPS --------------
nnoremap <space>n :NERDTreeToggle<CR>
vmap <y> :w! ~/.vbuf<CR>      "copy the current visual selection to ~/.vbuf
nmap <Y> :.w! ~/.vbuf<CR>     "copy the current line to the buffer file if no visual selection
nmap <p> :r ~/.vbuf<CR>       "paste the contents of the buffer file

" --------------- navigate splits --------------

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>





