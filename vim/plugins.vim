" VIM-INDENT-GUIDES
"
let g:indent_guides_color_change_percent = 30
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey

" UNITE.VIM
"call unite#custom#source('file_rec,file_rec/async', 'max_candidates', 1000)
"call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#custom#profile('ignorecase', 'ignorecase', 1)
"call unite#filters#sorter_default#use(['sorter_rank'])
nnoremap <C-p> :Unite -toggle -start-insert -profile-name=ignorecase -buffer-name=search file_rec/async<CR>
nnoremap <C-b> :Unite -toggle -buffer-name=buffer buffer<CR>
nnoremap <C-_> :Unite -toggle grep:.<CR>
nnoremap <C-\> :Unite -toggle grep<CR>

let g:unite_data_directory='~/tmp/unite-cache'

" grep
let g:unite_source_grep_command             = 'ag'
let g:unite_source_grep_default_opts        = '--nocolor --nogroup -S -C4'
let g:unite_source_grep_recursive_opt       = ''
" file_rec
let g:unite_source_file_rec_max_cache_files = 0
let g:unite_source_rec_async_command        = 'ag --nocolor --nogroup -i -l -g ""'

" NERDCOMMENTER
"
map <leader>/ <plug>NERDCommenterToggle<CR>

" SYNTASTIC
"
let g:syntastic_enable_signs   = 1
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_auto_loc_list  = 2

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
autocmd FileType ruby let b:dispatch = 'bundle exec ruby -I test %'
map <leader>di :update \| Dispatch<CR>

" AIRLINE/TMUXLINE
" 
"let g:tmuxline_powerline_separators = 0
let g:airline_powerline_fonts = 1

" TABULAR
"
nmap <leader>al :Tabularize /=>\\|=<CR>
vmap <leader>al :Tabularize /=>\\|=<CR>
