"source '~/.vim/ftplugin/py_jump.vim'
"source '~/.vim/ftplugin/python_fold.vim'

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=80
setlocal smarttab
setlocal expandtab
setlocal smartindent

" PLUGINS {
    " Execute the tests
    nmap <silent><Leader>tf <Esc>:Pytest file<CR>
    nmap <silent><Leader>tc <Esc>:Pytest class<CR>
    nmap <silent><Leader>tm <Esc>:Pytest method<CR>
    " cycle through test errors
    nmap <silent><Leader>tn <Esc>:Pytest next<CR>
    nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
    nmap <silent><Leader>te <Esc>:Pytest error<CR>
" }
