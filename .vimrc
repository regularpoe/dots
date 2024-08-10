"
" .vimrc
" regularpoe <vedranvinko@protonmail.com>
"

set nocompatible
filetype off

call plug#begin('~/vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-bufferline'
Plug 'elixir-editors/vim-elixir'
Plug 'itchyny/lightline.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-easy-align'
Plug 'luochen1990/rainbow'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'townk/vim-autoclose'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'Xuyuanp/nerdtree-git-plugin'

" source /home/vedran/vim/plugged/aloy/aloy.vim

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
" map <leader>cd :cd %:p:h<cr>:pwd<cr>

" NERDTree
" Open NERDTree if vim starts with no files
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

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

" coc.vim
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)


" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
