if get(g:, 'loaded_vim_toggler', 0)
    finish
endif

" Change tab width {
nnoremap <silent> yo2 :<C-u>setlocal tabstop=2 softtabstop=2 shiftwidth=2 shiftwidth<CR>
nnoremap <silent> yo4 :<C-u>setlocal tabstop=4 softtabstop=4 shiftwidth=4 shiftwidth<CR>
nnoremap <silent> yo8 :<C-u>setlocal tabstop=8 softtabstop=8 shiftwidth=8 shiftwidth<CR>

nnoremap <silent> yo@ ::<C-u>etlocal tabstop=2 tabstop<CR>
nnoremap <silent> yo$ ::<C-u>etlocal tabstop=4 tabstop<CR>
nnoremap <silent> yo* ::<C-u>etlocal tabstop=8 tabstop<CR>
" }

" Enable/disable gt/gT to cycle buffers when VIM has only one tabpage {
function! s:CycleBuffersWithTabMappings() abort
    if empty(mapcheck('gt', 'n')) || empty(mapcheck('gT', 'n'))
        nnoremap <silent> <expr> gt printf(":\<C-u>%s%s\<CR>", v:count > 0 ? v:count : '', tabpagenr('$') == 1 ? 'bnext' : 'tabnext')
        nnoremap <silent> <expr> gT printf(":\<C-u>%s%s\<CR>", v:count > 0 ? v:count : '', tabpagenr('$') == 1 ? 'bprevious' : 'tabprevious')
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

nnoremap <silent> yoB :<C-u>call <SID>CycleBuffersWithTabMappings()<CR>
nnoremap <silent> yoG :<C-u>call <SID>CycleBuffersWithTabMappings()<CR>
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

nnoremap <silent> yom :<C-u>call <SID>ToggleGJK()<CR>
" }

" Toggle clipboard {
if has('clipboard')
    if has('unnamedplus')
        let s:clipboard = 'unnamedplus'
    else
        let s:clipboard = 'unnamed'
    endif

    function! s:ToggleClipboard() abort
        if match(&clipboard, s:clipboard) > -1
            execute printf('set clipboard-=%s', s:clipboard)
            echo printf('Disabled "%s" clipboard!', s:clipboard)
        else
            execute printf('set clipboard^=%s', s:clipboard)
            echo printf('Enabled "%s" clipboard!', s:clipboard)
        endif
    endfunction

    nnoremap <silent> yoy :<C-u>call <SID>ToggleClipboard()<CR>
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

nnoremap <silent> yot :<C-u>call <SID>ToggleShowtabline()<CR>
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

nnoremap <silent> yoT :<C-u>call <SID>ToggleStatusline()<CR>
" }

" Toggle conceallevel {
if has('conceal')
    function! s:ToggleConceallevel() abort
        if &conceallevel > 0
            set conceallevel=0
        else
            set conceallevel=2
        endif
        set conceallevel?
    endfunction

    nnoremap <silent> yoC :<C-u>call <SID>ToggleConceallevel()<CR>
endif
" }

" Toggle showmatch
nnoremap <silent> yoM :<C-u>set showmatch! showmatch?<CR>

" Toggle incsearch
nnoremap <silent> yoI :<C-u>setlocal incsearch! incsearch?<CR>
nnoremap <silent> yoS :<C-u>set incsearch! incsearch?<CR>

" Toggle expandtab
nnoremap <silent> yoe :<C-u>setlocal expandtab! expandtab?<CR>

" Toggle EOL {
function! s:UnifyListchars() abort
    let l:listchar_mappings = {}
    for l:item in split(&listchars, ',')
        let [l:part, l:char] = split(l:item, ':')
        let l:listchar_mappings[l:part] = escape(l:char, ' ')
    endfor
    let l:listchars = []
    for l:part in sort(keys(l:listchar_mappings))
        let l:char = l:listchar_mappings[l:part]
        call add(l:listchars, join([l:part, l:char], ':'))
    endfor
    execute printf('set listchars=%s', substitute(join(l:listchars, ','), ' ', '\ ', 'g'))
endfunction

function! s:ToggleEOL() abort
    if !exists('s:eol_char')
        call s:UnifyListchars()
    endif
    let l:listchars = split(&listchars, ',')
    let l:idx = match(l:listchars, 'eol')
    if !exists('s:eol_char')
        let s:eol_char = l:idx > -1 ? split(l:listchars[l:idx], ':')[-1] : '$'
    endif
    if l:idx > -1
        execute printf('setlocal listchars-=eol:%s', s:eol_char)
    else
        execute printf('setlocal listchars+=eol:%s', s:eol_char)
    endif
    setlocal listchars?
endfunction

nnoremap <silent> yoE :<C-u>call <SID>ToggleEOL()<CR>
" }

" Toggle "keep current line in the center of the screen" mode
nnoremap <silent> yoz :<C-u>let &scrolloff = 999 - &scrolloff<CR>:set scrolloff?<CR>

" Toggle showcmd
nnoremap <silent> yo; :<C-u>set showcmd! showcmd?<CR>

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

nnoremap <silent> yof :<C-u>call <SID>CycleFoldMethod()<CR>
" }

" Improve folding mappings
nnoremap <silent> zr zr:<C-u>setlocal foldlevel?<CR>
nnoremap <silent> zm zm:<C-u>setlocal foldlevel?<CR>
nnoremap <silent> zR zR:<C-u>setlocal foldlevel?<CR>
nnoremap <silent> zM zM:<C-u>setlocal foldlevel?<CR>
nnoremap <silent> zi zi:<C-u>setlocal foldenable?<CR>
nnoremap <silent> z] :<C-u>let &foldcolumn = &foldcolumn + 1<CR>:<C-u>setlocal foldcolumn?<CR>
nnoremap <silent> z[ :<C-u>let &foldcolumn = &foldcolumn - 1<CR>:<C-u>setlocal foldcolumn?<CR>

let g:loaded_vim_toggler = 1
