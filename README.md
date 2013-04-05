# achiu's dotfiles #

This a collection of dotfiles I use for my day to day use. Mainly its a
collection of dotfiles as well as configuration and setup I've borrowed
from other's dotfiles to make my own custom setup. I've ported this over
to use [holman's topical organization and
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
* syntax is enabled
* encoding defaults to utf-8
* don't wrap lines
* expands tabs and sets them to two spaces
* show 'invisible' characters
* no swap, no backup, no undofile
* ignores output files like swp, .class, .rbc and much more

#### Plugins

##### ack.vim

This defaults to use [ag]() instead.

##### ctrlp.vim
##### jellybeans.vim
##### nerdcommenter

Maps `<leader>/` to comment out lines

##### nerdtree

Maps `<leader>n` to open NERDTree

##### snipmate-snippets
##### supertab
##### syntastic
##### tabular
##### tagbar

Maps `<leader>rt` to open TagBar

##### tlib_vim
##### vim-addon-mw-utils
##### vim-coffee-script
##### vim-copy-as-rtf
##### vim-dispatch
##### vim-fugitive

maps `<leader>gb` to Gblame
maps `<leader>gs` to Gstatus
maps `<leader>gd` to Gdiff
maps `<leader>gl` to Glog
maps `<leader>gc` to Gcommit
maps `<leader>gp` to Git push

##### vim-haml
##### vim-indent-guides

Maps `<leader>ig` to enable indent guides

##### vim-markdown
##### vim-powerline
##### vim-ruby-minitest
##### vim-sensible
##### vim-slim
##### vim-snipmate
##### ZoomWin

Maps `<leader>zw` to ZoomWin
