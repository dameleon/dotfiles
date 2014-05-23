augroup filetypedetect
	au BufRead,BufNewFile, *.mt setfiletype html
	au BufRead,BufNewFile, *.cs setfiletype cs
    au BufRead,BufNewFile, *.ctp setfiletype php
	au BufRead,BufNewFile, *.sub setfiletype html
	au BufRead,BufNewFile, *.ts setfiletype javascript
	au BufRead,BufNewFile, *.tpl setfiletype html
	au BufRead,BufNewFile, *.ect setfiletype html
augroup END
