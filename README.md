# achiu's dotfiles #

This a collection of dotfiles I use for my day to day use. Mainly its a
collection of dotfiles as well as configuration and setup I've borrowed
from other's dotfiles to make my own custom setup. I've ported this over
to use [holman's organization and
bootstrap](https://github.com/holman/dotfiles) and have taken bits from
[janus](github.com/carlhuda/janus) that I liked. 

## Setup ##

To get it up and running, you can simply:

```bash
$ script/bootstrap
```

Then, you'll need to load the vim submodules:

```bash
$ git submodule init
$ git submodule update
```

## Configurations


### Vim

This setups vim to use
[vim-sensible](https://github.com/tpope/vim-sensible) as a base with a
few exceptions:

* sets leader key to ','
* sets to `nocompatible `
* shows line numbers
* shows the ruler
* syntax is enabled
* encoding defaults to utf-8
* don't wrap lines
* expands tabs and sets them to two spaces
* show 'invisible' characters
* no swap, no backup, no undofile
* ignores output files like swp, .class, .rbc and much more

#### Plugins

##### ack.vim
##### ctrlp.vim
##### jellybeans.vim
##### nerdcommenter
##### nerdtree
##### snipmate-snippets
##### supertab
##### syntastic
##### tabular
##### tagbar
##### tlib_vim
##### vim-addon-mw-utils
##### vim-coffee-script
##### vim-copy-as-rtf
##### vim-dispatch
##### vim-fugitive
##### vim-haml
##### vim-indent-guides
##### vim-markdown
##### vim-powerline
##### vim-ruby-minitest
##### vim-sensible
##### vim-slim
##### vim-snipmate
##### ZoomWin
