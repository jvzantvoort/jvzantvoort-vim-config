This is my config setup which works best for me.

# Description

The config is used to write `bash` and `python` on various sys

## Plugins

* [VundleVim/Vundle.vim](https://github.com/VundleVim/Vundle.vim.git)
* [MarcWeber/vim-addon-mw-utils](https://github.com/MarcWeber/vim-addon-mw-utils.git)
* [tomtom/tlib_vim](https://github.com/tomtom/tlib_vim.git)
* [garbas/vim-snipmate](https://github.com/garbas/vim-snipmate.git)
* [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree.git)
* [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
* [kien/ctrlp.vim](https://github.com/kien/ctrlp.vim)

### On 256 color terminals

* [vim-airline/vim-airline](https://github.com/vim-airline/vim-airline)
* [vim-airline/vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)

## colors

### on-board
* blackboard
* borland
* vividchalk
* diff

### Through plugins
* [solarized](https://github.com/altercation/vim-colors-solarized)
* [molokai](https://github.com/tomasr/molokai)


# Installation

To install the config simply move the old one away (just in case)

    % cd
    % mv .vim{,.org}
    % mv .vimrc{,.org}

Checkout the config

    % git clone https://github.com/jvzantvoort/jvzantvoort-vim-config.git .vim

Hard link the vimrc

    % ln .vim/main.vim .vimrc

## Install plugins

Use Vundle to download the plugins:

    % mkdir -p ~/.vim/bundle
    % cd ~/.vim/bundle
    % git clone https://github.com/VundleVim/Vundle.vim.git
    % vim +PluginInstall +qall

For the lazy:

    % cd ~/.vim
    % ./bootstrap.sh

