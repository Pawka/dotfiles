
" PHPunit support (joonty/vim-phpunitqf) {
if exists("g:phpunit_cmd")
    " Symfony phpunit configuration
    let g:phpunit_args = "-c app"

    " Let PHPUnitQf use the callback function
    let g:phpunit_callback = "SymfonyPHPTestCallback"

    function! SymfonyPHPTestCallback(args)
        " Trim white space
        let l:args = substitute(a:args, '^\s*\(.\{-}\)\s*$', '\1', '')

        " If no arguments are passed to :Test
        if len(l:args) is 0
            let l:file = expand('%')
            if l:file =~ "Test\.php$"
                " If the current file is a unit test
                let l:args = l:file
            else
                " Otherwise try and run the test for this file
                let l:args = substitute(l:file, 'Bundle/\([^/]\+\)\(.\+\).php$', 'Bundle/\1/Tests\2Test.php', '')
                echo l:args
            endif
        endif
        return l:args
    endfunction
endif
" }

if match(expand("%:t"), "Test.php$") >= 0
    " If test file
    setlocal makeprg=phpunit\ -c\ app\ % 
else
    " If any other php file - check syntax
    setlocal makeprg=php\ -ql\ %
    setlocal errorformat=%m\ in\ %f\ on\ line\ %l,
            \%E<b>%.%#Parse\ error</b>:\ %m\ in\ <b>%f</b>\ on\ line\ <b>%l</b><br\ />,
		    \%W<b>%.%#Notice</b>:\ %m\ in\ <b>%f</b>\ on\ line\ <b>%l</b><br\ />,
		    \%E%.%#Parse\ error:\ %m\ in\ %f\ on\ line\ %l,
		    \%W%.%#Notice:\ %m\ in\ %f\ on\ line\ %l,
		    \%-G%.%#
endif
