
![vim logo goes here](vim_small.gif "Viva la vim")


This is my config setup which works best for me.

# Description

This is the config I use to write `bash` and `python` scripts on various
platforms. Because I work with a mix of environments (RedHat, Mac,
Windows) using the GUI and console variants using a number of
terminal solutions (Putty, Terminal, gnome-terminal, tmux, etc.)
some of the solutions are fairly conservative.
[Vim-airline](https://github.com/vim-airline/vim-airline) looks
great on MacVim but like confusing modem noise on another terminal
solution.

## Plugins

| Plugin                                                                              | Description                                                                      |
|:------------------------------------------------------------------------------------|:---------------------------------------------------------------------------------|
| [VundleVim/Vundle.vim](https://github.com/VundleVim/Vundle.vim.git)                 | Vundle, the plug-in manager for Vim                                              |
| [MarcWeber/vim-addon-mw-utils](https://github.com/MarcWeber/vim-addon-mw-utils.git) | vim: interpret a file by function and cache file automatically                   |
| [tomtom/tlib_vim](https://github.com/tomtom/tlib_vim.git)                           | Some utility functions for VIM                                                   |
| [garbas/vim-snipmate](https://github.com/garbas/vim-snipmate.git)                   | A concise vim script that implements some of TextMates snippets features in Vim. |
| [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree.git)                   | A tree explorer plugin for vim.                                                  |
| [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)                         | fugitive.vim: a Git wrapper so awesome, it should be illegal                     |
| [kien/ctrlp.vim](https://github.com/kien/ctrlp.vim)                                 | Fuzzy file, buffer, mru, tag, etc finder.                                        |

### On 256 color terminals

| Plugin                                                                              | Description                                                                      |
|:------------------------------------------------------------------------------------|:---------------------------------------------------------------------------------|
| [vim-airline/vim-airline](https://github.com/vim-airline/vim-airline)               | lean & mean status/tabline for vim thats light as air                            |
| [vim-airline/vim-airline-themes](https://github.com/vim-airline/vim-airline-themes) | This is the official theme repository for vim-airline                            |

## colors

### on-board

* blackboard
* borland
* vividchalk
* diff

### Through plugins

* [solarized](https://github.com/altercation/vim-colors-solarized)
* [molokai](https://github.com/tomasr/molokai)

## Keybinding

| Key          | action                     |
|--------------|----------------------------|
| `<C-J>`      | move down in split screens |
| `<C-K>`      | move up in split screens   |
| `<leader>et` | Edit in a new tab          |
| `<leader>n`  | Next tab                   |
| `<leader>p`  | Previouse tab              |
| `<leader>t`  | Take a note                |
| `<leader>o`  | Toggle NERDTree            |

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

```git clone https://github.com/powerline/fonts.git --depth=1
cd fonts/
./install.sh```
