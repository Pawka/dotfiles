
" PHPunit support  {

    " Return test filename of provided file 
    fun! SymfonyGetTestFilename(file)
        let l:file = substitute(a:file, '^\s*\(.\{-}\)\s*$', '\1', '')

        " If file is not provided, take current file.
        if len(l:file) is 0
            let l:file = expand('%')
        endif

        " If the current file is a unit test.
        if l:file =~ "Test\.php$"
            let l:result = l:file
        else
            " If the current file is not a unit test.
            let l:result = substitute(l:file, '\([^/]\+Bundle\)/\(.\+\).php$', '\1/Tests/\2Test.php', '')
        endif

        return l:result
    endf

    " Open PHPUnit test file in vertical split.
    if !exists("*OpenPHPUnitTest")
        fun! OpenPHPUnitTest()
            let l:file = expand("%")
            let l:testFile = SymfonyGetTestFilename(expand("%"))

            if l:file != l:testFile
                exe "vsplit " . l:testFile
            endif
        endf

        command! TestFile call OpenPHPUnitTest()
    endif
    

    " PHPUnitQF support (joonty/vim-phpunitqf) {
    if exists(":Test")
        " Symfony phpunit configuration
        let g:phpunit_args = "-c app"

        " Let PHPUnitQf use the callback function
        let g:phpunit_callback = "SymfonyPHPTestCallback"

        fun! SymfonyPHPTestCallback(args)
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
                    let l:args = SymfonyGetTestFilename(l:file)
                endif
            endif
            return l:args
        endf
    endif
    " }
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

" Key bindings {
    map <buffer> <leader>po :TestOutput<CR>
    map <buffer> <leader>pf :TestFile<CR>
    map <buffer> <leader>pp :Test<CR>
" }
