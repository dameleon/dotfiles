"----------------------------------------------------
" 基本的な設定
"----------------------------------------------------
" viとの互換性をとらない(vimの独自拡張機能を使う為)
set nocompatible
" 基本的な設定
" 改行コードの自動認識
set fileformats=unix,dos,mac
" ビープ音を鳴らさない
set vb t_vb=
" バックスペースキーで削除できるものを指定
" indent  : 行頭の空白
" eol     : 改行
" start   : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
"クリップボードへコピー
set clipboard=unnamed
"カーソルを表示行で移動する。物理行移動は<C-n>,<C-p>
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk
"パス関連のフィックス
autocmd FileType html setlocal includeexpr=substitute(v:fname,'^\\/','','') | setlocal path+=;/
"カッコ補完
inoremap () ()<LEFT>
inoremap <> <><LEFT>
inoremap [] []<LEFT>
inoremap {} {}<LEFT>
inoremap "" ""<LEFT>
inoremap '' ''<LEFT>
"インサート中の移動
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

nnoremap x "_x

"----------------------------------------------------
" バックアップ関係
"----------------------------------------------------
"  ファイルの上書きの前にバックアップを作る
" (ただし、backup がオンでない限り、バックアップは上書きに成功した後削除される)
set writebackup
" バックアップをとる場合
set backup
" バックアップファイルを作るディレクトリ
set backupdir=~/Tmp/.vim/
" スワップファイルを作るディレクトリ
set directory=~/Tmp/.vim/
" viminfoの保存場所
set viminfo+=n~/Tmp/.vim/.viminfo

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

"----------------------------------------------------
" 表示関係()
"----------------------------------------------------
" color number
let &t_Co=256
" ColorScheme
colorscheme molokai
"colorscheme oceanblack256
" タイトルをウインドウ枠に表示する
set title
" 行番号を表示する
set number
" ルーラーを表示
"set ruler
" タブ文字を CTRL-I で表示し、行末に $ で表示する
"set list
" 入力中のコマンドをステータスに表示する
set showcmd
" ステータスラインを常に表示
set laststatus=2
" 括弧入力時の対応する括弧を表示
set showmatch
" 対応する括弧の表示時間を2にする
set matchtime=2
" 強調する括弧のパターン
set matchpairs=(:),{:},[:],<:>
" シンタックスハイライトを有効にする
syntax on
" 検索結果文字列のハイライトを有効にする
set hlsearch
" コマンドライン補完を拡張モードにする
set wildmenu
" 入力されているテキストの最大幅
" (行がそれより長くなると、この幅を超えないように空白の後で改行される)を無効にする
set textwidth=0
" ウィンドウの幅より長い行は折り返して、次の行に続けて表示する
set wrap
" ステータスラインに表示する情報の指定
set statusline=%n\:%y%F\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%m%r%=<%l/%L:%p%%>
"入力モード時、ステータスラインのカラーを変更
let g:hi_insert = 'highlight StatusLine guifg=white guibg=darkblue gui=none ctermfg=white ctermbg=darkblue cterm=none'

if has('unix') && !has('gui_running')
	inoremap <silent> <ESC> <ESC>
endif

if has('syntax')
	augroup InsertHook
		autocmd!
		autocmd InsertEnter * call s:StatusLine('Enter')
		autocmd InsertLeave * call s:StatusLine('Leave')
	augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
	if a:mode == 'Enter'
		silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
		silent exec g:hi_insert
	else
		highlight clear StatusLine
		silent exec s:slhlcmd
	endif
endfunction

function! s:GetHighlight(hi)
	redir => hl
	exec 'highlight '.a:hi
	redir END
	let hl = substitute(hl, '[\r\n]', '', 'g')
	let hl = substitute(hl, 'xxx', '', '')
	return hl
endfunction

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
" set expandtab
set noexpandtab
set nojoinspaces

"----------------------------------------------------
" エンコーディング関係 
"----------------------------------------------------
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,sjis,euc-jp
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

" EUC-JP
" nmap ,ee :e ++enc=euc-jp<CR>
" " SJIS
" nmap ,es :e ++enc=cp932<CR>
" " JIS
" nmap ,ej :e ++enc=iso-2022-jp<CR>
" " UTF-8
nmap ,eu :e ++enc=utf-8<CR>

