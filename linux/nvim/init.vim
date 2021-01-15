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
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175
" --------------- vim-plug ----------

call plug#begin('~/.vim/plugged')
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
Plug 'tomtom/tcomment_vim'
Plug 'posva/vim-vue'
Plug 'mileszs/ack.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/limelight.vim'
Plug 'leafgarland/typescript-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mileszs/ack.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'vim-scripts/tsuquyomi'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'ycm-core/YouCompleteMe'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'neovimhaskell/haskell-vim'
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
highlight Visual ctermfg=238 ctermbg=84

" ----------- markdown preview ----------
let g:mkdp_auto_start = 1
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
nnoremap <space>s :set spell<CR>
nnoremap <space><space>s :set nospell<CR>
nnoremap <space>l :Prettier<CR>
nnoremap <space>b <C-W>z      "close info buffer
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv
nnoremap K 5k
nnoremap J 5j
nnoremap L 10l
nnoremap H 10h

" --------------- REMAPS FZF --------------
imap <c-x><c-l> <plug>(fzf-complete-buffer-line)
nnoremap <silent> <c-p> :Files<CR>
nnoremap <leader>p :BLines<CR> 
nnoremap <silent> <c-g> :Ag<CR> 
" --------------- REMAPS COLORS --------------
nnoremap <space>1 :colorscheme OceanicNext<CR>
nnoremap <space>2 :colorscheme desert256<CR>
nnoremap <space>3 :colorscheme seoul256<CR>
nnoremap <space>4 :colorscheme jhdark<CR>
nnoremap <space>5 :colorscheme seoul256-light<CR>
nnoremap <space>6 :colorscheme wikipedia<CR>
nnoremap <space>7 :colorscheme horseradish256<CR>
nnoremap <space>8 :colorscheme babymate256<CR>
nnoremap <space>9 :colorscheme zenburn<CR>
nnoremap <space>0 :colorscheme dracula<CR>
" --------------- navigate splits --------------
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" --------------- FZF --------------
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" --------------- ALE --------------
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_typescript_tsserver_config_path = '/home/vhs/.nvm/versions/node/v12.16.1/bin/tsserver'
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1
" let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc
highlight ALEWarning ctermbg=Blue ctermfg=Yellow
highlight ALEError ctermbg=Blue ctermfg=White
let g:ale_sign_error = '🚨'
let g:ale_sign_warning = '⚡️'

" --------------- Deoplete --------------
"
" set completeopt+=noinsert
"  let g:deoplete#enable_at_startup = 1
" let g:deoplete#disable_auto_complete = 1
"
" call deoplete#custom#option({
"        \'auto_complete_delay': 600,
"        \})
"
" call deoplete#custom#source('_',
" 		\ 'disabled_syntaxes', ['Comment', 'String', 'Constant', 'Buffer'])


" call deoplete#custom#var('omni', 'input_patterns', {
" \ 'javascript': '[^. *\t]\.\w*',
" \ })


" inoremap <silent><expr> <TAB>
"     \ pumvisible() ? "\<C-n>" :
"     \ <SID>check_back_space() ? "\<Tab>" :
"     \ deoplete#complete()
" function! s:check_back_space() abort
"     let col = col('.') - 1
"     return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

highlight Pmenu ctermbg=49 ctermfg=0
highlight PmenuSel ctermbg=0 ctermfg=49
highlight PmenuSbar ctermbg=0 ctermfg=49

" --------------- Airline --------------
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_section_y = ''
let g:airline_section_z = ''

" --------------- Prettier on save --------------
autocmd BufWritePre *.js,*.mjs,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.html Prettier
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
"---------------  YCM --------------
" let g:ycm_seed_identifiers_with_syntax = 1
" let g:ycm_add_preview_to_completeopt = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1

" ---------------  TSUQOYOMI --------------
autocmd FileType typescript setlocal completeopt+=menu,preview
autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>

" ---------------  vue syntax highlighting | vim-vue --------------
let g:vue_pre_processors = 'detect-on-enter'
