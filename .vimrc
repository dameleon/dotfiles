"----------------------------------------------------
" Plugin & NeoVundle
"----------------------------------------------------

" matchit を読み込む
:source $VIMRUNTIME/macros/matchit.vim

" ## usage
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
	set runtimepath+=~/.vim/neobundle.vim/,$GOROOT.'/misc/vim',$GOROOT.'/misc/vim/after'
endif
call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/vimproc', {
    \ 'build' : {
    \     'windows' : 'make -f make_mingw32.mak',
    \     'cygwin' : 'make -f make_cygwin.mak',
    \     'mac' : 'make -f make_mac.mak',
    \     'unix' : 'make -f make_unix.mak',
    \    },
    \ }
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'Shougo/neosnippet.git'
NeoBundle 'Shougo/neosnippet-snippets.git'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'tpope/vim-surround.git'
NeoBundle 'thinca/vim-quickrun.git'
NeoBundle 'othree/html5.vim.git'
NeoBundle 'xhtml.vim'
NeoBundle 'hail2u/vim-css3-syntax.git'
NeoBundle 'tpope/vim-haml'
NeoBundle 'motemen/xslate-vim.git'
NeoBundle 'tpope/vim-fugitive.git'
NeoBundle 'gregsexton/gitv.git'
NeoBundle 'git://gist.github.com/411828.git'
NeoBundle 'scrooloose/nerdcommenter.git'
NeoBundle 'ack.vim'
NeoBundle 'h1mesuke/vim-alignta.git'
NeoBundle 'netrw.vim'
NeoBundle 'colorsel.vim'
NeoBundle 'tpope/vim-markdown.git'
NeoBundle 'thinca/vim-qfreplace.git'
NeoBundle 'nono/vim-handlebars'
NeoBundle 'thinca/vim-localrc'
NeoBundle 'mattn/gist-vim'
NeoBundle 'sudo.vim'
NeoBundle 'rking/ag.vim.git'
NeoBundle 'itchyny/lightline.vim.git'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'tomasr/molokai'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'Blackrush/vim-gocode'
NeoBundle 'marijnh/tern_for_vim', {
    \  'build' : 'npm install'    
    \ }
NeoBundle 'kana/vim-submode'
NeoBundle 'mattn/emmet-vim.git'
NeoBundle 'ingydotnet/yaml-vim'

filetype plugin indent on



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
" indent : 行頭の空白
" eol    : 改行
" start  : 挿入モード開始位置より手前の文字
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



"----------------------------------------------------
" バックアップ関係
"----------------------------------------------------
"  ファイルの上書きの前にバックアップを作る
" (ただし、backup がオンでない限り、バックアップは上書きに成功した後削除される)
set writebackup
" バックアップをとる場合
set backup
" バックアップファイルを作るディレクトリ
set backupdir=/tmp/.vim/
" スワップファイルを作るディレクトリ
set directory=/tmp/.vim/
" viminfoの保存場所
set viminfo+=n/tmp/.viminfo
" undo file の保存先を指定
set undodir=/tmp/.vim/



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
" " SJIS
nmap ,es :e ++enc=cp932<CR>
" " JIS
nmap ,ej :e ++enc=iso-2022-jp<CR>
" " UTF-8
nmap ,eu :e ++enc=utf-8<CR>



"----------------------------------------------------
" オートコマンド
"----------------------------------------------------

" ファイルタイプ別インデント、プラグインを有効にする
"filetype plugin indent on
" カーソル位置を記憶する
autocmd BufReadPost *
    \if line("'\"") > 0 && line("'\"") <= line("$") |
    \  exe "normal g`\"" |
    \endif



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
autocmd BufWritePre *.html,*.tx,*.css,*.scss,*.rb,*.js,*.bat,*.py,*.cs call RTrim()



"----------------------------------------------------
" unite.vim
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
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
inoremap <expr><CR> pumvisible() ? neocomplcache#smart_close_popup() : "\<CR>"
inoremap <expr><BS> pumvisible() ? neocomplcache#cancel_popup() . "<BS>" : "\<BS>"
inoremap <expr><C-y> pumvisible() ? neocomplcache#smart_close_popup() : "\<C-y>"
inoremap <expr><C-n> pumvisible() ? neocomplcache#close_popup() : "\<C-n>"
inoremap <expr><C-h> pumvisible() ? neocomplcache#cancel_popup() : "\<C-h>"
inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr><C-h> pumvisible() ? neocomplcache#smart_close_popup() . "\<C-i>" : "\<C-h>"
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType typescript setlocal omnifunc=TSScompleteFunc
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns') 
    let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplete#sources#omni#input_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.go = '\h\w*\.\?'
let g:neocomplete#sources#omni#input_patterns.typescript = '[^. \t]\.\%(\h\w*\)\?' 

" FIXME
" if !exists('g:neocomplcache_omni_patterns')
"   let g:neocomplcache_omni_patterns = {}
" endif
" let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
" let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
" let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
" let g:neocomplcache_omni_patterns.go = '\h\w*\.\?'
" let g:neocomplcache_omni_patterns.typescript = '[^. \t]\.\%(\h\w*\)\?' 


" FIXME 
" autocmd FileType css,scss,sass,html,xslate,markdown,javascript,typescript setlocal iskeyword& iskeyword+=-



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
nnoremap <silent>g<C-p> :<C-u>CtrlPYankRound<CR>



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
