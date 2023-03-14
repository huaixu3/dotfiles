"=============================================================================
" Inspire https://github.com/amix/vimrc
"
"sections:
"   -> General
"   -> VIM user interface
"   -> Color and Fonts
"   -> Fils and backups
"   -> Moving around ,tabs and buffers
"   -> status line
"
"   -> Editing mappings
"   ->vimgrep searching and cope displaying
"   -> spell checking 
"   -> misc
"=============================================================================
" 0.the config for first time
" 	1.1 install plug.vim if not 
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"
"=============================================================================
"# 1. General
"=============================================================================
" 	2.1 vim options
" 	display number
set number
" Sets how many lines of history VIM has to remember
set history=500
" Enable filetype plugins
filetype plugin on
filetype indent on
"set cursor under line
set cursorline

set ts=4 "tabspace
set sw=4 "shiftword
set expandtab
set smarttab

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = " "

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!
"=============================================================================
"# 2 VIM user interface
"=============================================================================
 " Set 7 lines to the cursor - when moving vertically using j/k
 set so=7
" Always show current position
set ruler
" Height of the command bar
set cmdheight=1

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase
" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch
" Add a bit extra margin to the left
set foldcolumn=1

set showmatch
"=============================================================================
"# 3 Color and Fonts

 " Enable syntax highlighting
syntax enable
 try
    colorscheme desert
catch
endtry

set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac
"=============================================================================
"# 4 Files backups and undo
"=============================================================================
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile
"=============================================================================
"# 5 Moving around,tabs,windows and buffers
"=============================================================================
"map Ctrl+f for search
noremap <C-f> /
inoremap <C-f> <Esc>/
noremap Q :wq<cr>

" Disable highlight when <leader><cr> is pressed
map <silent> <C-f><cr> :noh<cr>

" Smart way to move between windows
map <M-j> <C-W>j
map <M-k> <C-W>k
map <M-h> <C-W>h
map <M-l> <C-W>l
" adjust for mac
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"use alt + number to move tabn"
noremap <silent><M-1> :tabn 1<cr>
noremap <silent><M-2> :tabn 2<cr>
noremap <silent><M-3> :tabn 3<cr>
noremap <silent><M-4> :tabn 4<cr>
noremap <silent><M-5> :tabn 5<cr>
noremap <silent><M-6> :tabn 6<cr>
noremap <silent><M-7> :tabn 7<cr>
noremap <silent><M-8> :tabn 8<cr>
noremap <silent><M-9> :tabn 9<cr>
noremap <silent><M-0> :tabn 10<cr>
noremap  tt :tabNext<CR>
noremap vv ^v$
"=============================================================================
"# 6 Status line
"=============================================================================
" Always show the status line
set laststatus=2

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ Line:\ %l\ \ Column:\ %c

"=============================================================================
"# 7 Map keys
"=============================================================================
" 	7.1 noremap
"change keyboard for quickly 
noremap J 5j
noremap K 5k
noremap H 5h
noremap L 5l
noremap E :q!<CR>
noremap S :wq<CR>
noremap W :w<CR>
" 	7.2 inoremap 
inoremap jk <Esc>
inoremap <C-s> <Esc>:w<CR>
nnoremap <C-s> <Esc>:w<CR>
nnoremap <LEADER>w <Esc>:w<CR>
nnoremap <C-w>w <Esc>:w<CR>
inoremap [Caps] [Esc]

"inoremap { {<CR><CR>}<Up><Tab>
inoremap { {}<left>
inoremap ( ()<Left>
inoremap < <><Left>
inoremap [ []<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
" 	3.3 leader map
"  setting <LEADER> as <SPACE>
"noremap <LEADER>h <C-W>h
noremap <LEADER><LEADER> f(l

"=============================================================================
"# z help functions
"=============================================================================
 " Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction
