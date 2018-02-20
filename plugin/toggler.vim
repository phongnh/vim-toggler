if exists('g:loaded_toggler')
    finish
endif

" Toggle conceallevel {{{
if has('conceal')
    function! s:ToggleConceallevel()
        if &conceallevel == 0
            set conceallevel=2
        else
            set conceallevel=0
        endif

        echo "conceallevel = " . &conceallevel
    endfunction

    nmap <silent> =ok :call <SID>ToggleConceallevel()<CR>
endif
" }}}

" Exchange gj and gk to j and k {{{
function! s:ToggleGJK()
    if exists('s:enabled_gjk') && s:enabled_gjk
        let s:enabled_gjk = 0

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
        let s:enabled_gjk = 1

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

nmap <silent> =om :call <SID>ToggleGJK()<CR>
" }}}

" Toggle mouse {{{
if has('mouse')
    function! s:ToggleMouse()
        if &mouse == ""
            set mouse=a
            echo 'Mouse is for Vim (' . &mouse . ')'
        else
            set mouse=
            echo 'Mouse is for terminal'
        endif
    endfunction

    nmap <silent> =oM :call <SID>ToggleMouse()<CR>
endif
" }}}

" Toggle clipboard {{{
if has('clipboard')
    if has('unnamedplus')
        function! s:ToggleClipboard()
            if match(&clipboard, 'unnamedplus') > -1
                set clipboard-=unamedplus
                echo 'Disabled "unnamedplus" clipboard!'
            else
                set clipboard+=unnamedplus
                echo 'Enabled "unnamedplus" clipboard!'
            endif
        endfunction
    else
        function! s:ToggleClipboard()
            if match(&clipboard, 'unnamed') > -1
                set clipboard-=unnamed
                echo 'Disabled "unnamed" clipboard!'
            else
                set clipboard+=unnamed
                echo 'Enabled "unnamed" clipboard!'
            endif
        endfunction
    endif

    nmap <silent> =oy :call <SID>ToggleClipboard()<CR>
endif
" }}}

" Toggle Tabline {{{
function! s:ToggleTabline()
    if &showtabline == 2
        set showtabline=0
        echo 'Disabled tabline!'
    else
        set showtabline=2
        echo 'Enabled tabline!'
    endif
endfunction

nmap <silent> =ot :call <SID>ToggleTabline()<CR>
" }}}

" Toggle statusline {{{
function! s:ToggleStatusline()
    if &laststatus == 2
        set laststatus=0
        echo 'Disabled statusline!'
    else
        set laststatus=2
        echo 'Enabled statusline!'
    endif
endfunction

nmap <silent> =oT :call <SID>ToggleStatusline()<CR>
" }}}

" Change tab width {{{
nmap <silent> =o2 :setlocal tabstop=2 softtabstop=2 shiftwidth=2<CR>:echo "Spaces: " . &shiftwidth<CR>
nmap <silent> =o4 :setlocal tabstop=4 softtabstop=4 shiftwidth=4<CR>:echo "Spaces: " . &shiftwidth<CR>
nmap <silent> =o8 :setlocal tabstop=8 softtabstop=8 shiftwidth=8<CR>:echo "Spaces: " . &shiftwidth<CR>

nmap <silent> =o@ :setlocal tabstop=2<CR>:setlocal tabstop?<CR>
nmap <silent> =o$ :setlocal tabstop=4<CR>:setlocal tabstop?<CR>
nmap <silent> =o* :setlocal tabstop=8<CR>:setlocal tabstop?<CR>
" }}}

" Toggle option {{{
function! s:ToggleOption(option_name)
    execute 'set' a:option_name.'!'
    execute 'set' a:option_name.'?'
endfunction
" }}}

" Toggle local option {{{
function! s:ToggleLocalOption(option_name)
    execute 'setlocal' a:option_name.'!'
    execute 'setlocal' a:option_name.'?'
endfunction
" }}}

" Toggle folding
nmap <silent> =of :call <SID>ToggleLocalOption('foldenable')<CR>

" Toggle expandtab
nmap <silent> =oe :call <SID>ToggleLocalOption('expandtab')<CR>

" Toggle EOL {{{
function! s:ToggleEOL()
    if match(&listchars, 'eol:¬') > -1
        setlocal listchars-=eol:¬
    else
        setlocal listchars+=eol:¬
    endif
endfunction

nmap <silent> =oE :call <SID>ToggleEOL()<CR>
" }}}

" Toggle paste
nmap <silent> =op :call <SID>ToggleOption('paste')<CR>

" Toggle "keep current line in the center of the screen" mode
nmap <silent> =oz :let &scrolloff = 999 - &scrolloff<CR>:echo "scrolloff = " . &scrolloff<CR>

" Toggle showcmd
nmap <silent> =o; :call <SID>ToggleOption('showcmd')<CR>

if get(g:, 'vim_toggler_standalone', 0)
    " Toggle background
    nmap =ob :set background=<C-r>=&background == 'dark' ? 'light' : 'dark'<CR><CR>

    " Toggle diff
    nmap =od :<C-r>=&diff ? 'diffoff' : 'diffthis'<CR><CR>

    " Toggle hlsearch
    nmap <silent> =oh :call <SID>ToggleLocalOption('hlsearch')<CR>

    " Toggle ignorecase
    nmap <silent> =oi :call <SID>ToggleLocalOption('ignorecase')<CR>

    " Toggle list
    nmap <silent> =ol :call <SID>ToggleLocalOption('list')<CR>

    " Toggle number
    nmap <silent> =on :call <SID>ToggleLocalOption('number')<CR>

    " Toggle relativenumber
    nmap <silent> =or :call <SID>ToggleLocalOption('relativenumber')<CR>

    " Toggle cursorline
    nmap <silent> =oc :call <SID>ToggleLocalOption('cursorline')<CR>

    " Toggle spell checking
    nmap <silent> =os :call <SID>ToggleLocalOption('spell')<CR>

    " Toggle wrap
    nmap <silent> =ow :call <SID>ToggleLocalOption('wrap')<CR>
endif

if get(g:, 'vim_toggler_quickfix', 0)
    " Toggle quickfix / location list {{{
    function! s:ToggleQuickfix()
        if exists("s:quickfix_bufnr")
            silent! cclose
        else
            silent! copen
        endif
    endfunction

    function! s:ToggleLocationList()
        if exists("s:quickfix_bufnr")
            silent! lclose
        else
            silent! lopen
        endif
    endfunction

    function! s:SetQuickfixBufnrOnBufWinEnter()
        let s:quickfix_bufnr = bufnr('$')
    endfunction

    function! s:CheckQuickfixBufnrOnBufWinLeave()
        if exists("s:quickfix_bufnr") && s:quickfix_bufnr == expand("<abuf>")
            unlet s:quickfix_bufnr
        endif
    endfunction

    augroup vim-toogler-quickfix
        autocmd!
        autocmd BufWinEnter quickfix call <SID>SetQuickfixBufnrOnBufWinEnter()
        autocmd BufWinLeave *        call <SID>CheckQuickfixBufnrOnBufWinLeave()
    augroup END

    nmap <silent> =oq :call <SID>ToggleQuickfix()<CR>
    nmap <silent> =oQ :call <SID>ToggleLocationList()<CR>
    " }}}
endif

let g:loaded_toggler = '0.13.0'
