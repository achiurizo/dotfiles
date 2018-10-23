call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'sunaku/vim-ruby-minitest',  { 'for': 'ruby' }
Plug 'tpope/vim-dispatch'
Plug 'plasticboy/vim-markdown'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'ervandew/supertab'
Plug 'majutsushi/tagbar'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-cucumber', { 'for': 'cucumber' }
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'vim-ruby/vim-ruby',  { 'for': 'ruby' }
Plug 'pangloss/vim-javascript',  { 'for': 'javscript' }
Plug 'rust-lang/rust',  { 'for': 'rust' }
Plug 'roosta/vim-srcery'
Plug 'rakr/vim-two-firewatch'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'vim-airline/vim-airline-themes'
Plug 'jacoborus/tender'
Plug 'jparise/vim-graphql', { 'for': 'graphql' }
Plug 'challenger-deep-theme/vim'
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'git@github.com:Shougo/denite.nvim.git'
Plug 'tomlion/vim-solidity', { 'for': 'solidity' }
Plug 'sirver/ultisnips'
Plug 'epilande/vim-react-snippets'
Plug 'leafgarland/typescript-vim'

call plug#end()

runtime! plugin/sensible.vim " run sensible first so we can override some of its settings.

""""""""""""""""""""
" GENERAL SETTINGS
""""""""""""""""""""
let mapleader=","     " Set my leader key to ','
set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
syntax enable         " Turn on syntax highlighting allowing local overrides
set encoding=utf-8    " Set default encoding to UTF-8
set shell=sh
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
set termguicolors
set background=dark
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar

colorscheme two-firewatch

" highlight overrides
hi Visual cterm=bold ctermfg=235 ctermbg=185 gui=bold guifg=wheat guibg=pink
hi VisualNOS cterm=bold ctermfg=235 ctermbg=185 gui=bold guifg=wheat guibg=pink
hi Search gui=bold guibg=pink guifg=wheat

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

set foldenable
set foldmethod=manual

if has('nvim')
  " NeoVim handles ESC keys as alt+key, set this to solve the problem
  " https://github.com/neovim/neovim/issues/2017
   set ttimeout
   set ttimeoutlen=0
endif

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
