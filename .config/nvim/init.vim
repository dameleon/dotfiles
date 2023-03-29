"----------------------------------------------------
" Plugins
"----------------------------------------------------
packadd vim-jetpack
call jetpack#begin()
call jetpack#add('tani/vim-jetpack', {'opt': 1}) "bootstrap
call jetpack#add('github/copilot.vim')
call jetpack#add('itchyny/lightline.vim')
call jetpack#add('prabirshrestha/vim-lsp')
call jetpack#add('mattn/vim-lsp-settings')
call jetpack#add('prabirshrestha/asyncomplete.vim')
call jetpack#add('prabirshrestha/asyncomplete-lsp.vim')
call jetpack#end()


"----------------------------------------------------
" basics
"----------------------------------------------------

" viとの互換性をとらない(vimの独自拡張機能を使う為)
set nocompatible
" 新しいウィンドウを下に開く
set splitbelow
" 改行コードの自動認識
set fileformats=unix,dos,mac
" ビープ音を鳴らさない
set vb t_vb=
" バックスペースキーで削除できるものを指定
set backspace=indent,eol,start
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" クリップボードへコピー
set clipboard+=unnamedplus
" CursorHoldの時間を設定
set updatetime=200
" cmd領域の高さ設定
set cmdheight=2
" カーソルを表示行で移動する。物理行移動は<C-n>,<C-p>
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk
" 他操作系
nnoremap <C-h> ^
nnoremap <C-T> $
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>
nnoremap <silent>bb :b#<CR>
" 括弧入力時の移譲補助
inoremap () ()<LEFT>
inoremap <> <><LEFT>
inoremap [] []<LEFT>
inoremap {} {}<LEFT>
inoremap "" ""<LEFT>
inoremap '' ''<LEFT>
" shift-tabでtabを戻す
nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>

"----------------------------------------------------
" vim file関連
"----------------------------------------------------
" ファイルの上書きの前にバックアップを作る (ただし、backup がオンでない限り、バックアップは上書きに成功した後削除される)
set writebackup
" バックアップをとる
set backup
" バックアップファイルを作るディレクトリ
set backupdir=/tmp/
" スワップファイルを作るディレクトリ
set directory=/tmp/
" undo file の保存先を指定
set undodir=/tmp/


"----------------------------------------------------
" 検索関係
"----------------------------------------------------

" コマンド、検索パターンを100個まで履歴に残す
set history=100
" 検索の時に大文字小文字を区別しない
set ignorecase
" 検索の時に大文字が含まれている場合は区別して検索する
set smartcase
" 最後まで検索したら先頭に戻る
set wrapscan
" インクリメンタルサーチを使わない
set noincsearch
" 検索にはplatinum searcherを使う
if executable('pt')
    set grepprg=pt\ --nogroup\ --nocolor
elseif executable('ack')
    set grepprg=ack\ -a
endif
" 検索結果文字列のハイライトを有効にする
set hlsearch


"----------------------------------------------------
" 表示関係
"----------------------------------------------------

" シンタックスハイライトを有効にする
syntax on
" color number
let &t_Co=256
" ColorScheme
colorscheme molokai
" タイトルをウインドウ枠に表示する
set title
" 行番号を表示する
set number
" 入力中のコマンドをステータスに表示する
set showcmd
" ステータスラインを常に表示
set laststatus=2
" 括弧入力時の対応する括弧を表示
set showmatch
" 対応する括弧の表示時間を2にする
set matchtime=3
" 強調する括弧のパターン
set matchpairs=(:),{:},[:],<:>
" コマンドライン補完を拡張モードにする
set wildmenu
" 入力されているテキストの最大幅 (行がそれより長くなると、この幅を超えないように空白の後で改行される)を無効にする
set textwidth=0
" ウィンドウの幅より長い行は折り返して、次の行に続けて表示する
set wrap
" ステータスラインに表示する情報の指定
set statusline=%n\:%y%F\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%m%r%=<%l/%L:%p%%>
" 補完表示の設定
set completeopt=longest,menuone

"----------------------------------------------------
" インデント
"----------------------------------------------------

" 自動インデントを有効にする
set smartindent
set autoindent
" タブが対応する空白の数
set tabstop=4
" タブやバックスペースの使用等の編集操作をするときに、タブが対応する空白の数
set softtabstop=4
" インデントの各段階に使われる空白の数
set shiftwidth=4
" タブを挿入するとき、代わりに空白を使わない
set expandtab
set nojoinspaces


"----------------------------------------------------
" エンコーディング関係 
"----------------------------------------------------

set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,sjis,euc-jp
" EUC-JP
nmap <leader>ee :e ++enc=euc-jp<CR>
" SJIS
nmap <leader>es :e ++enc=cp932<CR>
" JIS
nmap <leader>ej :e ++enc=iso-2022-jp<CR>
" UTF-8
nmap <leader>eu :e ++enc=utf-8<CR>


"----------------------------------------------------
" その他
"----------------------------------------------------

" バッファを切替えてもundoの効力を失わない
set hidden


"----------------------------------------------------
" lightline 
"----------------------------------------------------

let g:lightline = {
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'fugitive', 'filename' ] ]
    \ },
    \ 'component_function': {
    \   'fugitive': 'MyFugitive',
    \   'readonly': 'MyReadonly',
    \   'modified': 'MyModified',
    \   'filename': 'MyFilename'
    \ },
    \ 'separator': { 'left': '⮀', 'right': '⮂' },
    \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
	\ }

function! MyModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! MyReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "⭤"
  else
    return ""
  endif
endfunction

function! MyFugitive()
  return exists('*fugitive#head') && strlen(fugitive#head()) ? '⭠ '.fugitive#head() : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
       \ ('' != expand('%t') ? expand('%t') : '[No Name]') .
       \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

