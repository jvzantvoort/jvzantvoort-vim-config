John van Zantvoort's vim config.

This is my config setup which works best for me.

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

[github page](http://jvzantvoort.github.io/jvzantvoort-vim-config/)
