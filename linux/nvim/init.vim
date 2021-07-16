let g:mapleader = "\\" 
packloadall
syntax enable
set nocompatible
set nu rnu
set noshowmode
set cursorline
set autoindent
set updatetime=300
set autoread
set incsearch 
set hlsearch 
set backspace=indent,eol,start
set shiftwidth=2
set smartindent

set tabstop=2
set shiftwidth=2
set expandtab
retab!

set mouse=a
set autowrite
set inccommand=split
set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff700-blinkon700-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff200-blinkon250

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
" --------------- vim-plug ----------

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
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
Plug 'airblade/vim-gitgutter'
Plug 'leafgarland/typescript-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mileszs/ack.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'vim-scripts/tsuquyomi'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug '~/.fzf'
Plug 'neovimhaskell/haskell-vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf.vim'
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
colorscheme seoul256-light
let g:airline_theme='seoul256'
hi! Normal ctermbg=none
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

" --------------- FZF --------------
"  redefine Ag to not include filenames in search
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" --------------- NERDTREE --------------
let NERDTreeShowHidden = 1

" --------------- REMAPS  MISC--------------
nnoremap <space>n :NERDTreeToggle<CR> 
nnoremap <space>u :tabdo e<CR> "re-read from filesystem current tab
nnoremap <space><space>u :bufdo e<CR> "re-read from filesystem all
nnoremap <space>e :ALEDetail<CR>
nnoremap <space>g :call CocAction('jumpDefinition')<CR>
nnoremap <space><space>g :call CocActionAsync('jumpDefinition', 'tab drop')<CR>
nnoremap <space><leader> :tabnext<CR>
nnoremap <leader><space> :tabprevious<CR>
nnoremap <space>s :set spell<CR>
nnoremap <space><space>s :set nospell<CR>
nnoremap <space>l :Prettier<CR>
"close info buffer
nnoremap <space>b <C-W>z      
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv
nnoremap K 5k
nnoremap J 5j
nnoremap L 10l
nnoremap H 10h
"move split to own tab
nnoremap <leader><leader> <C-W>T        

"--------------- REMAPS FZF --------------
imap <c-x><c-l> <plug>(fzf-complete-buffer-line)
nnoremap <silent> <c-p> :GFiles<CR>
nnoremap <leader>p :BLines<CR> 
nnoremap <silent> <c-g> :Ag<CR> 

" --------------- REMAPS COLORS --------------
nnoremap <space>1 :colorscheme OceanicNext<CR>
nnoremap <space>2 :colorscheme hybrid<CR>
nnoremap <space>3 :colorscheme seoul256<CR>
nnoremap <space>4 :colorscheme jhdark<CR>
nnoremap <space>5 :colorscheme wombat256<CR>
nnoremap <space>6 :colorscheme wikipedia<CR>
nnoremap <space>7 :colorscheme seoul256-light<CR>
nnoremap <space>8 :colorscheme babymate256<CR>
nnoremap <space>9 :colorscheme zenburn<CR>
nnoremap <space>0 :colorscheme dracula<CR>

" --------------- navigate splits --------------
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" --------------- ALE --------------
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
" let g:ale_linters = {
"       \ 'javascript': ['eslint'],
"       \ 'typescript': ['eslint', 'tsserver'],
"       \ 'html': ['tidy'],
"       \ 'haskell': ['hdevtools'],
"       \ 'css': ['stylelint']
"       \ }
  let g:ale_fixers = {
  \      'typescript': ['eslint'],
  \      'javascript': ['eslint'],
  \}
highlight ALEWarning ctermbg=Blue ctermfg=Yellow
highlight ALEError ctermbg=Blue ctermfg=White
let g:ale_sign_error = '🚨'
let g:ale_sign_warning = '⚡️'

" --------------- Airline --------------
" let g:airline#extensions#ale#enabled=0
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_section_y=''
let g:airline_section_z=''

" --------------- Prettier on save --------------
" autocmd BufWritePre *.js,*.mjs,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.html Prettier
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


" ---------------  GitGutter --------------
let g:gitgutter_set_sign_backgrounds = 1
let g:gitgutter_sign_added = ''
let g:gitgutter_sign_modified = ''
let g:gitgutter_sign_removed = ''
let g:gitgutter_sign_removed_first_line = ''
let g:gitgutter_sign_removed_above_and_below = ''
let g:gitgutter_sign_modified_removed = ''
let g:gitgutter_sign_allow_clobber = 1

" ---------------  TSUQOYOMI --------------
autocmd FileType typescript setlocal completeopt+=menu,preview
autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>

" ---------------  vue syntax highlighting | vim-vue --------------
let g:vue_pre_processors = 'detect-on-enter'

" ---------------  COC --------------
source /home/$USER/Repos/dotfiles/linux/nvim/cocfile.vim 
