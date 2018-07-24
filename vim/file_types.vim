function! s:setupGHWrapping()
  set wrap
  set linebreak
  set textwidth=109
  set nolist
endfunction

" ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,Guardfile,config.ru,*.rake,*.rabl} set ft=ruby

" markdown
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown
au FileType markdown call s:setupGHWrapping()

" javscript
au BufNewFile,BufRead *.json set ft=javascript

" make Python follow PEP8 for whitespace (http://www.python.org/dev/peps/pep-0008/)
au FileType python setlocal softtabstop=4 tabstop=4 shiftwidth=4
