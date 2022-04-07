" =============================================================================
" =============================================================================
" _ __ ___  _   _  ___ ___  _ __  / _(_) __ _ 
"| '_ ` _ \| | | |/ __/ _ \| '_ \| |_| |/ _` |
"| | | | | | |_| | (_| (_) | | | |  _| | (_| |
"|_| |_| |_|\__, |\___\___/|_| |_|_| |_|\__, |
"           |___/                       |___/ 
"============================================================================= 
"=============================================================================
"# 1.the config for first time
" 	1.1 install plug.vim if not 
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"
"=============================================================================
"# 2.Default setting 
" 	2.1 vim options
set number
"set relativenumber
set cursorline
set autoindent
"set foldenable
"set foldmethod=syntax
set ts=4 "tabspace
set sw=4 "shiftword
set softtabstop=4
set expandtab
set showmatch
" 	2.2 addtional setting
" Compile function
noremap cc :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c' || &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	"elseif &filetype == 'cpp'
	"	set splitbelow
	"	exec "!g++ -std=c++11 % -Wall -o %<"
	"	:sp
	"	:res -15
	"	:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
    elseif &filetype == 'javascript'
		exec "!time node %"
"	elseif &filetype == 'sh'
"		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
        exec "!surf %"
"	elseif &filetype == 'html'
"		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreviewToggle"
		endif
endfunc
" remenber couser when exit
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END  
"
"=============================================================================
"# 3 Map keys
" 	3.1 noremap
"change keyboard for quickly 
noremap J 5j
noremap K 5k
noremap H 5h
noremap L 5l
"noremap Q :q!<CR>
noremap S :wq<CR>
noremap W :w<CR>
xmap ga :EasyAlign =
noremap ga :EasyAlign =<CR>
" 	3.2 inoremap 
inoremap jk <Esc>
inoremap <C-s> <Esc>:w<CR>
nnoremap <C-s> <Esc>:w<CR>
nnoremap <LEADER>w <Esc>:w<CR>
nnoremap <C-w>w <Esc>:w<CR>
inoremap [Caps] [Esc]
" 	3.3 leader map
"  setting <LEADER> as <SPACE>
let mapleader=" "
noremap <LEADER>h <C-W>h
noremap <LEADER>l <C-w>l
noremap <LEADER>a :EasyAlign =<CR>
noremap <LEADER><LEADER> f(l
noremap  tt :tabNext<CR>
noremap vv ^v$
"
"=============================================================================
"#4 for each type file
" 	4.1 for markdown
autocmd  FileType  markdown  inoremap  ,f  <Esc>/<++><CR>:nohlsearch<CR>cw
autocmd  FileType  markdown  inoremap  ,b  **** <++><Esc>F*hi
autocmd FileType markdown inoremap ,i :** <++> <Esc>F*i
autocmd FileType markdown inoremap ,l :~~~~ <++> <Esc>F~hi
"
"=============================================================================
"#5 Plug-vim
" 	5.1 PlugInstall  
" 		vim-airline  
" 		coc.vim  
" 		vim-instant-markdown  
" 		vim-easy-align  
call plug#begin('~/.config/nvim/plugged')
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"plug 'https://github.com/godlygeek/tabular'
Plug 'junegunn/vim-easy-align'
Plug 'vim-scripts/taglist.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
"Plug 'SirVer/ultisnips'
"Plug 'https://gitee.com/zgpio/ultisnips'
Plug 'https://gitee.com/zgpio/vim-snippets'
"nerdtree & devicons
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
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
"java
"Plug 'artur-shaik/vim-javacomplete2'
call plug#end()
" 	5.2 Plug-config
" ===
" ===gruvbox 
" ===
colorscheme gruvbox
let g:gruvbox_transparent_bg = 1
"autocmd vimenter * ++nested colorscheme gruvbox
"set bg=dark

" ===
" === vim-javacomplete2'
" === 
"autocmd FileType java setlocal omnifunc=javacomplete#Complete
	
" ===
" === vim-markdown
" === 
let g:vim_markdown_folding_disabled = 1
set conceallevel=2

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
" ===
" === NerdTree
" ===
map <silent> <F8> :NERDTreeToggle<cr>
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
"noremap <LEADER>bf :Autoformat<CR>


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
let g:coc_global_extensions =['coc-json','coc-css','coc-prettier']

"=============================================================================
" 	5.3 plug-vim from others
"the coc config for example
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" if has("patch-8.1.1564")
"   " Recently vim can merge signcolumn and number column into one
"   set signcolumn=number
" else
"  set signcolumn=yes
"endif
"always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
"if has('nvim')
"  inoremap <silent><expr> <c-space> coc#refresh()
"else
"  inoremap <silent><expr> <c-@> coc#refresh()
"endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"if exists('*complete_info')
"  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
"else
" {
"    "include": [
"      "./src/**/*"
"    ]
"  } inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>fm  <Plug>(coc-format-selected)
nmap <leader>fm  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>z  <Plug>(coc-codeaction-selected)
nmap <leader>aa  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" prettier
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
 
" the coc confgi end
