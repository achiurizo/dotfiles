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


