"============================================================================
"#5 Plug-vim
" 	5.1 PlugInstall  
" 		vim-airline  
" 		coc.vim  
" 		vim-instant-markdown  
" 		vim-easy-align  
call plug#begin('~/.config/nvim/plugged')
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"plug 'https://github.com/godlygeek/tabular'
Plug 'junegunn/vim-easy-align'
Plug 'vim-scripts/taglist.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
"Plug 'SirVer/ultisnips'
"nerdtree & devicons
Plug 'scrooloose/nerdtree'
""Plug 'ryanoasis/vim-devicons'
""Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"markdow
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
"Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'godlygeek/tabular' 
Plug 'plasticboy/vim-markdown'
"Plug 'joker1007/vim-markdown-quote-syntax' "代码格式高亮
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'morhetz/gruvbox'
"Plug 'sbdchd/neoformat'
Plug 'Yggdroot/indentLine'
Plug 'vim-autoformat/vim-autoformat'
Plug 'skywind3000/vim-quickui'

"java
"Plug 'artur-shaik/vim-javacomplete2'

" vim lua plug config
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" lsp support
Plug 'neovim/nvim-lspconfig'
" Plug 'williamboman/nvim-lsp-installer'
Plug 'williamboman/mason.nvim'
"completion"
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'rafamadriz/friendly-snippets'

"theme"
Plug 'folke/tokyonight.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"terminal"
Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.*'}
"Plug 'preservim/nerdcommenter'
"
call plug#end()
""source  /home/ve/.config/nvim/plugged/ctrlp.vim/plugin/ctrlp.vim
""'source  /home/ve/.config/nvim/plugged/mru.vim/plugin/mru.vim
set completeopt=menu,menuone,noselect

"============
" clear all the menus
call quickui#menu#reset()

" install a 'File' menu, use [text, command] to represent an item.
call quickui#menu#install('&File', [
            \ [ "&New File\tCtrl+n", 'echo 0' ],
            \ [ "&Open File\t(F3)", 'echo 1' ],
            \ [ "&Close", 'echo 2' ],
            \ [ "--", '' ],
            \ [ "&Save\tCtrl+s", 'echo 3'],
            \ [ "Save &As", 'echo 4' ],
            \ [ "Save All", 'echo 5' ],
            \ [ "--", '' ],
            \ [ "E&xit\tAlt+x", 'echo 6' ],
            \ ])

" items containing tips, tips will display in the cmdline
call quickui#menu#install('&Edit', [
            \ [ '&Copy', 'echo 1', 'help 1' ],
            \ [ '&Paste', 'echo 2', 'help 2' ],
            \ [ '&Find', 'echo 3', 'help 3' ],
            \ ])

" script inside %{...} will be evaluated and expanded in the string
call quickui#menu#install("&Option", [
			\ ['Set &Spell %{&spell? "Off":"On"}', 'set spell!'],
			\ ['Set &Cursor Line %{&cursorline? "Off":"On"}', 'set cursorline!'],
			\ ['Set &Paste %{&paste? "Off":"On"}', 'set paste!'],
			\ ])

" register HELP menu with weight 10000
call quickui#menu#install('H&elp', [
			\ ["&Cheatsheet", 'help index', ''],
			\ ['T&ips', 'help tips', ''],
			\ ['--',''],
			\ ["&Tutorial", 'help tutor', ''],
			\ ['&Quick Reference', 'help quickref', ''],
			\ ['&Summary', 'help summary', ''],
			\ ], 10000)

" enable to display tips in the cmdline
let g:quickui_show_tip = 1

" hit space twice to open menu
noremap mm :call quickui#menu#open()<cr>

""terminal
function! TermExit(code)
    echom "terminal exit code: ". a:code
endfunc

let opts = {'w':60, 'h':8, 'callback':'TermExit'}
let opts.title = 'Terminal Popup'
noremap te :call quickui#terminal#open('/bin/zsh', opts)
"=========================================
" 	5.2 Plug-config
" ===
" ===gruvbox 
" ===
"colorscheme gruvbox
let g:gruvbox_transparent_bg = 1
"autocmd vimenter * ++nested colorscheme gruvbox
"set bg=dark

" ===
" === vim-javacomplete2'
" === 
"autocmd FileType java setlocal omnifunc=javacomplete#Complete

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
"let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=25
noremap <leader>f :NERDTreeToggle<cr>
map <M-n> :NERDTreeToggle<cr>
" q=> quit
" t=> open tab
" p => previous dictionary
" P =>root dictionary
" K => first node of dictionary
" J => last node of dictionary
" m =>display nerdtree menu
" ? => help
	
" ===
" === vim-markdown
" === 
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
set conceallevel=0

" ===
" === vim-instant-markdown
" ===
"let g:instant_markdown_slow = 0
"let g:instant_markdown_autostart = 0
" let g:instant_markdown_open_to_the_world = 1
" let g:instant_markdown_allow_unsafe_content = 1
" let g:instant_markdown_allow_external_content = 0
" let g:instant_markdown_mathjax = 1
"let g:instant_markdown_autoscroll = 1

" ===
" === taglist.vim
" ===
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Show_One_File = 1        
let Tlist_Exit_OnlyWindow = 1   
map <silent> <F9> :TlistToggle<cr>
"===
" === vim-table-mode
" ===
noremap <LEADER>tm :TableModeToggle<CR>
"let g:table_mode_disable_mappings = 1
"let g:table_mode_cell_text_object_i_map = 'k<Bar>'
"===
"=== autodentLine
"===
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_enabled = 1
"let g:indentLine_char = '.'
"let g:indentLine_setColors = 0
"set list lcs=tab:\|\ 

"===
"=== vim-autoformat
"===
"let g:formatdef_my_clang = '"clang-format"'
"let g:formatters_cpp = ['my_clang']
"let g:formatters_c = ['my_clang']
"let g:formatdef_my_html = '"html-beautify -s 2"'
"let g:formatters_html = ['my_html']
noremap <LEADER>bf :Autoformat<CR>


" === Makdown preview
" ===
"let g:mkdp_auto_start = 1
"let g:mkdp_auto_close = 1
" ===
" === ultisnips
" ===
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"


"coc-nvim 
"let g:coc_global_extensions =['coc-json','coc-css','coc-prettier']

"=============================================================================
"
