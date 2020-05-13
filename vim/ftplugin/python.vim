setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=120
setlocal smarttab
setlocal expandtab
setlocal formatoptions=croqlt

" Make F5 and F6 run the current file
nmap <F5> :w <CR> :!clear; python % <CR>
nmap <F6> :w <CR> :!python %

" Remove trailing whitespace
autocmd BufWritePre *.py %s/\s\+$//e
