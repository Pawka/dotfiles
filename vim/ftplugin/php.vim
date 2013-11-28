
if match(expand("%:t"), "Test.php$") >= 0
    " If test file
    setlocal makeprg=phpunit\ -c\ app\ % 
else
    " If any other php file - check syntax
    setlocal makeprg=php\ -ql\ %
    setlocal errorformat=%E<b>%.%#Parse\ error</b>:\ %m\ in\ <b>%f</b>\ on\ line\ <b>%l</b><br\ />,
		    \%W<b>%.%#Notice</b>:\ %m\ in\ <b>%f</b>\ on\ line\ <b>%l</b><br\ />,
		    \%E%.%#Parse\ error:\ %m\ in\ %f\ on\ line\ %l,
		    \%W%.%#Notice:\ %m\ in\ %f\ on\ line\ %l,
		    \%-G%.%#
endif
