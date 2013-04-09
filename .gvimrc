if has('gui_macvim')
    set nocompatible
    set whichwrap=b,s,h,l,<,>,[,]
	set showtabline=2	" タブを常に表示
	set guioptions-=T	" ツールバー非表示
	set antialias		" アンチエイリアス
	set number		" 行番号表示

	"colorscheme oceanblack
	colorscheme molokai

    set noimdisableactivate

	let g:hi_insert = 'highlight StatusLine guifg=white guibg=#860049 gui=none'


	" フォント設定
	set guifontwide=Osaka:h12
	set guifont=Osaka-Mono:h13

	" ウィンドウ設定
	set lines=60 columns=150
	map <silent> gw :macaction selectNextWindow:
	map <silent> gW :macaction selectPreviousWindow:
    set transparency=5
endif
