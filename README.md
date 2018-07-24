# Quick Start

To get it up and running, first pull it down into your $HOME:

```bash
$ git clone git@github.com:achiu/dotfiles.git .dotfiles
```

then you can simply:

```bash
$ script/bootstrap
```

To update, simply run:

```bash
$ script/update
```

# Configurations

* Fish shell
* Tmux
* Neovim
* chruby



## Fish

## Tmux

* Sets leader key to `ctrl + a`
* Sets default shell to fish
* Adds `tmux-powerline`
* configured `reattach-to-user-namespace` for copy-pasta in fish

| Command             | Description                      |
| ------              | -----------                      |
| `ctrl + ac`         | Open a new tmux 'window'         |
| `ctrl + a"`         | Open a new horizontal split pane |
| `ctrl + a%`         | Open a new vertical split pane   |
| `ctrl + aq + <num>` | Switch to a number pane.         |
| `ctrl + az`         | Fullscreen a current split/pane  |

## Neovim

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

| Command                          | Plugin                                                              | Description                                              |
| ------                           | ------                                                              | -----------                                              |
| `ctrl + p`                       | [Denite](https://github.com/Shougo/denite.nvim)                     | Shows all the files in the current directory             |
| `ctrl + b`                       | [Denite](https://github.com/Shougo/denite.nvim)                     | Shows all the  currently existing buffers                |
| `ctrl + /`                       | [Denite](https://github.com/Shougo/denite.nvim)                     | grep over the current director                           |
| `, + n`                          | [NERDTree](https://github.com/scrooloose/nerdtree)                  | Opens the file browser                                   |
| `, + rt`                         | [TagBar](https://github.com/majutsushi/tagbar)                      | Opens the ctags browser                                  |
| `, + /`                          | [NERDCommenter](https://github.com/scrooloose/nerdcommenter)        | Comment out the current or visually slected lines        |
| `, + gb                          | [Fugitive.vim](https://github.com/tpope/vim-fugitive)               | Show the gitblame for the current buffer                 |
| `, + al`                         | [Tabularize](https://github.com/godlygeek/tabular)                  | Align certain characters e.g `=>` `=`                    |
| `, + di`                         | [Dispatch](https://github.com/tpope/vim-dispatch)                   | Run specific command for the given project and file type |
| `, + ig`                         | [Indent Guides](https://github.com/nathanaelkane/vim-indent-guides) | Shows the indentation for the current buffer             |
| `<html element> + `ctrl + y + ,` | [Emmet](https://github.com/mattn/emmet-vim)                         | Generate the html tag for the given HTML shorthand       |

### Denite

##### ctrl + o

This switches you into `normal` mode in the panes. This allows you to move around the denite panes using vim motions and action on your selection.

### Dispatch

##### , + d + i

This runs a default set of commands on a certain file type like:

* ruby - `bundle exec ruby -I test <path>`
* rust - `cargo test`

#### Project Diretory Specific commands

Add a `.vimrc.local` to your project specific directory and execute `, + d + i`:

```.vimrc.local
" set a global dispatch
let b:dispatch = 'make'
" for ruby specific projects files in this directory
autocmd FileType ruby let b:dispatch = 'bundle exec rspec %'
```

#### Instance specific dispatch commands

Use `FocusDispatch`:

```vim
:FocusDispatch my/shell/command
```
