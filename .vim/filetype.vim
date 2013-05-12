augroup filetypedetect
	au BufRead,BufNewFile, *.mt setfiletype html
	au BufRead,BufNewFile, *.cs setfiletype cs
    au BufRead,BufNewFile, *.ctp setfiletype php
	au BufRead,BufNewFile, *.sub setfiletype html
	au BufNewFile,BufRead *.ts setfiletype typescript
	au BufNewFile,BufRead *.tpl setfiletype html
augroup END
