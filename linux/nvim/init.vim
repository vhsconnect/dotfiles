let g:mapleader = "\\" 
" let mapleader= "\\"
packloadall
syntax enable
set nocompatible
set rnu
set noshowmode
set cursorline
set autoindent
set autoread
set incsearch 
set hlsearch 
set backspace=indent,eol,start
set shiftwidth=2
set smartindent
set expandtab
set mouse=a
set autowrite
set inccommand=split
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175
" --------------- vim-plug ----------

call plug#begin('~/.vim/plugged')
" Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'junegunn/vim-easy-align'
Plug 'mattn/emmet-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'jelera/vim-javascript-syntax'
Plug 'dense-analysis/ale'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tomtom/tcomment_vim'
" Plug 'ervandew/supertab'
Plug 'posva/vim-vue'
Plug 'mileszs/ack.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'junegunn/limelight.vim'
Plug 'leafgarland/typescript-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mileszs/ack.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" Plug 'vim-scripts/tsuquyomi'
Plug 'ycm-core/YouCompleteMe'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
" Plug 'kien/ctrlp.vim'
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
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" ----------- highlighting ----------
highlight Visual ctermfg=Blue ctermbg=White


" ----------- markdown preview ----------
let g:mkdp_auto_start = 1
" let g:mkdp_browser = 'firefox'
let g:mkdp_refresh_slow = 1
" ----------- Auto Pairs ----------
let g:AutoPairsShortcutToggle = '<M-P>'

" ----------- copy to system clipboard ----------

function! ClipboardYank()
  call system('xclip -i -selection clipboard', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('xclip -o -selection clipboard')
endfunction

vnoremap <silent> <space>y y:call ClipboardYank()<cr>
vnoremap <silent> <space>d d:call ClipboardYank()<cr>
nnoremap <silent> <space>p :call ClipboardPaste()<cr>p
"copy the current visual selection to ~/.vbuf
vmap <y> :w! ~/.vbuf<CR>      
"copy the current line to the buffer file if no visual selection
nmap <Y> :.w! ~/.vbuf<CR>     
"paste the contents of the buffer file
nmap <p> :r ~/.vbuf<CR>       
"----------- ctrlP -------------
"
" set wildmode=list:longest,list:full
" set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
" let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|tox|ico|git|hg|svn))$'
" let g:ctrlp_user_command = "find %s -type f | grep -Ev '"+ g:ctrlp_custom_ignore +"'"
" let g:ctrlp_use_caching = 1
" let g:ctrlp_show_hidden = 1


"----------- global subs with confirm ------------
nnoremap <leader>r :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>
nnoremap <leader>R :%s/\<<C-r><C-w>\>//gci<Left><Left><Left><Left>
vnoremap <leader>r y :%s/<C-r>"//gc<Left><Left><Left>


" --------------- NERDTREE --------------
let NERDTreeShowHidden = 1

" --------------- REMAPS  MISC--------------
nnoremap <space>n :NERDTreeToggle<CR> 
nnoremap <space>u :tabdo e<CR> "re-read from filesystem current tab
nnoremap <space><space>u :bufdo e<CR> "re-read from filesystem all
nnoremap <space>e :ALEDetail<CR>
nnoremap <space>s :set spell<CR>
nnoremap <space><space>s :set nospell<CR>
nnoremap <space>b <C-W>z      "close info buffer
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv
nnoremap K 5k
nnoremap J 5j
nnoremap L 10l
nnoremap H 10h
" --------------- REMAPS FZF --------------
imap <c-x><c-l> <plug>(fzf-complete-buffer-line)
nnoremap <silent> <c-p> :GFiles<CR>
nnoremap <c-m> :BLines<CR> 
nnoremap <silent> <c-g> :Ag<CR> 


" --------------- navigate splits --------------

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>



" --------------- FZF --------------
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'


" --------------- Ale --------------
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_fix_on_save = 1
let g:ale_linters = {
      \ 'javascript': ['eslint', 'prettier'],
      \ }
let g:ale_linter_aliases = {'vue': ['css', 'javascript']}
let g:ale_linters_explicit = 1
let g:ale_fixers = {
      \ 'javascript': ['eslint'],
      \ 'json': ['prettier'],
      \ 'typescript': ['prettier']
      \ }
highlight ALEWarning ctermbg=Blue ctermfg=Yellow
highlight ALEError ctermbg=Blue ctermfg=White
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_section_y = ''
let g:airline_section_z = ''
let g:ale_sign_error = '🚨'
let g:ale_sign_warning = '⚡️'
" let g:ale_javascript_eslint_use_global = 1
" --------------- Prettier on save --------------
" let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.html Prettier

" ---------------  YCM --------------
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
" ---------------  TSUQOYOMI --------------
" autocmd FileType typescript setlocal completeopt+=menu,preview
" autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>

" ---------------  vue syntax highlighting | vim-vue --------------
let g:vue_pre_processors = 'detect-on-enter'
