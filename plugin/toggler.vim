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

    nnoremap <silent> =ok :call <SID>ToggleConceallevel()<CR>
    nnoremap <silent> cok :call <SID>ToggleConceallevel()<CR>
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

nnoremap <silent> =om :call <SID>ToggleGJK()<CR>
nnoremap <silent> com :call <SID>ToggleGJK()<CR>
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

    nnoremap <silent> =oM :call <SID>ToggleMouse()<CR>
    nnoremap <silent> coM :call <SID>ToggleMouse()<CR>
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

    nnoremap <silent> =oy :call <SID>ToggleClipboard()<CR>
    nnoremap <silent> coy :call <SID>ToggleClipboard()<CR>
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

nnoremap <silent> =ot :call <SID>ToggleTabline()<CR>
nnoremap <silent> cot :call <SID>ToggleTabline()<CR>
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

nnoremap <silent> =oT :call <SID>ToggleStatusline()<CR>
nnoremap <silent> coT :call <SID>ToggleStatusline()<CR>
" }}}

" Change tab width {{{
nnoremap <silent> =o2 :setlocal tabstop=2 softtabstop=2 shiftwidth=2<CR>:echo "Spaces: " . &shiftwidth<CR>
nnoremap <silent> =o4 :setlocal tabstop=4 softtabstop=4 shiftwidth=4<CR>:echo "Spaces: " . &shiftwidth<CR>
nnoremap <silent> =o8 :setlocal tabstop=8 softtabstop=8 shiftwidth=8<CR>:echo "Spaces: " . &shiftwidth<CR>
nnoremap <silent> co2 :setlocal tabstop=2 softtabstop=2 shiftwidth=2<CR>:echo "Spaces: " . &shiftwidth<CR>
nnoremap <silent> co4 :setlocal tabstop=4 softtabstop=4 shiftwidth=4<CR>:echo "Spaces: " . &shiftwidth<CR>
nnoremap <silent> co8 :setlocal tabstop=8 softtabstop=8 shiftwidth=8<CR>:echo "Spaces: " . &shiftwidth<CR>

nnoremap =o@ :setlocal tabstop=2<CR>
nnoremap =o$ :setlocal tabstop=4<CR>
nnoremap =o* :setlocal tabstop=8<CR>
nnoremap co@ :setlocal tabstop=2<CR>
nnoremap co$ :setlocal tabstop=4<CR>
nnoremap co* :setlocal tabstop=8<CR>
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
nnoremap <silent> =of :call <SID>ToggleLocalOption('foldenable')<CR>
nnoremap <silent> cof :call <SID>ToggleLocalOption('foldenable')<CR>

" Toggle expandtab
nnoremap <silent> =oe :call <SID>ToggleLocalOption('expandtab')<CR>
nnoremap <silent> coe :call <SID>ToggleLocalOption('expandtab')<CR>

" Toggle EOL {{{
function! s:ToggleEOL()
    if match(&listchars, 'eol:¬') > -1
        setlocal listchars-=eol:¬
    else
        setlocal listchars+=eol:¬
    endif
endfunction

nnoremap <silent> =oE :call <SID>ToggleEOL()<CR>
nnoremap <silent> coE :call <SID>ToggleEOL()<CR>
" }}}

" Toggle paste
nnoremap <silent> =op :call <SID>ToggleOption('paste')<CR>
nnoremap <silent> cop :call <SID>ToggleOption('paste')<CR>

" Toggle "keep current line in the center of the screen" mode
nnoremap <silent> =oz :let &scrolloff = 999 - &scrolloff<CR>:echo "scrolloff = " . &scrolloff<CR>
nnoremap <silent> coz :let &scrolloff = 999 - &scrolloff<CR>:echo "scrolloff = " . &scrolloff<CR>

" Toggle showcmd
nnoremap <silent> =o; :call <SID>ToggleOption('showcmd')<CR>
nnoremap <silent> co; :call <SID>ToggleOption('showcmd')<CR>

if get(g:, 'vim_toggler_standalone', 0)
    " Toggle background
    nnoremap =ob :set background=<C-r>=&background == 'dark' ? 'light' : 'dark'<CR><CR>
    nnoremap cob :set background=<C-r>=&background == 'dark' ? 'light' : 'dark'<CR><CR>

    " Toggle diff
    nnoremap =od :<C-r>=&diff ? 'diffoff' : 'diffthis'<CR><CR>
    nnoremap cod :<C-r>=&diff ? 'diffoff' : 'diffthis'<CR><CR>

    " Toggle hlsearch
    nnoremap <silent> =oh :call <SID>ToggleLocalOption('hlsearch')<CR>
    nnoremap <silent> coh :call <SID>ToggleLocalOption('hlsearch')<CR>

    " Toggle ignorecase
    nnoremap <silent> =oi :call <SID>ToggleLocalOption('ignorecase')<CR>
    nnoremap <silent> coi :call <SID>ToggleLocalOption('ignorecase')<CR>

    " Toggle list
    nnoremap <silent> =ol :call <SID>ToggleLocalOption('list')<CR>
    nnoremap <silent> col :call <SID>ToggleLocalOption('list')<CR>

    " Toggle number
    nnoremap <silent> =on :call <SID>ToggleLocalOption('number')<CR>
    nnoremap <silent> con :call <SID>ToggleLocalOption('number')<CR>

    " Toggle relativenumber
    nnoremap <silent> =or :call <SID>ToggleLocalOption('relativenumber')<CR>
    nnoremap <silent> cor :call <SID>ToggleLocalOption('relativenumber')<CR>

    " Toggle cursorline
    nnoremap <silent> =oc :call <SID>ToggleLocalOption('cursorline')<CR>
    nnoremap <silent> coc :call <SID>ToggleLocalOption('cursorline')<CR>

    " Toggle spell checking
    nnoremap <silent> =os :call <SID>ToggleLocalOption('spell')<CR>
    nnoremap <silent> cos :call <SID>ToggleLocalOption('spell')<CR>

    " Toggle wrap
    nnoremap <silent> =ow :call <SID>ToggleLocalOption('wrap')<CR>
    nnoremap <silent> cow :call <SID>ToggleLocalOption('wrap')<CR>
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

    nnoremap <silent> =oq :call <SID>ToggleQuickfix()<CR>
    nnoremap <silent> =oQ :call <SID>ToggleLocationList()<CR>
    nnoremap <silent> coq :call <SID>ToggleQuickfix()<CR>
    nnoremap <silent> coQ :call <SID>ToggleLocationList()<CR>
    " }}}
endif

let g:loaded_toggler = '0.12.0'
