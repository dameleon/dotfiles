if has('gui_macvim')
    " タブを常に表示
    set showtabline=2	
    " ツールバー非表示
    set guioptions-=T	
    " アンチエイリアス
    set antialias		
    " フォント
    set guifont=Osaka-Mono:h16
    " ウィンドウサイズ
    set lines=60 columns=150
    " ウィンドウの透明度
    set transparency=5
    " colorscheme (gui 側でも設定しておかないとバグるので)
    colorscheme molokai
endif
