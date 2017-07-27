augroup filetypedetect
  au BufRead,BufNewFile *.rb setfiletype ruby
  au BufRead,BufNewFile *.make setfiletype make
  au BufRead,BufNewFile *.c setfiletype c
  au BufRead,BufNewFile *.cpp setfiletype cpp
augroup END
