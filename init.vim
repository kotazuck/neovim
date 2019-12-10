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
set laststatus=2
set statusline=
set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=\ %n\           " buffer number
set statusline+=%#Visual#       " colour
set statusline+=%{&paste?'\ PASTE\ ':''}
set statusline+=%{&spell?'\ SPELL\ ':''}
set statusline+=%#CursorIM#     " colour
set statusline+=%R                        " readonly flag
set statusline+=%M                        " modified [+] flag
set statusline+=%#Cursor#               " colour
set statusline+=%#CursorLine#     " colour
set statusline+=\ %t\                   " short file name
set statusline+=%=                          " right align
set statusline+=%#CursorLine#   " colour
set statusline+=\ %Y\                   " file type
set statusline+=%#CursorIM#     " colour
set statusline+=\ %3l:%-2c\         " line + column
set statusline+=%#Cursor#       " colour
set statusline+=\ %3p%%\                " percentage

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

  " Comment [ g c c ]
  call dein#add('tpope/vim-commentary')
  " Surround [ c s surround ] [ d s surround ]
  call dein#add('tpope/vim-surround')
  " Markdown
  call dein#add('plasticboy/vim-markdown')
  " NERDTree
  call dein#add('scrooloose/nerdtree')
  " Multiple Cursors
  call dein#add('mg979/vim-visual-multi')
  " Auto close html tags
  call dein#add('alvan/vim-closetag')
  " Auto close ()[]{}""''
  call dein#add('cohama/lexima.vim')
  " Emmet
  call dein#add('mattn/emmet-vim')

  " Align
  call dein#add('junegunn/vim-easy-align')

  " Ale
  call dein#add('w0rp/ale')

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
let g:NERDTreeShowHidden = 1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeDirArrows = 1

" deoplete
let g:deoplete#enable_at_startup=1
let g:deoplete#auto_completion_start_length=1

" vim-closetag
let closetag_filenames = '*.html,*.xhtml,*.php,*.vue'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.vue'
let g:closetag_filetypes = 'html,xhtml,php,vue'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,vue'

let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

" vim-markdown
let g:vim_markdown_folding_disabled = 1

" ALE
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'markdown': ['prettier'],
\   'html': ['prettier'],
\   'css': ['prettier'],
\   'php': ['prettier'],
\}   
let g:ale_lint_on_text_changed = 0
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1


" Key Bindings
let mapleader = "\<Space>"

" Space s で保存
nnoremap <silent><leader>s <Esc>:w<CR>

" Space e でEsc
map <silent><leader>ee <Esc>
map! <silent><leader>ee <Esc>

" Space d で編集中のペインを閉じる（:bd）
nnoremap <silent><leader>d <Esc>:bd<CR>

" タブ移動をSpace + hjklで
nnoremap <silent><leader>w <C-w>w
nnoremap <silent><leader>h <C-w>h
nnoremap <silent><leader>j <C-w>j
nnoremap <silent><leader>k <C-w>k
nnoremap <silent><leader>l <C-w>l

" Ctrl+eでNormalへ
map <silent><C-e> <Esc>
map! <silent><C-e> <Esc>
lmap <silent><C-e> <Esc>

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

" VisualでEnterはヤンク
vnoremap <silent><Enter> y

" space rでinit.vim読み込み :initeでinit.vimの編集
noremap <silent><leader>r <Esc>:source ~/.config/nvim/init.vim<CR>
cnoremap <silent>inite :vs ~/.config/nvim/init.vim


" emmet
" ,,でemmet起動
imap ,, <C-y>,

" Align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
