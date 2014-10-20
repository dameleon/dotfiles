"----------------------------------------------------
" ファイルタイプの判定
"----------------------------------------------------

augroup filetypedetect
    au BufRead,BufNewFile, *.ctp setfiletype php
	au BufRead,BufNewFile, *.mt setfiletype html
	au BufRead,BufNewFile, *.sub setfiletype html
	au BufRead,BufNewFile, *.tpl setfiletype html
	au BufRead,BufNewFile, *.ect setfiletype html
	au BufRead,BufNewFile, *.sketchplugin setfiletype objc
	au BufRead,BufNewFile, *.jstalk setfiletype objc
	au BufRead,BufNewFile, *.ts setfiletype typescript
augroup END

