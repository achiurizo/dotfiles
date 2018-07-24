
# Daily Movements

## Tmux

### Leader

Leader has been assigned `<ctrl> + a`

#### <ctrl> + a + c

Open a new 'window'

#### <ctrl> + a + "

Open a new 'horizontal split'

#### <ctrl> + a + q

Switch to numbered pane. Current pane shows current #.


## Neovim

| Command                          | Plugin             | Description                                                  |
| ------                           | ------             | -----------                                                  |
| `ctrl + p`                       | [Denite]()         | [Shows all the files in the current directory]()             |
| `ctrl + b`                       | [Denite]()         | [Shows all the  currently existing buffers]()                |
| `ctrl + /`                       | [Denite]()         | [grep over the current director]()                           |
| `, + /`                          | [NERDCommenter])() | [Comment out the current or visually slected lines]()        |
| `, + gb                          | [Fugitive.vim]()   | [Show the gitblame for the current buffer]()                 |
| `, + al`                         | [Tabularize]()     | [Align certain characters e.g `=>` `=`[()                    |
| `, + di`                         | [Dispatch]()       | [Run specific command for the given project and file type]() |
| `, + ig`                         | [Indent Guides]()  | [Shows the indentation for the current buffer]()             |
| `<html element> + `ctrl + y + ,` | [Emmet]()          | [Generate the html tag for the given HTML shorthand]()       |

### Dispatch

##### , + d + i

This runs a default set of commands on a certain file type like:

* ruby - `bundle exec ruby -I test <path>`
* rust - `cargo test`

#### Custom commands

Add a `.vimrc.local` to your project specific directory and execute `, + d + i`:

```.vimrc.local
" set a global dispatch
let b:dispatch = 'make'
" for ruby specific projects files in this directory
autocmd FileType ruby let b:dispatch = 'bundle exec rspec %'
```




Runs the currently



#####

## Setup ##

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

#### Plugin Mappings

#### emmet

Maps `<C-y>,` to generate HTML tags

##### nerdcommenter

Maps `<leader>/` to comment out lines

##### nerdtree

Maps `<leader>n` to open NERDTree

##### tabular

maps `<leader>al` to align `=>` and/or `=`

##### tagbar

Maps `<leader>rt` to open TagBar

##### vim-dispatch

maps `<leader>di` to save the current buffer and run `bundle exec ruby -I test` on it

##### vim-fugitive

maps `<leader>gb` to Gblame
maps `<leader>gs` to Gstatus
maps `<leader>gd` to Gdiff
maps `<leader>gl` to Glog
maps `<leader>gc` to Gcommit
maps `<leader>gp` to Git push

##### vim-indent-guides

Maps `<leader>ig` to enable indent guides

##### ZoomWin

Maps `<leader>zw` to ZoomWin
