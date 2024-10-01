"
" .vimrc
" regularpoe <vedranvinko@protonmail.com>
"

set nocompatible
filetype off

call plug#begin('~/vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'APZelos/blamer.nvim'
Plug 'bling/vim-bufferline'
Plug 'bronson/vim-trailing-whitespace'
Plug 'elixir-editors/vim-elixir'
Plug 'glts/vim-magnum'
Plug 'glts/vim-radical'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-cursorword'
Plug 'jlanzarotta/bufexplorer'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-easy-align'
Plug 'luochen1990/rainbow'
Plug 'mbbill/undotree'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/vim-snakey-camel'
Plug 'townk/vim-autoclose'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tyru/open-browser.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'

source /home/vedran/vim/plugged/aloy/aloy.vim

if executable('rustc')
  Plug 'rust-lang/rust.vim', { 'for': 'rust' }
endif

call plug#end()

filetype plugin indent on
syntax on
colorscheme 1989

set autoindent
set autoread
set backspace=indent,eol,start
set clipboard=unnamed
set cmdheight=2
set copyindent
set encoding=utf8
set expandtab
set ffs=unix,dos,mac
set gdefault
set gp=git\ grep\ -n
set hidden
set history=500
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set magic
set nobackup
set nocursorline
set noerrorbells
set nolist
set nomodeline
set noshowmode
set noswapfile
set nowb
set nowrap
set nowritebackup
set number
set pastetoggle=<F2>
set ruler
set scrolloff=4
set shiftround
set shiftwidth=4
set shortmess+=I
set showcmd
set showmatch
set si
set smartcase
set smarttab
set softtabstop=2
set tabstop=4
set ttyfast
set undolevels=1000
set updatetime=300
set visualbell
set wildignore=*.swp,*.bak,*.pyc,*.o
set wildmenu
set wildmode=list:full
set wrap

if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

let mapleader = ","
let g:mapleader = ","

nmap <leader>w :w!<cr>

" :W sudo saves the file
command W w !sudo tee % > /dev/null

" Use hjkl keys
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Move 1 more lines up or down in normal and visual selection modes.
nnoremap K :m .-2<CR>==
nnoremap J :m .+1<CR>==
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

" Insert \v as a first char in searching; disable Vim regex
nnoremap / /\v
vnoremap / /\v

" Toggle show/hide invisible chars
nnoremap <leader>i :set list!<cr>

" Toggle line
nnoremap <leader>N :setlocal number!<cr>

" Discard search
nnoremap <leader><space> :nohlsearch<CR>

" Strip all trailing whitespace from a file, using ,W
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>

" Quickly close the current window
nnoremap <leader>Q :q<CR>

" Quickly close the current buffer
nnoremap <leader>q :bd<CR>

" Sort paragraphs
vnoremap <leader>s !sort -f<CR>gv
nnoremap <leader>s vip!sort -f<CR><Esc>

" Insert date - Oct 8, 2018
nnoremap <leader>fd "=strftime("%b %d, %Y")<CR>p

" Jump to matching pairs easily, with Tab
nnoremap <Tab> %
vnoremap <Tab> %

" C-U in insert/normal mode, to uppercase the word under cursor
inoremap <c-u> <esc>viwUea
nnoremap <c-u> viwUe

" C-L in insert/normal mode, to lowercase the word under cursor
inoremap <c-l> <esc>viwUea
nnoremap <c-l> viwue

" Quote words under cursor
nnoremap <leader>" viW<esc>a"<esc>gvo<esc>i"<esc>gvo<esc>3l
nnoremap <leader>' viW<esc>a'<esc>gvo<esc>i'<esc>gvo<esc>3l

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" NERDTree
" Open NERDTree if vim starts with no files
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open NERDTree with Ctrl+t
map <C-t> :NERDTreeToggle<CR>

" Show hidden files, too
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1

" Highlight the selected entry in the tree
let NERDTreeHighlightCursorline=1

" Rust
let g:rustfmt_autosave = 1

" Rainbow plugin
let g:rainbow_active = 1

" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" fzf
" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'

" Blamer
let g:blamer_enabled = 1
let g:blamer_prefix = ' > '

" Auto save files on buffer/focus lost
autocmd BufLeave,FocusLost * silent! wall

" lightline git branch name
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" vim-radical
" crd, crx, cro, crb convert the number under the cursor to decimal, hex, octal, binary, respectively

" vim-snakey-camel
" <leader>ss 	To snake case
" <leader>sS 	To upper snake case
" <leader>sc 	To camel case
" <leader>sC 	To upper camel case
" <leader>sk 	To kebab case
" <leader>sK 	To screaming kebab case

" undotree
nnoremap <F5> :UndotreeToggle<CR>

