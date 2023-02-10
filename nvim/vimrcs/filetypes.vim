"=============================================================================
"#4 for each type file
"=============================================================================
" 	4.1 for markdown
autocmd  FileType  markdown  inoremap  ,f  <Esc>/<++><CR>:nohlsearch<CR>cw
autocmd  FileType  markdown  inoremap  ,b  **** <++><Esc>F*hi
autocmd FileType markdown inoremap ,i :** <++> <Esc>F*i
autocmd FileType markdown inoremap ,l :~~~~ <++> <Esc>F~hi
