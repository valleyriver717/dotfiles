if has('vim_starting')
  if &compatible
    set nocompatible
  endif
  set runtimepath+=~/.vim/
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))
  NeoBundleFetch 'Shougo/neobundle.vim'
  NeoBundle 'vim-scripts/gtags.vim'
  NeoBundle 'Shougo/unite.vim'
  NeoBundle 'altercation/vim-colors-solarized'
  NeoBundle 'Shougo/neocomplete.vim'
  NeoBundle 'Shougo/vimproc.vim', {
              \ 'build' : {
              \ 'windows' : 'make -f make_mingw32.mak',
              \ 'cygwin' : 'make -f make_cygwin.mak',
              \ 'mac' : 'make -f make_mac.mak',
              \ 'unix' : 'make -f make_unix.mak',
              \ },
              \ }
  NeoBundle 'justmao945/vim-clang'
  NeoBundle 'Shougo/neoinclude.vim'
call neobundle#end()

NeoBundleCheck

runtime! /autoload/basic.vim
runtime! /autoload/gtags.vim
runtime! /autoload/vimclang.vim
