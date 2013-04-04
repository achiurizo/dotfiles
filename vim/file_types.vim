function! s:setupWrapping()
  set wrap
  set linebreak
  set textwidth=72
  set nolist
endfunction

au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,Guardfile,config.ru,*.rake} set ft=ruby
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown
au FileType markdown call s:setupWrapping()

au BufNewFile,BufRead *.json set ft=javascript

" make Python follow PEP8 for whitespace (http://www.python.org/dev/peps/pep-0008/)
au FileType python setlocal softtabstop=4 tabstop=4 shiftwidth=4
