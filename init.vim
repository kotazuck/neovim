
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

" htmlのマッチするタグに%でジャンプ
source $VIMRUNTIME/macros/matchit.vim

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
  call dein#add('Shougo/deoplete.nvim')
  let g:deoplete#enable_at_startup=1
  call dein#add('Shougo/neosnippet')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/neco-syntax')

  " auto complete
  call dein#add('neoclide/coc.nvim', {'rev': 'release', 'build': 'npm install -g vue-language-server'})

  " html5 & css3
  call dein#add('othree/html5.vim', {"ft": ["html", "css", "php", "vue"]})
  call dein#add('hail2u/vim-css3-syntax', {"ft": ["html", "css", "php", "vue"]})

  " Comment [ g c c ]
  call dein#add('tpope/vim-commentary')
  " Surround [ c s surround ] [ d s surround ]
  call dein#add('tpope/vim-surround')
  " NERDTree
  call dein#add('scrooloose/nerdtree')
  call dein#add('jistr/vim-nerdtree-tabs')

  " Multiple Cursors
  call dein#add('mg979/vim-visual-multi')
  " Auto close html tags
  call dein#add('alvan/vim-closetag')
  " Auto close ()[]{}""''
  call dein#add('cohama/lexima.vim')
  " Emmet
  call dein#add('mattn/emmet-vim', {"on_ft": ["html", "css", "php", "vue"]})

  " Align
  call dein#add('junegunn/vim-easy-align')

  " Ale
  call dein#add('w0rp/ale', {'build': 'npm install -g eslint eslint-babel eslint-config-vue eslint-plugin-vue eslint-plugin-import stylelint-config-standard stylelint-processor-html prettier'})

  " PHP
  call dein#add('phpactor/phpactor', { "build": "composer install", "on_ft": ["php"] })

  " Markdown
  call dein#add('plasticboy/vim-markdown')

  " Vue
  call dein#add('posva/vim-vue')

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

" 隠しファイルの表示
let g:NERDTreeDirArrows = 1

" 除外ファイル
let NERDTreeIgnore = ['\.git$', 'node_modules']

let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_focus_on_files = 1

" deoplete
let g:deoplete#auto_completion_start_length=2
"Tab補完の設定
inoremap <expr><tab> pumvisible() ? "\<C-n>" :
      \ neosnippet#expandable_or_jumpable() ?
      \    "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"

" neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

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
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" ALE
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'vue': ['prettier'],
\   'markdown': ['prettier'],
\   'html': ['prettier'],
\   'css': ['prettier'],
\   'php': ['prettier'],
\}   
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1

" lint
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'vue': ['eslint'],
\   'css': ['stylelint'],
\}

" 行数の左に常にマーク用領域を表示
let g:ale_sign_column_always = 1
" lint結果のマーク
let g:ale_sign_error = '!!'
let g:ale_sign_warning = '=='
" 保存時実行
let g:ale_lint_on_save = 1
" 警告パネルの表示でなくquickfixを実行する
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
" 警告パネルを表示
let g:ale_open_list = 1
" エラーと警告がなくなっても開いたままにする
let g:ale_keep_list_window_open = 0 

" eslint
let g:ale_javascript_eslint_options = '--ignore-pattern "!.eslintrc.js"'

" Key Bindings
let mapleader = "\<Space>"

" Space s で保存
nnoremap <silent><leader>s <Esc>:w<CR>

" Space e でEsc
map <silent><leader>ex <Esc>
map! <silent><leader>ex <Esc>

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
au FileType php nmap <buffer> <silent><Leader>u      :<C-u>call phpactor#UseAdd()<CR>
" コンテキストメニューの起動(カーソル下のクラスやメンバに対して実行可能な選択肢を表示してくれます)
au FileType php nmap <buffer> <silent><Leader>mm     :<C-u>call phpactor#ContextMenu()<CR>
" ナビゲーションメニューの起動(クラスの参照元を列挙したり、他ファイルへのジャンプなど)
au FileType php nmap <buffer> <silent><Leader>nn     :<C-u>call phpactor#Navigate()<CR>
" カーソル下のクラスやメンバの定義元にジャンプ
au FileType php nmap <buffer> <silent><Leader>o      :<C-u>call phpactor#GotoDefinition()<CR>
" 編集中のクラスに対し各種の変更を加える(コンストラクタ補完、インタフェース実装など)
au FileType php nmap <buffer> <silent><Leader>tt     :<C-u>call phpactor#Transform()<CR>
" 新しいクラスを生成する(編集中のファイルに)
au FileType php nmap <buffer> <silent><Leader>cc     :<C-u>call phpactor#ClassNew()<CR>
" 選択した範囲を変数に抽出する
au FileType php nmap <buffer> <silent><Leader>ee     :<C-u>call phpactor#ExtractExpression(v:false)<CR>
" 選択した範囲を変数に抽出する
au FileType php vmap <buffer> <silent><Leader>ee     :<C-u>call phpactor#ExtractExpression(v:true)<CR>
" 選択した範囲を新たなメソッドとして抽出する
au FileType php vmap <buffer> <silent><Leader>em     :<C-u>call phpactor#ExtractMethod()<CR>
" split → jump
au FileType php nmap <buffer> <silent><C-w><Leader>o :<C-u>call DefinitionJumpWithPhpactor()<CR>
" カーソル下のクラスや変数の情報を表示する
" 他のエディタで、マウスカーソルをおいたときに表示されるポップアップなどに相当
au FileType php vmap <buffer> <silent><Leader>hh     :<C-u>call phpactor#Hover()<CR><Paste>

" NERDTreeの表示切り替え
map <C-a> :NERDTreeToggle<CR>

" 次のタブを開く
nnoremap <silent><leader>t gt

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
nnoremap <silent><S-h> <Esc>vh
nnoremap <silent><S-l> <Esc>vl
vnoremap <silent><S-h> h
vnoremap <silent><S-l> l

" VisualでEnterはヤンク
vnoremap <silent><Enter> y

" space rでinit.vim読み込み :initeでinit.vimの編集
noremap <silent><leader>r <Esc>:source ~/.config/nvim/init.vim<CR>
cnoremap <silent>inite :tabe ~/.config/nvim/init.vim


" emmet
" ,,でemmet起動
imap ,, <C-y>,
let g:user_emmet_settings = {
\   'lang' : 'ja'
\ }

" Align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" coc
let g:node_host_prog = '/usr/local/bin/neovim-node-host'

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Language別

" Vue
autocmd FileType vue syntax sync fromstart

if executable('vls')
  augroup LspVls
    au!
  augroup end
endif



call map(dein#check_clean(), "delete(v:val, 'rf')")
