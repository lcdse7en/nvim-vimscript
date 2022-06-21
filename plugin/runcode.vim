" ========
" ======== runcode
" ========
map <F5> :call RunCode()<CR>
func! RunCode()
    exec "w"
    if &filetype == 'python'
        set splitright
        :vsp
        "set splitbelow
        ":sp
        ":res -10

        redir @a
        silent exec "g /^#!.*python2$/ %"
        redir END
        if @a == ''
            :term python2 %;echo '\n[python2]'
        else
            :term python3 %
        endif
        normal i
    endif

    if &filetype == 'r'
        "set splitright
        ":vsp
        set splitbelow
        :sp
        :res -10
        :term Rscript %
        normal i
        if filereadable('Rplots.pdf')
            exec "!zathura Rplots.pdf &"
        endif
    endif

    if &filetype == 'c'
        set splitbelow
        exec "!gcc % -Wall -o %<"
        :sp
        :res -10
        :term ./%<
        normal i
    endif

    if &filetype == 'cpp'
        set splitbelow
        exec "!g++ -std=c++11 % -Wall -o %<"
        :sp
        :res -10
        :term ./%<
        normal i
    endif

    if &filetype == 'markdown'
        exec "InstantMarkdownPreview"
    endif

    if &filetype == 'tex'
        ":SCCompile
        "silent exec "!/usr/local/texlive/2019/bin/x86_64-linux/xelatex % >/tmp/nvimlatex"
        "redir @a
        "silent echo system('~/.config/nvim/scripts/IsError.sh')
        "redir END
        "let Error = len(@a)
        "if Error == 1
          "silent exec "!zathura %<.pdf &"
          "":LLPStartPreview
        "else
          "echo @a
        "endif
        "set splitright

        exec "!/usr/local/texlive/2021/bin/x86_64-linux/xelatex %"

        "exec "FloatermNew /usr/local/texlive/2021/bin/x86_64-linux/xelatex %"
        silent :!zathura %<.pdf &
      endif
endfunc

" <C-F5>
map <F29> :call RUN_latexmk()<CR>
func! RUN_latexmk()
    exec "w"
    if &filetype == 'tex'
        "":SCCompile
        ""silent exec "pkill zathura"
        "exec "!/usr/local/texlive/2019/bin/x86_64-linux/pdflatex % >/tmp/nvimlatex"
        "redir @a
        "silent echo system('~/.config/nvim/scripts/IsError.sh')
        "redir END
        "let Error = len(@a)
        "if Error == 1
          "silent exec "!zathura %<.pdf &"
          "":LLPStartPreview
        "else
          "echo @a
        "endif
        exec "!/usr/local/texlive/2019/bin/x86_64-linux/pdflatex %"
        silent :!zathura %<.pdf &
      endif
endfunc

" Shfit + F5
map <F17> :call RunCodeRepl()<CR>
func! RunCodeRepl()
    exec "w"
    if &filetype == 'python'
            if search("@profile")
                    exec "AsyncRun kernprof -l -v %"
                    exec "copen"
                    exec "wincmd p"
             elseif search("set_trace()")
                     exec "!python3 %"
             else
                    exec 'vertical rightbelow copen 60'
                    exec 'wincmd w'
                    exec "AsyncRun -raw python3 %"
                    exec "copen"
                    exec "wincmd p"
            endif
    endif
    if &filetype == 'tex'
        :LLPStartPreview
    endif
    if &filetype == 'markdown'
        silent exec "!markmap --no-open %"
        silent exec "!surf %<.html"
    endif
endfunc
