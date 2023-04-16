The layout of the configuration stays as close to the regular vim
configuration layout as I can figure out for now.

## colors

The colors directory has the colorschemes I like that are not a part
of regular vim colors. If possible (and I'm not too lazy) plugins
are used for this. One exception if the `diff.vim` it contains some
minor tweaks w.r.t. `vimdiff`.

## compiler

Adds a `pylint` compiler for python

## docs

Sources for the [github page](http://jvzantvoort.github.io/jvzantvoort-vim-config/).

## ftdetect

Detection lines for:

* asciidoc
* md (markdown)
* perl (why do I still have this?)
* plantuml
* rst, I use `*.irst` files to break up large `*.rst` files. So the `*.irst` match is added.

## plugin

Additional routines, configs and functions.

### `000notes.vim` 

Adds the function `TakeNote`, a quick & easy way to open a scratch
pad relative to the git project root or homedir. Useful when
collecting notes like review comments that don't need to make it
into the archives themselves.

### `001plugins.vim`

provides config settings for `NERDTree`
## `Darwin.vim`

Detect if Mac OS and applies the settings accordingly. Adds a
mapping `gz` that puts the editor fullscreen.

### `Windows.vim`

Detect if Windows and applies the settings accordingly. 

* `<ctrl>+F2` toggles the menubar
* menu has entry for `TakeNote` function

### `colors.vim`

Apply `molokai` color scheme by default (installed through plugin)
but switches to `pablo` if the file is read-only.

### `conway.vim`

Some settings learned from [Damian Conway's presentation](https://www.youtube.com/watch?v=aHm36-na4-4).

### `encrypted.vim`

Allow gpg encrypted files to be edited (sorta).

### `fixdel.vim`

Fix some annoying issues with delete is some consoles.

### `gui.vim`

Some tweaks on vim's gui. Mainly the annoying local languages crap.

### `keybindings.vim`

[Local keybindings](http://jvzantvoort.github.io/jvzantvoort-vim-config/keybindings.html)

### `statusline.vim`

A non fuss status line. I tried airline but getting it to work in my
particular setup is/was a pain.

## `snippets`

[Overview of the snippets](http://jvzantvoort.github.io/jvzantvoort-vim-config/snippets.html)

## `syntax`

The `syntax` directory has the syntax definition I like that are not
a part of regular vim colors. If possible (and I'm not too lazy)
plugins are used for this.

