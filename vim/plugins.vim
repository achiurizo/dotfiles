" VIM-INDENT-GUIDES
"
let g:indent_guides_color_change_percent = 40
let g:indent_guides_auto_colors = 1

" DENITE.NVIM
"


" Denite 2.0+ requires that we manually specify our actions in the denite
" buffer
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
endfunction

" ctrl + p
call denite#custom#var('file/rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
nnoremap <C-p> :Denite file/rec<CR>

" ctrl + b
nnoremap <C-b> :Denite buffer<CR>

" ctrl + / directory search
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
noremap <C-bslash> :Denite grep<CR>

" NERDCOMMENTER
"
" , + /
map <leader>/ <plug>NERDCommenterToggle<cr>

" SYNTASTIC
"
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
nmap <leader>al :Tabularize /=>\\|=<CR>
vmap <leader>al :Tabularize /=>\\|=<CR>

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

" Typora integration
if has('mac')

  function! Typora()
      " Launch Typora
      call system("open -a Typora \"" . expand("%") . "\"")
      setlocal autoread
  endfunction

  command! Typora call Typora()

endif
