call plug#begin('~/.vim/plugged')

" Plugin
Plug 'Shougo/unite.vim'
Plug 'ujihisa/unite-colorscheme'

" Colors
Plug 'altercation/vim-colors-solarized',	{'dir': '~/.vim/colors/vim-colors-solarized'}
Plug 'croaker/mustang-vim',	{'dir': '~/.vim/colors/mustang-vim'}
Plug 'jeffreyiacono/vim-colors-wombat',	{'dir': '~/.vim/colors/vim-colors-wombat'}
Plug 'nanotech/jellybeans.vim',	{'dir': '~/.vim/colors/jellybeans.vim'}
Plug 'vim-scripts/Lucius',	{'dir': '~/.vim/colors/Lucius'}
Plug 'vim-scripts/Zenburn',	{'dir': '~/.vim/colors/Zenburn'}
Plug 'mrkn/mrkn256.vim',	{'dir': '~/.vim/colors/mrkn256.vim'}
Plug 'jpo/vim-railscasts-theme',	{'dir': '~/.vim/colors/vim-railscasts-theme'} 
Plug 'therubymug/vim-pyte',	{'dir': '~/.vim/colors/vim-pyte'}
Plug 'tomasr/molokai',	{'dir': '~/.vim/colors/molokai'}
Plug 'chriskempson/vim-tomorrow-theme',	{'dir': '~/.vim/colors/vim-tomorrow-theme'}
Plug 'vim-scripts/twilight',	{'dir': '~/.vim/colors/twilight'}
Plug 'w0ng/vim-hybrid',	{'dir': '~/.vim/colors/vim-hybrid'}
Plug 'freeo/vim-kalisi',	{'dir': '~/.vim/colors/vim-kalisi'}
Plug 'morhetz/gruvbox',	{'dir': '~/.vim/colors/gruvbox'}
Plug 'toupeira/vim-desertink',	{'dir': '~/.vim/colors/vim-desertink'}
Plug 'sjl/badwolf',		{'dir': '~/.vim/colors/badwolf'}
Plug 'itchyny/landscape.vim',	{'dir': '~/.vim/colors/landscape.vim'}
Plug 'joshdick/onedark.vim',	{'dir': '~/.vim/colors/onedark.vim'}
Plug 'gosukiwi/vim-atom-dark',	{'dir': '~/.vim/colors/vim-atom-dark'}

call plug#end()

set background=dark
colorscheme hybrid
syntax on

map <C-g> :Gtags 
map <C-h> :Gtags -f %<CR>
map <C-j> :GtagsCursor<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>
