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
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('alvan/vim-closetag')
  call dein#add('cohama/lexima.vim')
  call dein#add('mattn/emmet-vim')

  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/neco-syntax')

  call dein#add('phpactor/phpactor')

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
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeDirArrows = 1

" deoplete
let g:deoplete#enable_at_startup=1
let g:deoplete#auto_completion_start_length=1

" multi-cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction


let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" vim-closetag
let closetag_filenames = '*.html,*.xhtml,*.php,*.vue'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.vue'
let g:closetag_filetypes = 'html,xhtml,php,vue'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,vue'

let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'


" Key Bindings
let mapleader = "\<Space>"

" Space + s で保存
nnoremap <silent><leader>s <Esc>:w<CR>
nnoremap <silent><leader>w <C-w>w
nnoremap <silent><leader>h <C-w>h
nnoremap <silent><leader>j <C-w>j
nnoremap <silent><leader>k <C-w>k
nnoremap <silent><leader>l <C-w>l

" Phpactor
" useの補完
nmap <silent><Leader>u      :<C-u>call phpactor#UseAdd()<CR>
" コンテキストメニューの起動(カーソル下のクラスやメンバに対して実行可能な選択肢を表示してくれます)
nmap <silent><Leader>mm     :<C-u>call phpactor#ContextMenu()<CR>
" ナビゲーションメニューの起動(クラスの参照元を列挙したり、他ファイルへのジャンプなど)
nmap <silent><Leader>nn     :<C-u>call phpactor#Navigate()<CR>
" カーソル下のクラスやメンバの定義元にジャンプ
nmap <silent><Leader>o      :<C-u>call phpactor#GotoDefinition()<CR>
" 編集中のクラスに対し各種の変更を加える(コンストラクタ補完、インタフェース実装など)
nmap <silent><Leader>tt     :<C-u>call phpactor#Transform()<CR>
" 新しいクラスを生成する(編集中のファイルに)
nmap <silent><Leader>cc     :<C-u>call phpactor#ClassNew()<CR>
" 選択した範囲を変数に抽出する
nmap <silent><Leader>ee     :<C-u>call phpactor#ExtractExpression(v:false)<CR>
" 選択した範囲を変数に抽出する
vmap <silent><Leader>ee     :<C-u>call phpactor#ExtractExpression(v:true)<CR>
" 選択した範囲を新たなメソッドとして抽出する
vmap <silent><Leader>em     :<C-u>call phpactor#ExtractMethod()<CR>
" split → jump
nmap <silent><C-w><Leader>o :<C-u>call DefinitionJumpWithPhpactor()<CR>
" カーソル下のクラスや変数の情報を表示する
" 他のエディタで、マウスカーソルをおいたときに表示されるポップアップなどに相当
vmap <silent><Leader>hh     :<C-u>call phpactor#Hover()<CR><Paste>

nnoremap <silent><leader>t :NERDTreeToggle<CR>
map <C-a> :NERDTreeToggle<CR>

inoremap <silent>jj <Esc>j
inoremap <silent>kk <Esc>k

" NormalでEnterを押すと改行
nnoremap <silent><Enter> o<Esc>

" 画面スクロールをCtrl+矢印で
"noremap <silent><C-Up> <C-u> 
"noremap <silent><C-Down> <C-d> 

" Ctrl+左右で行頭行末へ移動
noremap <silent><C-Left> 0
inoremap <silent><C-Left> <Esc>0i
noremap <silent><C-Right> $
inoremap <silent><C-Right> <Esc>$a

" Shift + 矢印で選択モード
nnoremap <silent><S-Up> <Esc>vk
nnoremap <silent><S-Down> <Esc>vj
nnoremap <silent><S-Left> <Esc>vh
nnoremap <silent><S-Right> <Esc>vl
vnoremap <silent><S-Up> k
vnoremap <silent><S-Down> j
vnoremap <silent><S-Left> h
vnoremap <silent><S-Right> l
inoremap <silent><S-Up> <Esc>vk
inoremap <silent><S-Down> <Esc>vj
inoremap <silent><S-Left> <Esc>vh
inoremap <silent><S-Right> <Esc>vl

" Shift + hjklで選択モード
nnoremap <silent><S-k> <Esc>vk
nnoremap <silent><S-j> <Esc>vj
nnoremap <silent><S-h> <Esc>vh
nnoremap <silent><S-l> <Esc>vl
vnoremap <silent><S-k> k
vnoremap <silent><S-j> j
vnoremap <silent><S-h> h
vnoremap <silent><S-l> l
inoremap <silent><S-k> <Esc>vk
inoremap <silent><S-j> <Esc>vj
inoremap <silent><S-h> <Esc>vh
inoremap <silent><S-l> <Esc>vl

" VisualでEnterはヤンク
vnoremap <silent><Enter> y

" space rでinit.vim読み込み :initeでinit.vimの編集
noremap <silent><leader>r <Esc>:source ~/.config/nvim/init.vim<CR>
cnoremap <silent>inite :vs ~/.config/nvim/init.vim


" emmet
" ,,でemmet起動
imap ,, <C-y>,
