" Find merge conflits
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" remove trailing whitespaces
nmap <silent> <leader>tw <ESC>:%s/\s\+$//<CR>

" Adjust viewports to the same size
map <Leader>= <C-w>=

" Remove highlights
nmap <C-l> :set nohlsearch<cr>

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
nmap <C-k> [e
nmap <C-j> ]e

" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
vmap <C-k> [egv
vmap <C-j> ]egv

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" logical Y, yank from current to end of line
map Y y$

" run . on visual block
vnoremap . :norm.<cr>
