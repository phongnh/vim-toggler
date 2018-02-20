# vim-toggler

Toggle useful options:

* conceallevel (=ok)
* exchange gj and j, gk and k (=om)
* mouse (=oM)
* "unnamed" or "unnamedplus" clipboard (=oy)
* tabline (showtabline) (=ot)
* statusline (laststatus) (=oT)
* set tabstop, softtabstop and shiftwidth (=o2 -> 2, =o4 -> 4, and =o8 -> 8)
* set tabstop (=o@ -> 2, =o$ -> 4, and =o\* -> 8)
* background (=ob)
* diffthis (=od)
* folding (foldenable) (=of)
* hlsearch (=oh)
* ignorecase (=oi)
* list (=ol)
* expandtab (=oe)
* eol of listchars (=oE)
* number (=on)
* relativenumber (=or)
* cursorline (=oc)
* paste (=op)
* spell (=os)
* wrap (=ow)
* quickfix (=oq)
* location list (=oQ)
* scrolloff (=oz)
* showcmd (=o;)

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
