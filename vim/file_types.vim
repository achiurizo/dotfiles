function! s:setupWrapping()
  set wrap
  set linebreak
  set textwidth=72
  set nolist
endfunction

" ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,Guardfile,config.ru,*.rake,*.rabl} set ft=ruby

" markdown
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown
au FileType markdown call s:setupWrapping()

" javscript
au BufNewFile,BufRead *.json set ft=javascript

" coffeescript
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

" HTML
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=manual

" make Python follow PEP8 for whitespace (http://www.python.org/dev/peps/pep-0008/)
au FileType python setlocal softtabstop=4 tabstop=4 shiftwidth=4
