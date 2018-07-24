" VIM-INDENT-GUIDES
"
let g:indent_guides_color_change_percent = 40
let g:indent_guides_auto_colors = 1
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=red
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=green


" DENITE.NVIM
"
" ctrl+p
call denite#custom#var('file/rec', 'ag', ['--follow', '--nocolor', '--nogroup', '-g', ''])
nnoremap <C-p> :Denite file/rec<CR>
" ctrl+b
nnoremap <C-b> :Denite buffer<CR>

" ctrl+/ directory search
call denite#custom#var('grep', 'ag', ['--nogroup', '--nocolor', '-S'])
noremap <C-_> :Denite grep <CR>

"nnoremap <C-p> :Unite -toggle -profile-name=searcher -buffer-name=search file_rec/neovim<CR>
"nnoremap <C-b> :Unite -toggle -buffer-name=buffer buffer<CR>
"nnoremap <C-_> :Unite -toggle grep:. -buffer-name=grep-pwd<CR>
"nnoremap <C-\> :Unite -toggle grep -buffer-name=grep-buffer<CR>

"let g:denite_data_directory             = '~/tmp/denite-cache'
"let g:denite_source_grep_max_candidates = 200
"let g:denite_redraw_hold_candidates     = 50000
"let g:denite_source_rec_max_cache_files = 50000

"" grep
"let g:denite_source_grep_command       = 'ag'
"let g:denite_source_grep_default_opts  = '--nogroup --nocolor -S'
"let g:denite_source_grep_recursive_opt = ''
"" file_rec
"let g:denite_source_file_rec_max_cache_files = 0
"let g:denite_source_rec_async_command        = ['ag', '--follow', '--nocolor', '--nogroup', '-i', '-g', '.']


" NERDCOMMENTER
"
map <leader>/ <plug>NERDCommenterToggle<CR>

"" SYNTASTIC
""
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_auto_loc_list  = 1
let g:syntastic_ruby_exec      = 'which ruby'

"" FUGITIVE.VIM"
""
nmap <leader>gb :Gblame<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Git push<CR>

"" NERDTREE
""
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o$', '\~$']
map <leader>n :NERDTreeToggle<CR>

"" TAGBAR
""
map <Leader>rt :TagbarToggle<CR>

"" DISPATCH
""
let g:dispatch_quickfix_height = 20 " Set our pop up window height a bit larger. defaults to 10
autocmd FileType ruby   let b:dispatch = 'bundle exec ruby -I test %'
autocmd FileType rust   let b:dispatch = 'cargo test'
map <leader>di :update \| Dispatch<CR>

"" AIRLINE/TMUXLINE
""
""let g:tmuxline_powerline_separators = 0
let g:airline_powerline_fonts = 1
let g:airline_theme           = 'zenburn'

"" TABULAR
""
nmap <leader>al :Tabularize /=>\\|=<CR>
vmap <leader>al :Tabularize /=>\\|=<CR>

"" JAVASCRIPT
""
let g:javascript_enable_domhtmlcss = 1

"" GO
""
let g:go_highlight_types     = 1
let g:go_highlight_methods   = 1
let g:go_highlight_fields    = 1
let g:go_highlight_operators = 1

"" Markdown
""
let g:vim_markdown_folding_disabled = 1
