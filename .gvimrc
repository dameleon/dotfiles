if has('gui_macvim')
    " タブを常に表示
    set showtabline=2	
    " ツールバー非表示
    set guioptions-=T	
    " アンチエイリアス
    set antialias		
    " KaoriYa Vim の自動 IM を禁止
    set imdisableactivate
    " IM に関する機能を全て disable
    " set imdisable
    " フォント
    set guifont=Osaka-Mono:h13
    " ウィンドウサイズ
    set lines=60 columns=150
    " ウィンドウの透明度
    set transparency=5
    " colorscheme (gui 側でも設定しておかないとバグるので)
    colorscheme molokai
endif
