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

## Install pathogen and snipMate (optional)

    % mkdir -p ~/.vim/autoload ~/.vim/bundle; \
    % curl -Sso ~/.vim/autoload/pathogen.vim \
        https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

    % cd ~/.vim/bundle
    % git clone https://github.com/tomtom/tlib_vim.git
    % git clone https://github.com/MarcWeber/vim-addon-mw-utils.git
    % git clone https://github.com/garbas/vim-snipmate.git

