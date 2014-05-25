"----------------------------------------------------
" ファイルタイプの判定
"----------------------------------------------------

augroup filetypedetect
    au BufRead,BufNewFile, *.ctp setfiletype php
	au BufRead,BufNewFile, *.mt setfiletype html
	au BufRead,BufNewFile, *.sub setfiletype html
	au BufRead,BufNewFile, *.tpl setfiletype html
	au BufRead,BufNewFile, *.ect setfiletype html
augroup END

