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
"
"  auto Comment
""noremap <C-/> :call autoComment()<CR>
""func! autoComment()
""    let comment="\/\/"
""    let command= "'<,'>s/^/".comment
""	if &filetype == 'c' || &filetype == 'cpp'
""		exec command
""	elseif &filetype == 'java'
""		exec "!javac %"
""		exec "!time java %<"
""    elseif &filetype == 'javascript'
""		exec "!time node %"
"""	elseif &filetype == 'sh'
"""		:!time bash %
""	elseif &filetype == 'python'
""		set splitbelow
""		:sp
""		:term python3 %
""	elseif &filetype == 'html'
""        exec "!surf %"
"""	elseif &filetype == 'html'
"""		silent! exec "!".g:mkdp_browser." % &"
""	elseif &filetype == 'markdown'
""		exec "MarkdownPreviewToggle"
""		endif
""endfunc
""