"----------------------------------------------------
" オートコマンド
"----------------------------------------------------
if has("autocmd")
    " ファイルタイプ別インデント、プラグインを有効にする
    "filetype plugin indent on
    " カーソル位置を記憶する
    autocmd BufReadPost *
        \if line("'\"") > 0 && line("'\"") <= line("$") |
        \  exe "normal g`\"" |
        \endif
endif

"----------------------------------------------------
" その他
"----------------------------------------------------
" バッファを切替えてもundoの効力を失わない
set hidden
" 起動時のメッセージを表示しない
set shortmess+=I
" ゴミ削除
function! RTrim()
let s:cursor = getpos(".")
%s/\s\+$//e
call setpos(".", s:cursor)
endfunction
autocmd BufWritePre *.html,*.tx,*.css,*.scss,*.php,*.rb,*.js,*.bat,*.py,*.cs,*.pm call RTrim()


"----------------------------------------------------
" NeoVundle
"----------------------------------------------------
"Install script
"#from vim-scripts
"Bundle 'SCRIPT_NAME'
"#from Github
"Bundle 'USER_NAME/REPOSITORY_NAME'
"#from other git repos
"Bundle 'git:://REPOSITORY_URL'

filetype off
filetype plugin indent off

if has('vim_starting')
	set runtimepath+=~/.vim/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'Shougo/neosnippet.git'
NeoBundle 'tpope/vim-surround.git'
NeoBundle 'thinca/vim-quickrun.git'
NeoBundle 'othree/html5.vim.git'
NeoBundle 'xhtml.vim'
NeoBundle 'hail2u/vim-css3-syntax.git'
NeoBundle 'tpope/vim-haml'
NeoBundle 'mattn/zencoding-vim', 'emmet'
NeoBundle 'motemen/xslate-vim.git'
NeoBundle 'tpope/vim-fugitive.git'
NeoBundle 'gregsexton/gitv.git'
NeoBundle 'yuratomo/w3m.vim.git'
NeoBundle 'git://gist.github.com/411828.git'
NeoBundle 'scrooloose/nerdcommenter.git'
NeoBundle 'ack.vim'
NeoBundle 'h1mesuke/vim-alignta.git'
NeoBundle 'netrw.vim'
NeoBundle 'colorsel.vim'
NeoBundle 'tpope/vim-markdown.git'
NeoBundle 'thinca/vim-qfreplace.git'
NeoBundle 'teramako/jscomplete-vim'
NeoBundle 'nono/vim-handlebars'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'thinca/vim-localrc'
NeoBundle 'mattn/gist-vim'
NeoBundle 'myhere/vim-nodejs-complete.git'
NeoBundle 'sudo.vim'
NeoBundle 'rking/ag.vim.git'

filetype plugin indent on

"----------------------------------------------------
" unite
"----------------------------------------------------
"バッファ一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file bookmark<CR>
"レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
"最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
"常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru bookmark<CR>
"全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

"ウインドウを横に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
"ウインドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('split')
"ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>


"----------------------------------------------------
"vim zen-coding
"----------------------------------------------------
"let g:user_zen_settings = { 'indentation': "" }
let g:user_zen_leader_key = '<c-t>'
"----------------------------------------------------
" neocomplcache 
"----------------------------------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \'default' : $HOME.'/Tmp',
    \'vimshell' : $HOME.'/Tmp/.vimshell_hist',
    \'scheme' : $HOME.'/Tmp/.gosh_completions'
    \}

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'


" Plugin key-mappings.
imap <C-s>     <Plug>(neocomplcache_snippets_expand)
smap <C-s>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()
noremap es :<C-u>NeoComplCacheEditSnippets<CR>

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

autocmd FileType css,scss,sass,html,xslate,markdown.javascript setlocal iskeyword& iskeyword+=-

autocmd FileType javascript
  \ :setl omnifunc=jscomplete#CompleteJS

set guifont=Osaka_Mono_for_Powerline
let g:Powerline_symbols = 'fancy'
let g:jscomplete_use = ['dom', 'moz', 'xpcom', 'es6th']

autocmd BufRead *.php\|*.ctp\|*.tpl :set dictionary=~/.vim/dictionaries/php.dict filetype=php


" VimRef
let g:ref_phpmanual_path = $HOME . '/.vim/refs/php-chunked-xhtml'


autocmd FileType php set tags=$HOME/.vim/tags/codeigniter.tags,$HOME/.vim/tags/masami.tags

au FileType yaml set expandtab ts=2 sw=2 enc=utf-8 fenc=utf-8
