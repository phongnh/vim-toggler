# vim-toggler

Toggle useful options:

* set softtabstop and shiftwidth (`yo2` -> 2, `yo4` -> 4, and `yo8` -> 8)
* set tabstop, softtabstop and shiftwidth (`yo@` -> 2, `yo$` -> 4, and `yo*` -> 8)
* enable/disable gt/gT to cycle buffers when VIM has only one tabpage (`yoB`, `yoG`)
* exchange gj and j, gk and k (`yom`)
* "unnamed" or "unnamedplus" clipboard (`yoy`)
* tabline (showtabline) (`yot`)
* statusline (laststatus) (`yoT`)
* conceallevel (`yoC`)
* showmatch (`yoM`)
* incsearch (`yoI` / `yoS`)
* expandtab (`yoe`)
* eol of listchars (`yoE`)
* scrolloff (`yoz`)
* showcmd (`yo;`)
* foldmethod(`yof`)

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
