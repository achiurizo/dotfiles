" ACK.VIM
"
let g:ackprg = 'ag --nogroup --nocolor --column' " Use ag instead

" VIM-INDENT-GUIDES
"
let g:indent_guides_color_change_percent = 30
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey

" CTRLP.VIM
"
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
  \ }

" use silver searcher for ctrlp
"let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" NERDCOMMENTER
"
map <leader>/ <plug>NERDCommenterToggle<CR>

" SYNTASTIC
"
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=0
let g:syntastic_auto_loc_list=2

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
let g:tmuxline_powerline_separators = 0
let g:airline_powerline_fonts = 1
