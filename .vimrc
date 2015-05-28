"----------------------------------------------------
" Plugin & NeoBundle
"----------------------------------------------------

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))

"""" NeoBundle import plugin list
NeoBundleFetch 'Shougo/neobundle.vim'

" 機能系
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'Shougo/neocomplete.git'
NeoBundle 'Shougo/neosnippet-snippets.git'
NeoBundle 'Shougo/neosnippet.git'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'h1mesuke/vim-alignta.git'
NeoBundle 'itchyny/lightline.vim.git'
NeoBundle 'kana/vim-submode'
NeoBundle 'mattn/gist-vim'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'netrw.vim'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'scrooloose/nerdcommenter.git'
NeoBundle 'sudo.vim'
NeoBundle 'thinca/vim-localrc'
NeoBundle 'thinca/vim-qfreplace.git'
NeoBundle 'thinca/vim-quickrun.git'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround.git'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'haya14busa/incsearch.vim'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'rizzatti/dash.vim'

" 個別filetype
NeoBundle 'othree/html5.vim.git'
NeoBundle 'JulesWang/css.vim'
NeoBundle 'hail2u/vim-css3-syntax.git'
NeoBundleLazy 'marijnh/tern_for_vim', {
    \  'build' : 'npm install -g && npm install'    
    \ }
NeoBundle 'mattn/emmet-vim.git'
NeoBundle 'ingydotnet/yaml-vim'
NeoBundle 'Valloric/MatchTagAlways'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'Blackrush/vim-gocode'
NeoBundle 'fatih/vim-go'
NeoBundle 'tikhomirov/vim-glsl'
NeoBundle 'c9s/perlomni.vim'
NeoBundleLazy 'OmniSharp/omnisharp-vim', {
\   'autoload': { 'filetypes': [ 'cs', 'csi', 'csx' ] },
\   'build': {
\     'windows' : 'msbuild server/OmniSharp.sln',
\     'mac': 'xbuild server/OmniSharp.sln',
\     'unix': 'xbuild server/OmniSharp.sln',
\   },
\ }
NeoBundleLazy 'OrangeT/vim-csharp', { 'autoload': { 'filetypes': [ 'cs', 'csi', 'csx' ] } }
NeoBundle 'scrooloose/syntastic'

"""" end of plugin list

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

" matchit を読み込む
:source $VIMRUNTIME/macros/matchit.vim


"----------------------------------------------------
" 基本的な設定
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
set clipboard+=unnamed,autoselect
" カーソルを表示行で移動する。物理行移動は<C-n>,<C-p>
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk


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
" viminfoの保存場所
set viminfo+=n/tmp/.viminfo
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
" 検索にはAckを使う
set grepprg=ack\ -a
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
set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,sjis,euc-jp
" EUC-JP
nmap ,ee :e ++enc=euc-jp<CR>
" SJIS
nmap ,es :e ++enc=cp932<CR>
" JIS
nmap ,ej :e ++enc=iso-2022-jp<CR>
" UTF-8
nmap ,eu :e ++enc=utf-8<CR>


"----------------------------------------------------
" その他
"----------------------------------------------------

" バッファを切替えてもundoの効力を失わない
set hidden
" 起動時のメッセージを表示しない
set shortmess+=I
" JSON整形
nnoremap <silent> ,js :%!python -m json.tool<CR>
" 空白除去
function! RTrim()
    let s:cursor = getpos(".")
    %s/\s\+$//e
    call setpos(".", s:cursor)
endfunction
autocmd BufWritePre *.a,*.cpp,*.sh,*.html,*.tx,*.css,*.scss,*.rb,*.js,*.bat,*.py,*.cs,*.ts,*.pl,*.pm call RTrim()


"----------------------------------------------------
" yankround.vim
"----------------------------------------------------

" キーマップ
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
" 履歴取得数
let g:yankround_max_history = 50
" 履歴一覧 (with kien/ctrlp.vim)
" nnoremap <silent>g<C-p> :<C-u>CtrlPYankRound<CR>


"----------------------------------------------------
" incsearch.vim
"----------------------------------------------------

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)


"----------------------------------------------------
" neocomplete
"----------------------------------------------------

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" camle caseを有効化。大文字を区切りとしたワイルドカードのように振る舞う
let g:neocomplete#enable_camel_case_completion = 1
" _(アンダーバー)区切りの補完を有効化
let g:neocomplete#enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \'default' : '',
    \'vimshell' : $HOME.'.vimshell_hist',
    \'scheme' : $HOME.'.gosh_completions'
    \}

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
inoremap <expr><CR> pumvisible() ? neocomplete#smart_close_popup() : "\<CR>"
inoremap <expr><BS> pumvisible() ? neocomplete#cancel_popup() . "<BS>" : "\<BS>"
inoremap <expr><C-y> pumvisible() ? neocomplete#smart_close_popup() : "\<C-y>"
inoremap <expr><C-n> pumvisible() ? neocomplete#close_popup() : "\<C-n>"
inoremap <expr><C-h> pumvisible() ? neocomplete#cancel_popup() : "\<C-h>"
inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr><C-h> pumvisible() ? neocomplete#smart_close_popup() . "\<C-i>" : "\<C-h>"
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType typescript setlocal omnifunc=TSScompleteFunc
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns') 
    let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.go = '[^.[:digit:] *\t]\.\w*'
let g:neocomplete#sources#omni#input_patterns.typescript = '[^. \t]\.\%(\h\w*\)\?' 
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.cs = '.*[^=\);]'

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


"----------------------------------------------------
" vim-over
"----------------------------------------------------

" \m で OverCommandLine を機動
nnoremap <silent> <Leader>m :OverCommandLine<CR>
" カーソル下の単語をハイライト付きで置換
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>
" コピーした文字列をハイライト付きで置換
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>


"----------------------------------------------------
" vim-submode 
"----------------------------------------------------
" REF: http://haya14busa.com/improve-x-with-vim-submode/

function! s:join_undo()
    undojoin
    normal! "_x
endfunction
nnoremap <silent> <Plug>(join_undo-x) :<C-u>call <SID>join_undo()<CR>
call submode#enter_with('join_undo', 'n', '', 'x', '"_x')
call submode#map('join_undo', 'n', 'r', 'x', '<Plug>(join_undo-x)')


"----------------------------------------------------
" emmet-vim
"----------------------------------------------------

let g:user_emmet_mode='in'
let g:user_emmet_leader_key='<C-T>'


"----------------------------------------------------
" syntastic
"----------------------------------------------------

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


"----------------------------------------------------
" OmniSharp
"----------------------------------------------------
let g:OmniSharp_selector_ui = 'ctrlp'