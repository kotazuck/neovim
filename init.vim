syntax on
colorscheme molokai
set t_Co=256

set autoindent
set smartindent
set expandtab
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,utf-8,ucs-2,cp932,sjis
set tabstop=2
set shiftwidth=2
set cursorline
set number
set showmode
set showmatch
set title
set backspace=indent,eol,start
set inccommand=split

hi Comment ctermfg=gray

if has('mouse')
  set mouse=a
endif

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.config/nvim/dein')
  call dein#begin('~/.config/nvim/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.config/nvim/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.config/nvim')
  "call dein#add('Shougo/neosnippet-snippets')

  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-markdown')
  call dein#add('scrooloose/nerdtree')

  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/neco-syntax')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" NERDTree setting
let g:NERDTreeShowBookmarks=1
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeDirArrows = 1

" deoplete
let g:deoplete#enable_at_startup=1
let g:deoplete#auto_completion_start_length=1


" Key Bindings
inoremap <silent>jj <Esc>j
inoremap <silent>kk <Esc>k

nnoremap <silent><Enter> o<Esc>

cnoremap <silent> inite :vs ~/.config/nvim/init.vim
cnoremap <silent> inits :source ~/.config/nvim/init.vim
