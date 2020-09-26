" MYVIMRC
"
" To use it, copy it to
"	       for Unix:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"	 for MS-Windows:  $VIM\_vimrc
"	      for Haiku:  ~/config/settings/vim/vimrc
"	    for OpenVMS:  sys$login:.vimrc
"
"
"1.Default setting
"personal setting
"base setting for display
set number
set relativenumber
set cursorline
set autoindent

"change keyboard for quickly 
noremap J 5j
noremap K 5k
noremap H 5h
noremap L 5l
xmap ga :EasyAlign =
noremap ga :EasyAlign =<CR>
inoremap [Caps] [Esc]
"basic mapping 
"  setting <LEADER> as <SPACE>
let mapleader=" "
noremap <LEADER>a :EasyAlign =<CR>
noremap <LEADER><LEADER> f(l
noremap  tt :tabNext<CR>
inoremap <LEADER>q <Esc>

"install vim plug

call plug#begin('~/.vim/plugged')
Plug 'https://github.com/vim-airline/vim-airline'
"plug 'https://github.com/godlygeek/tabular'
Plug 'junegunn/vim-easy-align'
call plug#end()



"
"     personal setting end
"
"
"
"  Dividing line
"   
 the coc confgi end
