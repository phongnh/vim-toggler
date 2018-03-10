if exists('g:loaded_toggler')
    finish
endif

" Change tab width {{{
nnoremap <silent> =o2 :setlocal tabstop=2 softtabstop=2 shiftwidth=2 shiftwidth<CR>
nnoremap <silent> =o4 :setlocal tabstop=4 softtabstop=4 shiftwidth=4 shiftwidth<CR>
nnoremap <silent> =o8 :setlocal tabstop=8 softtabstop=8 shiftwidth=8 shiftwidth<CR>

nnoremap <silent> =o@ :setlocal tabstop=2<CR>:setlocal tabstop?<CR>
nnoremap <silent> =o$ :setlocal tabstop=4<CR>:setlocal tabstop?<CR>
nnoremap <silent> =o* :setlocal tabstop=8<CR>:setlocal tabstop?<CR>
" }}}

" Exchange gj and gk to j and k {{{
function! s:ToggleGJK() abort
    if get(s:, 'enabled_gjk', 0)
        let s:enabled_gjk = 0

        noremap  <buffer> j j
        xnoremap <buffer> j j
        noremap  <buffer> k k
        xnoremap <buffer> k k

        noremap  <buffer> gj gj
        xnoremap <buffer> gj gj
        noremap  <buffer> gk gk
        xnoremap <buffer> gk gk

        echo 'Disabled gj and gk!'
    else
        let s:enabled_gjk = 1

        noremap  <buffer> j gj
        xnoremap <buffer> j gj
        noremap  <buffer> k gk
        xnoremap <buffer> k gk

        noremap  <buffer> gj j
        xnoremap <buffer> gj j
        noremap  <buffer> gk k
        xnoremap <buffer> gk k

        echo 'Enabled gj and gk!'
    endif
endfunction

nnoremap <silent> =om :call <SID>ToggleGJK()<CR>
" }}}

" Toggle mouse {{{
if has('mouse')
    function! s:ToggleMouse()
        if &mouse == ''
            set mouse=a
            echo 'Mouse is for Vim (' . &mouse . ')'
        else
            set mouse=
            echo 'Mouse is for terminal'
        endif
    endfunction

    nnoremap <silent> =oM :call <SID>ToggleMouse()<CR>
endif
" }}}

" Toggle clipboard {{{
if has('clipboard')
    if has('unnamedplus')
        let s:clipboard = 'unnamedplus'
    else
        let s:clipboard = 'unnamed'
    endif

    function! s:ToggleClipboard()
        if match(&clipboard, s:clipboard) > -1
            execute printf('set clipboard-=%s', s:clipboard)
            echo printf('Disabled "%s" clipboard!', s:clipboard)
        else
            execute printf('set clipboard+=%s', s:clipboard)
            echo printf('Enabled "%s" clipboard!', s:clipboard)
        endif
    endfunction

    nnoremap <silent> =oy :call <SID>ToggleClipboard()<CR>
endif
" }}}

" Cycle Tabline {{{
function! s:CycleTabline() abort
    if &showtabline == 0
        set showtabline=1
    elseif &showtabline == 1
        set showtabline=2
    else
        set showtabline=0
    endif
    set showtabline?
endfunction

nnoremap <silent> =ot :call <SID>CycleTabline()<CR>
" }}}

" Cycle statusline {{{
function! s:CycleStatusline() abort
    if &laststatus == 0
        set laststatus=1
    elseif &laststatus == 1
        set laststatus=2
    else
        set laststatus=0
    endif
    set  laststatus?
endfunction

nnoremap <silent> =oT :call <SID>CycleStatusline()<CR>
" }}}

" Cycle  conceallevel {{{
if has('conceal')
    function! s:CycleConceallevel()
        if &conceallevel == 0
            set conceallevel=1
        elseif &conceallevel == 1
            set conceallevel=2
        else
            set conceallevel=0
        endif
        set conceallevel?
    endfunction

    nnoremap <silent> =ok :call <SID>CycleConceallevel()<CR>
endif
" }}}

" Toggle option {{{
function! s:ToggleOption(option_name) abort
    execute printf('set %s! %s?', a:option_name, a:option_name)
endfunction
" }}}

" Toggle local option {{{
function! s:ToggleLocalOption(option_name) abort
    execute printf('setlocal %s! %s?', a:option_name, a:option_name)
endfunction
" }}}

" Toggle expandtab
nnoremap <silent> =oe :call <SID>ToggleLocalOption('expandtab')<CR>

" Toggle EOL {{{
function! s:ToggleEOL() abort
    if match(&listchars, 'eol:¬') > -1
        setlocal listchars-=eol:¬
    else
        setlocal listchars+=eol:¬
    endif
    setlocal listchars?
endfunction

nnoremap <silent> =oE :call <SID>ToggleEOL()<CR>
" }}}

" Toggle "keep current line in the center of the screen" mode
nnoremap <silent> =oz :let &scrolloff = 999 - &scrolloff<CR>:set scrolloff?<CR>

" Toggle showcmd
nnoremap <silent> =o; :call <SID>ToggleOption('showcmd')<CR>

let g:loaded_toggler = '0.16.0'
