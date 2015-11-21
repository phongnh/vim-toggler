if exists('g:loaded_toggler')
    finish
endif

" Toggle EOL {{{
function! <SID>ToggleEOL()
    if match(&listchars, 'eol:¬') > -1
        set listchars-=eol:¬
    else
        set listchars+=eol:¬
    endif
endfunction

nnoremap <silent> coe :call <SID>ToggleEOL()<CR>
" }}}

" Toggle conceallevel {{{
if has('conceal')
    function! <SID>ToggleConceallevel()
        if &conceallevel == 0
            set conceallevel=2
        else
            set conceallevel=0
        endif

        echo "conceallevel = " . &conceallevel
    endfunction

    nnoremap <silent> coa :call <SID>ToggleConceallevel()<CR>
endif
" }}}

" Exchange gj and gk to j and k {{{
function! <SID>ToggleGJK()
    if exists('b:enabled_gjk') && b:enabled_gjk
        let b:enabled_gjk = 0

        noremap <buffer> j  j
        noremap <buffer> k  k
        noremap <buffer> gj gj
        noremap <buffer> gk gk

        xnoremap <buffer> j  j
        xnoremap <buffer> k  k
        xnoremap <buffer> gj gj
        xnoremap <buffer> gk gk

        echo "Disabled gj and gk!"
    else
        let b:enabled_gjk = 1

        noremap <buffer> j  gj
        noremap <buffer> k  gk
        noremap <buffer> gj j
        noremap <buffer> gk k

        xnoremap <buffer> j  gj
        xnoremap <buffer> k  gk
        xnoremap <buffer> gj j
        xnoremap <buffer> gk k

        echo "Enabled gj and gk!"
    endif
endfunction

nnoremap <silent> com :call <SID>ToggleGJK()<CR>
" }}}

" Toggle mouse {{{
if has('mouse')
    function! <SID>ToggleMouse()
        if &mouse == ""
            set mouse=a
            echo 'Mouse is for Vim (' . &mouse . ')'
        else
            set mouse=
            echo 'Mouse is for terminal'
        endif
    endfunction

    nnoremap <silent> coM :call <SID>ToggleMouse()<CR>
endif
" }}}

" Toggle clipboard {{{
if has('clipboard')
    function! <SID>ToggleClipboard()
        if has('unnamedplus')
            if match(&clipboard, 'unnamedplus') > -1
                set clipboard-=unamedplus
                echo 'Disabled "unnamedplus" clipboard!'
            else
                set clipboard+=unnamedplus
                echo 'Enabled "unnamedplus" clipboard!'
            endif
        else
            if match(&clipboard, 'unnamed') > -1
                set clipboard-=unnamed
                echo 'Disabled "unnamed" clipboard!'
            else
                set clipboard+=unnamed
                echo 'Enabled "unnamed" clipboard!'
            endif
        endif
    endfunction

    nnoremap <silent> coy :call <SID>ToggleClipboard()<CR>
endif
" }}}

" Toggle Tabline {{{
function! <SID>ToggleTabline()
    if &showtabline == 2
        set showtabline=0
        echo 'Disabled tabline!'
    else
        set showtabline=2
        echo 'Enabled tabline!'
    endif
endfunction

nnoremap <silent> cot :call <SID>ToggleTabline()<CR>
" }}}

" Toggle statusline {{{
function! <SID>ToggleStatusline()
    if &laststatus == 2
        set laststatus=0
        echo 'Disabled statusline!'
    else
        set laststatus=2
        echo 'Enabled statusline!'
    endif
endfunction

nnoremap <silent> coS :call <SID>ToggleStatusline()<CR>
" }}}

" Toggle option {{{
function! <SID>ToggleOption(option_name)
    execute 'set' a:option_name.'!'
    execute 'set' a:option_name.'?'
endfunction
" }}}

" Toggle local option {{{
function! <SID>ToggleLocalOption(option_name)
    execute 'setlocal' a:option_name.'!'
    execute 'setlocal' a:option_name.'?'
endfunction
" }}}

" Change tab width {{{
nnoremap <silent> co2 :setlocal tabstop=2 shiftwidth=2 softtabstop=2<CR>:echo "Spaces: " . &shiftwidth<CR>
nnoremap <silent> co4 :setlocal tabstop=4 shiftwidth=4 softtabstop=4<CR>:echo "Spaces: " . &shiftwidth<CR>
nnoremap <silent> co8 :setlocal tabstop=8 shiftwidth=8 softtabstop=8<CR>:echo "Spaces: " . &shiftwidth<CR>

nnoremap co@ :setlocal tabstop=2<CR>
nnoremap co$ :setlocal tabstop=4<CR>
nnoremap co* :setlocal tabstop=8<CR>
" }}}

" Toggle folding
nnoremap <silent> cof :call <SID>ToggleLocalOption('foldenable')<CR>

" Toggle "keep current line in the center of the screen" mode
nnoremap <silent> coz :let &scrolloff = 999 - &scrolloff<CR>:echo "scrolloff = " . &scrolloff<CR>

" Toggle number
" nnoremap <silent> con :call <SID>ToggleOption('number')<CR>

" Toggle paste
nnoremap <silent> cop :call <SID>ToggleLocalOption('paste')<CR>

" Toggle wrap
" nnoremap <silent> cow :call <SID>ToggleOption('wrap')<CR>

" Toggle spell checking
" nnoremap <silent> cos :call <SID>ToggleOption('spell')<CR>

" Toggle showmode
nnoremap <silent> coo :call <SID>ToggleOption('showmode')<CR>

" Toggle showcmd
nnoremap <silent> coC :call <SID>ToggleOption('showcmd')<CR>

let g:loaded_toggler = '0.4.0'
