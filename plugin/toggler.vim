if get(g:, 'loaded_vim_toggler', 0)
    finish
endif

" Change tab width {
nnoremap <silent> yo2 :setlocal tabstop=2 softtabstop=2 shiftwidth=2 shiftwidth<CR>
nnoremap <silent> yo4 :setlocal tabstop=4 softtabstop=4 shiftwidth=4 shiftwidth<CR>
nnoremap <silent> yo8 :setlocal tabstop=8 softtabstop=8 shiftwidth=8 shiftwidth<CR>

nnoremap <silent> yo@ :setlocal tabstop=2 tabstop<CR>
nnoremap <silent> yo$ :setlocal tabstop=4 tabstop<CR>
nnoremap <silent> yo* :setlocal tabstop=8 tabstop<CR>
" }

" Enable/disable gt/gT to cycle buffers when VIM has only one tabpage {
function! s:CycleBuffersWithTabMappings() abort
    if empty(mapcheck('gt', 'n')) || empty(mapcheck('gT', 'n'))
        nnoremap <silent> <expr> gt tabpagenr('$') == 1 ? ":\<C-U>bnext\<CR>" : ":\<C-U>tabnext\<CR>"
        nnoremap <silent> <expr> gT tabpagenr('$') == 1 ? ":\<C-U>bprevious\<CR>" : ":\<C-U>tabprevious\<CR>"
        echo 'Enabled cycling buffers with gt/gT for VIM with only one tabpage!'
    else
        silent! nunmap gt
        silent! nunmap gT
        echo 'Disabled cycling buffers with gt/gT for VIM with only one tabpage!'
    endif
endfunction

if get(g:, 'vim_toggler_enable_cycling_buffers_with_gt_gT', 0)
    silent! call <SID>CycleBuffersWithTabMappings()
endif

nnoremap <silent> yoB :call <SID>CycleBuffersWithTabMappings()<CR>
nnoremap <silent> yoG :call <SID>CycleBuffersWithTabMappings()<CR>
" }

" Exchange gj and gk to j and k {
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

nnoremap <silent> yom :call <SID>ToggleGJK()<CR>
" }

" Toggle clipboard {
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
            execute printf('set clipboard^=%s', s:clipboard)
            echo printf('Enabled "%s" clipboard!', s:clipboard)
        endif
    endfunction

    nnoremap <silent> yoy :call <SID>ToggleClipboard()<CR>
endif
" }

" Toggle showtabline {
function! s:ToggleShowtabline() abort
    if &showtabline > 0
        if &showtabline == 1 && tabpagenr('$') == 1
            set showtabline=2
        else
            set showtabline=0
        endif
    elseif tabpagenr('$') > 1
        set showtabline=1
    else
        set showtabline=2
    endif
    set showtabline?
endfunction

nnoremap <silent> yot :call <SID>ToggleShowtabline()<CR>
" }

" Toggle statusline {
function! s:ToggleStatusline() abort
    if &laststatus > 0
        if &laststatus == 1 && winnr('$') == 1
            set laststatus=2
        else
            set laststatus=0
        endif
    elseif winnr('$') > 1
        set laststatus=1
    else
        set laststatus=2
    endif
    set laststatus?
endfunction

nnoremap <silent> yoT :call <SID>ToggleStatusline()<CR>
" }

" Toggle conceallevel {
if has('conceal')
    function! s:ToggleConceallevel()
        if &conceallevel > 0
            set conceallevel=0
        else
            set conceallevel=2
        endif
        set conceallevel?
    endfunction

    nnoremap <silent> yoC :call <SID>ToggleConceallevel()<CR>
endif
" }

" Toggle option {
function! s:ToggleOption(option_name) abort
    execute printf('set %s! %s?', a:option_name, a:option_name)
endfunction
" }

" Toggle local option {
function! s:ToggleLocalOption(option_name) abort
    execute printf('setlocal %s! %s?', a:option_name, a:option_name)
endfunction
" }

" Toggle showmatch
nnoremap <silent> yoM :call <SID>ToggleOption('showmatch')<CR>

" Toggle incsearch
nnoremap <silent> yoI :call <SID>ToggleLocalOption('incsearch')<CR>
nnoremap <silent> yoS :call <SID>ToggleOption('incsearch')<CR>

" Toggle expandtab
nnoremap <silent> yoe :call <SID>ToggleLocalOption('expandtab')<CR>

" Toggle EOL {
function! s:ToggleEOL() abort
    if match(&listchars, 'eol:¬') > -1
        setlocal listchars-=eol:¬
    else
        setlocal listchars+=eol:¬
    endif
    setlocal listchars?
endfunction

nnoremap <silent> yoE :call <SID>ToggleEOL()<CR>
" }

" Toggle "keep current line in the center of the screen" mode
nnoremap <silent> yoz :let &scrolloff = 999 - &scrolloff<CR>:set scrolloff?<CR>

" Toggle showcmd
nnoremap <silent> yo; :call <SID>ToggleOption('showcmd')<CR>

" Improve toggling foldenable
nnoremap zi zi:set foldenable?<CR>

" Cycle Fold Method {
function! s:CycleFoldMethod() abort
    if &foldmethod == 'manual'
        set foldmethod=indent
    elseif &foldmethod == 'indent'
        set foldmethod=expr
    elseif &foldmethod == 'expr'
        set foldmethod=marker
    elseif &foldmethod == 'marker'
        set foldmethod=syntax
    elseif &foldmethod == 'syntax'
        set foldmethod=diff
    else
        set foldmethod=manual
    endif
    set foldmethod?
endfunction

nnoremap <silent> yoo :call <SID>CycleFoldMethod()<CR>
" }

let g:loaded_vim_toggler = 1
