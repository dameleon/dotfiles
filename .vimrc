"----------------------------------------------------
" Plugin & dein.vim
"----------------------------------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/dameleon/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/Users/dameleon/.cache/dein')

" Let dein manage dein
" Required:
call dein#add('/Users/dameleon/.cache/dein/repos/github.com/Shougo/dein.vim')

" 機能系
call dein#add('Shougo/ddc.vim')
call dein#add('vim-denops/denops.vim')
let g:denops_disable_version_check = 1
call dein#add('LeafCage/yankround.vim')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('flazz/vim-colorschemes')
call dein#add('haya14busa/incsearch.vim')
call dein#add('itchyny/lightline.vim')
call dein#add('junegunn/vim-easy-align')
call dein#add('kana/vim-submode')
call dein#add('mileszs/ack.vim')
call dein#add('vim-scripts/netrw.vim')
call dein#add('osyo-manga/vim-over')
call dein#add('scrooloose/nerdcommenter')
call dein#add('scrooloose/syntastic')
call dein#add('vim-scripts/sudo.vim')
call dein#add('thinca/vim-localrc')
call dein#add('thinca/vim-quickrun')
call dein#add('tpope/vim-dispatch')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-surround')
call dein#add('nixprime/cpsm')
" filetype共通
call dein#add('sheerun/vim-polyglot')
call dein#add('hail2u/vim-css3-syntax')
call dein#add('mattn/emmet-vim')
call dein#add('vim-scripts/rest.vim')
" filetype別

call dein#end()
call dein#save_state()

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif


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
" ctrlp.vim
"----------------------------------------------------

let g:ctrlp_map = '<C-g>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_files=0
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_prompt_mappings = {
  \ 'PrtExit()': ['<esc>', '<c-c>'],
  \ }
let g:ctrlp_extensions = ['mixed', 'file', 'dir', 'quickfix']
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:18'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|meta|asset)$',
  \ }
let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
let g:ctrlp_user_command = 'files -a %s'

"----------------------------------------------------
" yankround.vim
"----------------------------------------------------

" キーマップ
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
" 履歴取得数
let g:yankround_max_history = 20
" 履歴一覧 (with kien/ctrlp.vim)
nnoremap <silent>g<C-p> :<C-u>CtrlPYankRound<CR>


"----------------------------------------------------
" incsearch.vim
"----------------------------------------------------

let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
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
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" disable auto close
let g:neocomplete#enable_auto_close_preview = 0

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
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
inoremap <expr><BS> pumvisible() ? neocomplete#cancel_popup() . "<BS>" : "\<BS>"
inoremap <expr><C-h> pumvisible() ? neocomplete#smart_close_popup() . "\<C-i>" : "\<C-h>"
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=tern#Complete
autocmd FileType typescript setlocal omnifunc=TSScompleteFunc
autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns') 
    let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.go = '[^.[:digit:] *\t]\.\w*'
let g:neocomplete#sources#omni#input_patterns.typescript = '[^. \t]\.\%(\h\w*\)\?' 
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.cs = '.*[^=\);]'

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'

" others
let g:neocomplete#sources#rsense#home_directory = '/usr/local/bin/rsense'


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
let g:syntastic_mode_map = { 'mode': 'passive',
    \ 'active_filetypes': ['go'] }
let g:syntastic_go_checkers = ['go', 'golint']

"----------------------------------------------------
" OmniSharp
"----------------------------------------------------

let g:OmniSharp_selector_ui = 'ctrlp'
let g:syntastic_cs_checkers = ['syntax']
augroup omnisharp_commands
    autocmd!
    " automatic syntax check on events
    autocmd BufEnter,BufWrite *.cs SyntasticCheck
    " show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithDocumentation()
    autocmd FileType cs nnoremap <leader>gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <leader>fm :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType
    autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<CR>
    " finds members in the current buffer
    autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<CR>
    " cursor can be anywhere on the line containing an issue
    autocmd FileType cs nnoremap <leader>fi :OmniSharpFixIssue<CR>
    autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <leader>tl :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<CR>
    " navigate up/down by method/property/field
    autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<CR>
    autocmd FileType cs nnoremap <leader><space> :OmniSharpGetCodeActions<CR>
    autocmd FileType cs vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<CR>
    autocmd FileType cs nnoremap <leader>rn :OmniSharpRename<CR>
    autocmd FileType cs nnoremap <leader>rs :OmniSharpReloadSolution<CR>
    autocmd FileType cs nnoremap <leader>cf :OmniSharpCodeFormat<CR>
augroup END


"----------------------------------------------------
" neosnippe
"----------------------------------------------------

imap <expr><C-l>
    \ neosnippet#expandable() <Bar><Bar> neosnippet#jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)" : "\<C-n>"
let g:neosnippet#snippets_directory = '~/.vim/neosnippet-snippet/'


"----------------------------------------------------
" rsense
"----------------------------------------------------

let g:rsenseUseOmniFunc = 1

" FIXME: brew経由のpythonを使えるようにとりあえず…
if has('gui_macvim')
    set pythondll=/usr/local/opt/python/Frameworks/Python.framework/Versions/2.7/lib/libpython2.7.dylib
endif


"----------------------------------------------------
" vim easy align
"----------------------------------------------------

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
