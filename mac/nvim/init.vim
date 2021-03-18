let g:mapleader = "\\"
packloadall
syntax enable
set nocompatible
set nu rnu
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
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
set clipboard=unnamed

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'junegunn/vim-easy-align'
Plug 'mattn/emmet-vim'
Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'jelera/vim-javascript-syntax'
Plug 'dense-analysis/ale'
Plug 'tomtom/tcomment_vim'
Plug 'mileszs/ack.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'junegunn/limelight.vim'
Plug 'airblade/vim-gitgutter'
Plug 'leafgarland/typescript-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mileszs/ack.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'vim-scripts/tsuquyomi'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'ryanoasis/vim-devicons'
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
colorscheme dracula

" --------------- navigate splits --------------

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader><leader> :tabnext<CR>

" ----------- lightline ----------

let g:lightline = {
      \ 'colorscheme': 'ayu_mirage',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" ----------- highlighting ----------
highlight Visual ctermfg=238 ctermbg=84

" ----------- markdown preview ----------
let g:mkdp_auto_start = 1
let g:mkdp_refresh_slow = 1

" ----------- Auto Pairs ----------
" let g:AutoPairsShortcutToggle = '<M-P>'

"-----------  snippets ------------
nnoremap <leader>s :r ~/.config/nvim/snippets/

"----------- global subs with confirm ------------
nnoremap <space>r :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>
nnoremap <space>R :%s/\<<C-r><C-w>\>//gci<Left><Left><Left><Left>
vnoremap <space>r y :%s/<C-r>"//gc<Left><Left><Left>


" --------------- NERDTREE --------------
let NERDTreeShowHidden = 1

" --------------- REMAPS  MISC--------------
nnoremap <space>n :NERDTreeToggle<CR> 
nnoremap <space>u :tabdo e<CR> "re-read from filesystem current tab
nnoremap <space><space>u :bufdo e<CR> "re-read from filesystem all
nnoremap <space>e :ALEDetail<CR>
nnoremap <space>g :ALEGoToDefinition<CR>
nnoremap <space>s :set spell<CR>
nnoremap <space><space>s :set nospell<CR>
nnoremap <space>b <C-W>z      "close info buffer
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv
nnoremap K 5k
nnoremap J 5j
nnoremap L 10l
nnoremap H 10h
" move pane to left
nnoremap <leader><backspace> <C-W>r 

" --------------- FZF --------------
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" --------------- REMAPS FZF --------------

imap <c-x><c-l> <plug>(fzf-complete-buffer-line)
nnoremap <silent> <c-p> :Files<CR>
nnoremap <leader>p :BLines<CR> 
nnoremap <silent> <c-g> :Ag<CR> 
inoremap <expr> <c-x><c-k> fzf#vim#complete('cat /usr/share/dict/words')
" --------------- REMAPS COLORS --------------

nnoremap <space>1 :colorscheme scheakur<CR>
nnoremap <space>2 :colorscheme eva01<CR>
nnoremap <space>3 :colorscheme seoul256<CR>
nnoremap <space>4 :colorscheme jhdark<CR>
nnoremap <space>5 :colorscheme wikipedia<CR>
nnoremap <space>6 :colorscheme bubblegum-256-light<CR>
nnoremap <space>7 :colorscheme horseradish256<CR>
nnoremap <space>8 :colorscheme babymate256<CR>
nnoremap <space>9 :colorscheme zenburn<CR>
nnoremap <space>0 :colorscheme dracula<CR>


" --------------- Ale --------------
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_insert_leave = 0
" let g:ale_lint_on_enter = 0
" let g:ale_typescript_tsserver_config_path = '/home/vhs/.nvm/versions/node/v12.16.1/bin/tsserver'
" let g:ale_fix_on_save = 1
" let g:ale_linters_explicit = 1
" let g:ale_linters = {
"       \ 'javascript': ['eslint'],
"       \ 'typescript': ['eslint', 'tsserver'],
"       \ 'html': ['tidy'],
"       \ 'haskell': ['hdevtools'],
"       \ 'css': ['stylelint']
"       \ }
" let g:ale_linter_aliases = {'vue': ['css', 'javascript']}
" let g:ale_fixers = {
"       \ 'javascript': ['eslint', 'prettier'],
"       \ 'json': ['prettier'],
"       \ 'haskell': ['hindent'],
"       \ 'css': ['stylelint']
"       \ }
" let g:deoplete#enable_at_startup = 1
" let g:ale_completion_enabled=1
" set omnifunc=ale#completion#OmniFunc
" highlight ALEWarning ctermbg=Blue ctermfg=Yellow
" highlight ALEError ctermbg=Blue ctermfg=White


" --------------- Airline --------------
let g:airline_theme='papercolor'
" let g:airline_theme='owo'
" let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_section_y = ''
let g:airline_section_z = ''
let g:ale_sign_error = '🚨'
let g:ale_sign_warning = '⚡️'
" let g:ale_javascript_eslint_use_global = 1

" --------------- Prettier on save --------------
autocmd BufWritePre *.js,*.jsx,*.mjs,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.html Prettier

" ---------------  Haskell-vim --------------
"
let g:haskell_indent_disable = 1
let g:haskell_enable_quantification = 1   
let g:haskell_enable_recursivedo = 1     
let g:haskell_enable_arrowsyntax = 1    
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_typeroles = 1     
let g:haskell_enable_static_pointers = 1
let g:haskell_backpack = 1   

" ---------------  TSUQOYOMI --------------
autocmd FileType typescript setlocal completeopt+=menu,preview
autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>


" ---------------  GITGutter --------------
" stage a hunk <leader>hs<CR>
" undo a hunk <leader>hs<CR>

