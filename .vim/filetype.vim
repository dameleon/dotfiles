augroup filetypedetect
	au BufRead,BufNewFile, *.mt setfiletype html
	au BufRead,BufNewFile, *.cs setfiletype cs
    au BufRead,BufNewFile, *.ctp setfiletype php
augroup END

augroup filetypedetect
	au BufRead,BufNewFile, *.sub setfiletype html
augroup END
