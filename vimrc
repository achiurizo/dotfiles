" PATHOGEN
"
execute pathogen#infect()
" Helptags " Generate the help docs

runtime! plugin/sensible.vim " run sensible first so we can override some of its settings.

""""""""""""""""""""
" GENERAL SETTINGS
""""""""""""""""""""
let mapleader=","     " Set my leader key to ','
set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
syntax enable         " Turn on syntax highlighting allowing local overrides
set encoding=utf-8    " Set default encoding to UTF-8
set shell=zsh
set clipboard^=unnamed
" Whitespace

set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters

" listchars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen

" Searching
set hlsearch    " highlight matches
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter
set noic        " case sensitive search

" Wild Settings
" TODO: Investigate the precise meaning of these settings
" set wildmode=list:longest,list:full

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

" GUI/LOOK OPTIONS
"
set t_Co=256       "xterm 256 color mode
color hybrid
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar

" SWAP AND BACKUP
"
" Store temporary files in a central spot
"set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
"set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Turn off all swaps and backups
set noswapfile
set nobackup
set nowritebackup
set noundofile

" Auto-Folding
set foldenable
set foldmethod=syntax
set foldlevelstart=99 " open all folds by default

"""""""""""""""""""""
"" MAPPINGS
"""""""""""""""""""""
if filereadable(expand("~/.vim/mappings.vim"))
  source ~/.vim/mappings.vim
endif

"""""""""""""""""""""
"" PLUGIN SETTINGS
"""""""""""""""""""""
if filereadable(expand("~/.vim/plugins.vim"))
  source ~/.vim/plugins.vim
endif

"""""""""""""""""""""
"" FILE TYPE SETTINGS
"""""""""""""""""""""
if filereadable(expand("~/.vim/file_types.vim"))
  source ~/.vim/file_types.vim
endif

"""""""""""""""""""""
"" LOCAL VIM SETTINGS
"""""""""""""""""""""
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

"""""""""""""""""""""
"" PROJECT VIM SETTINGS
"""""""""""""""""""""
if filereadable(expand(".vimrc.local"))
  source .vimrc.local
endif

