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

" Toggle Tabline {{{
function! <SID>ToggleTabline()
    if &showtabline == 2
        set showtabline=0
        echo "Disabled tabline"
    else
        set showtabline=2
        echo 'Enabled tabline'
    endif
endfunction

nnoremap <silent> cot :call <SID>ToggleTabline()<CR>
" }}}

" Change tab width {{{
nnoremap <silent> co2 :setlocal tabstop=2 shiftwidth=2 softtabstop=2<CR>:echo "Spaces: " . &shiftwidth<CR>
nnoremap <silent> co4 :setlocal tabstop=4 shiftwidth=4 softtabstop=4<CR>:echo "Spaces: " . &shiftwidth<CR>
nnoremap <silent> co8 :setlocal tabstop=8 shiftwidth=8 softtabstop=8<CR>:echo "Spaces: " . &shiftwidth<CR>
" }}}

" Toggle folding
nnoremap <silent> cof :setlocal foldenable! foldenable?<CR>

" Toggle "keep current line in the center of the screen" mode
nnoremap <silent> coz :let &scrolloff = 999 - &scrolloff<CR>
    \ :echo "scrolloff = " . &scrolloff<CR>

" Toggle number
" nnoremap <silent> con :set number! number<CR>

" Toggle paste
nnoremap <silent> cop :setlocal paste! paste?<CR>

" Toggle wrap
" nnoremap <silent> cow :set wrap! wrap?<CR>

" Toggle spell checking
" nnoremap <silent> cos :set spell! spell?<CR>

" Toggle showcmd
nnoremap <silent> coC :set showcmd! showcmd?<CR>

let g:loaded_toggler = '0.2.0'
