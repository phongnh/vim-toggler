# vim-toggler

Toggle useful options:

* conceallevel (=ok, cok)
* exchange gj and j, gk and k (=om, com)
* mouse (=oM, coM)
* "unnamed" or "unnamedplus" clipboard (=oy, coy)
* tabline (showtabline) (=ot, cot)
* statusline (laststatus) (=oT, coT)
* set tabstop, softtabstop and shiftwidth (=o2, co2 -> 2, =o4, co4 -> 4, and =o8, co8 -> 8)
* set tabstop (=o@, co@ -> 2, =o$, co$ -> 4, and =o\*, co\* -> 8)
* background (=ob, cob)
* diffthis (=od, cod)
* folding (foldenable) (=of, cof)
* hlsearch (=oh, coh)
* ignorecase (=oi, coi)
* list (=ol, col)
* expandtab (=oe, coe)
* eol of listchars (=oE, coE)
* number (=on, con)
* relativenumber (=or, cor)
* cursorline (=oc, coc)
* paste (=op, cop)
* spell (=os, cos)
* wrap (=ow, cow)
* quickfix (=oq, coq)
* location list (=oQ, coQ)
* scrolloff (=oz, coz)
* showcmd (=o;, co;)

## Installation

Use [vim + pathogen](http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen)

    cd ~/.vim
    git submodule add https://github.com/phongnh/vim-toggler bundle/vim-toggler

Use vim plugin manager

    " https://github.com/VundleVim/Vundle.vim
    Plugin 'phongnh/vim-toggler'
    :PluginInstall

    " https://github.com/junegunn/vim-plug
    Plug 'phongnh/vim-toggler'
    :PlugInstall

    " https://github.com/Shougo/neobundle.vim
    NeoBundle 'phongnh/vim-toggler'
    :NeoBundleInstall

## License

See `LICENSE.md`
