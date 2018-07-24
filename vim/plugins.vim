" VIM-INDENT-GUIDES
"
let g:indent_guides_color_change_percent = 40
let g:indent_guides_auto_colors = 1

" DENITE.NVIM
"
" ctrl+p
call denite#custom#var('file/rec', 'ag', ['--follow', '--nocolor', '--nogroup', '-g', ''])
nnoremap <C-p> :Denite file/rec<cr>
" ctrl+b
nnoremap <C-b> :Denite buffer<cr>
" ctrl+/ directory search
call denite#custom#var('grep', 'ag', ['--nogroup', '--nocolor', '-S'])
noremap <C-_> :Denite grep <cr>

" NERDCOMMENTER
"
" , + /
map <leader>/ <plug>NERDCommenterToggle<cr>

"" SYNTASTIC
""
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_auto_loc_list  = 1
let g:syntastic_ruby_exec      = 'which ruby'

" FUGITIVE.VIM
"
" , + gb
nmap <leader>gb :Gblame<cr>

" NERDTREE
"
" , + n
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o$', '\~$']
map <leader>n :NERDTreeToggle<cr>

" TAGBAR
"
" , + rt
map <Leader>rt :TagbarToggle<cr>

" DISPATCH
"
" , + di
let g:dispatch_quickfix_height = 20 " Set our pop up window height a bit larger. defaults to 10
autocmd FileType ruby   let b:dispatch = 'bundle exec ruby -I test %'
autocmd FileType rust   let b:dispatch = 'cargo test'
map <leader>di :update \| Dispatch<cr>

" AIRLINE/TMUXLINE
"
let g:airline_powerline_fonts = 1
let g:airline_theme           = 'tender'

" TABULAR
"
" , + al
nmap <leader>al :Tabularize /=>\\|=<cr>
vmap <leader>al :Tabularize /=>\\|=<cr>

" JAVASCRIPT
"
let g:javascript_enable_domhtmlcss = 1

" GO
"
let g:go_highlight_types     = 1
let g:go_highlight_methods   = 1
let g:go_highlight_fields    = 1
let g:go_highlight_operators = 1

" Markdown
"
let g:vim_markdown_folding_disabled = 1
