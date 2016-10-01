" VIM-INDENT-GUIDES
"
let g:indent_guides_color_change_percent = 30
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey

" UNITE.VIM
call unite#custom#profile('searcher', 'context', {
      \ 'start_insert' : 1,
      \ 'update_time'  : 1,
      \ 'filters'      : 'sorter_rank'
      \})
call unite#custom#source('file_rec/async,file_rec/git,file_rec/neovim', 'ignore_globs', [])
call unite#custom#source('file_rec,file_rec/async,file_rec/git,file_rec/neovim', 'max_candidates', 1000)

nnoremap <C-p> :Unite -toggle -profile-name=searcher -buffer-name=search file_rec/neovim<CR>
nnoremap <C-b> :Unite -toggle -buffer-name=buffer buffer<CR>
nnoremap <C-_> :Unite -toggle grep:. -buffer-name=grep-pwd<CR>
nnoremap <C-\> :Unite -toggle grep -buffer-name=grep-buffer<CR>

let g:unite_data_directory             = '~/tmp/unite-cache'
let g:unite_source_grep_max_candidates = 200
let g:unite_redraw_hold_candidates     = 50000
let g:unite_source_rec_max_cache_files = 50000

" grep
let g:unite_source_grep_command       = 'ag'
let g:unite_source_grep_default_opts  = '--nogroup --nocolor -S'
let g:unite_source_grep_recursive_opt = ''
" file_rec
let g:unite_source_file_rec_max_cache_files = 0
let g:unite_source_rec_async_command        = ['ag', '--follow', '--nocolor', '--nogroup', '-i', '-g', '.']



" NERDCOMMENTER
"
map <leader>/ <plug>NERDCommenterToggle<CR>

" SYNTASTIC
"
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_auto_loc_list  = 1
let g:syntastic_ruby_exec      = 'which ruby'

" FUGITIVE.VIM"
"
nmap <leader>gb :Gblame<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Git push<CR>

" NERDTREE
"
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o$', '\~$']
map <leader>n :NERDTreeToggle<CR>

" ZOOMWIN
"
map <leader>zw :ZoomWin<CR>

" TAGBAR
"
map <Leader>rt :TagbarToggle<CR>

" DISPATCH
"
autocmd FileType ruby   let b:dispatch = 'bundle exec ruby -I test %'
autocmd FileType coffee let b:dispatch = 'coffee %'
map <leader>di :update \| Dispatch<CR>

" AIRLINE/TMUXLINE
"
"let g:tmuxline_powerline_separators = 0
let g:airline_powerline_fonts = 1
let g:airline_theme='twofirewatch'

" TABULAR
"
nmap <leader>al :Tabularize /=>\\|=<CR>
vmap <leader>al :Tabularize /=>\\|=<CR>

" JAVASCRIPT
"
let g:javascript_enable_domhtmlcss = 1
