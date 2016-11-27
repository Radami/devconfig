execute pathogen#infect()
syntax on
filetype plugin indent on

"80 chars limit
highlight OverLength ctermbg=lightcyan ctermfg=darkblue guibg=#307D7E
match OverLength /\%80v/

" Set up tabbing - also use normal tabs in mk files
set et
set cin
set bs=indent,eol,start
set sw=4  "this is the level of autoindent, adjust to taste
set expandtab
set tabstop=4
au BufNewFile,BufRead Makefile setlocal noet
au BufNewFile,BufRead *.mk     setlocal noet
au BufNewFile,BufRead *.gob    setlocal syntax=cpp shiftwidth=4 tabstop=4
au BufNewFile,BufRead *.gobxml setlocal syntax=xml
au BufNewFile,BufRead *.cpp    setlocal syntax=cpp shiftwidth=4 tabstop=4
au BufNewFile,BufRead *.h      setlocal syntax=cpp shiftwidth=4 tabstop=4
au BufNewFile,BufRead *.xml    setlocal syntax=xml shiftwidth=2 tabstop=2
au BufNewFile,BufRead *.html   setlocal syntax=html shiftwidth=2 tabstop=2
au BufNewFile,BufRead *.xsd    setlocal syntax=xsd shiftwidth=2 tabstop=2

" Autoformat for cleaner code
autocmd BufWritePre * :%s/\s\+$//e
