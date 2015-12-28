# vim-toggler

Toggle useful options:

* conceallevel (coa)
* exchange gj and j, gk and k (com)
* mouse (coM)
* "unnamed" or "unnamedplus" clipboard (coy)
* tabline (showtabline) (cot)
* statusline (laststatus) (coT)
* set tabstop, softtabstop and shiftwidth (co2 -> 2, co4 -> 4, and co8 -> 8)
* set tabstop (co@ -> 2, co$ -> 4, and co\* -> 8)
* background (cob)
* diffthis (cod)
* folding (foldenable) (cof)
* hlsearch (coh)
* ignorecase (coi)
* list (col)
* expandtab (coe)
* eol of listchars (coE)
* number (con)
* relativenumber (cor)
* cursorline (coc)
* spell (cos)
* wrap (cow)
* quickfix (coq)
* location list (coQ)
* scrolloff (coz)
* showcmd (co;)
* enter insert mode with paste (yo / yO) (it is copied from vim-unimpaired)

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
