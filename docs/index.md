
![vim logo goes here](vim_small.gif "Viva la vim") This is the config I use to write `bash` and `python` scripts on various
platforms. Because I work with a mix of environments (RedHat, Mac,
Windows) using the GUI and console variants using a number of
terminal solutions (Putty, Terminal, gnome-terminal, tmux, etc.)
some of the solutions are fairly conservative.
[Vim-airline](https://github.com/vim-airline/vim-airline) looks
great on MacVim but like confusing modem noise on another terminal
solution.

The main configuration:
* attempts to read and then loads the [`~/.vim/plugins.vim`](https://github.com/jvzantvoort/jvzantvoort-vim-config/blob/master/plugins.vim) file.
* attempts to read and then loads the [`~/.vim/local.vim`](https://github.com/jvzantvoort/jvzantvoort-vim-config/blob/master/local.vim.example) file.
* sets a list of (to my mind) reasonable defaults.
* Plugins are listed [here](https://github.com/jvzantvoort/jvzantvoort-vim-config/wiki/External-Plugins).
* http://jvzantvoort.github.io/jvzantvoort-vim-config/externalplugins.html
* The rest of the configuration is described [here](https://github.com/jvzantvoort/jvzantvoort-vim-config/wiki/Layout).

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

# Get the gui fonts to work

```

git clone https://github.com/powerline/fonts.git --depth=1

cd fonts/

./install.sh
```
