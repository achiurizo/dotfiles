call plug#begin('~/.local/share/nvim/plugged')

Plug 'ayu-theme/ayu-vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'github/copilot.vim'
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/seoul256.vim'
Plug 'liuchengxu/vista.vim'
Plug 'mattn/emmet-vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'projekt0n/github-nvim-theme'
Plug 'rebelot/kanagawa.nvim'
Plug 'roosta/vim-srcery'
Plug 'sainnhe/everforest'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'

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
set clipboard=unnamedplus
set mouse=

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Whitespace

set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters

" Searching
set hlsearch    " highlight matches
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

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
"set t_Co=256       "xterm 256 color mode
"set termguicolors
"set background=dark
"set guioptions-=m  "remove menu bar
"set guioptions-=T  "remove toolbar
"set guioptions-=r  "remove right-hand scroll bar

set background=dark
colorscheme srcery

" highlight overrides
"hi Visual cterm=bold ctermfg=235 ctermbg=185 gui=bold guifg=wheat guibg=#60578f
"hi VisualNOS cterm=bold ctermfg=235 ctermbg=185 gui=bold guifg=wheat guibg=#60578f
"hi Search gui=bold guibg=gold guifg=black
"hi Pmenu guibg=black

" SWAP AND BACKUP

" Turn off all swaps and backups
set noswapfile
set nobackup
set nowritebackup
set noundofile

set foldenable
set foldmethod=syntax
set foldlevelstart=1

" NeoVim handles ESC keys as alt+key, set this to solve the problem
" https://github.com/neovim/neovim/issues/2017
set ttimeout
set ttimeoutlen=0

" Find merge conflits
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" remove trailing whitespaces
nmap <silent> <leader>tw <ESC>:%s/\s\+$//<CR>

" Adjust viewports to the same size
map <Leader>= <C-w>=

" Remove highlights
nmap <C-l> :noh<cr>

" logical Y, yank from current to end of line
map Y y$

" run . on visual block
vnoremap . :norm.<cr>

"""""""""""""""""""""
"" PLUGIN SETTINGS
"""""""""""""""""""""
if filereadable(expand("~/.config/nvim/plugins.vim"))
  source ~/.config/nvim/plugins.vim
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
