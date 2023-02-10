" =============================================================================
" =============================================================================
"__     _____ __  __ ____   ____ 
"\ \   / /_ _|  \/  |  _ \ / ___|
" \ \ / / | || |\/| | |_) | |    
"  \ V /  | || |  | |  _ <| |___ 
"   \_/  |___|_|  |_|_| \_\\____|
"============================================================================= 
"=============================================================================
"# 1.the config for first time
" 	1.1 install plug.vim if not 
"
"=============================================================================
"# 2.Default setting 
" 	2.1 vim options
set number
set relativenumber
set cursorline
set autoindent
" 	2.2 addtional setting
	" remenber couser when exit
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
 augroup END  

"=============================================================================
"# 3 Map keys
" 	3.1 noremap
"change keyboard for quickly 
noremap J 5j
noremap K 5k
noremap H 5h
noremap L 5l
noremap Q :q!<CR>
noremap S :wq<CR>
xmap ga :EasyAlign =
noremap ga :EasyAlign =<CR>
" 	3.2 inoremap 
inoremap jk <Esc>
inoremap [Caps] [Esc]
" 	3.3 leader map
"  setting <LEADER> as <SPACE>
let mapleader=" "
noremap <LEADER>a :EasyAlign =<CR>
noremap <LEADER><LEADER> f(l
noremap  tt :tabNext<CR>
"
"=============================================================================

"#5 Plug-vim
" 	5.1 PlugInstall  
" 		vim-airline  
" 		vim-easy-align  
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'junegunn/vim-easy-align'
call plug#end()
" 	5.2 Plug-config

