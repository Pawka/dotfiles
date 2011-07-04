set nocompatible    " no compatible
if has("syntax")
  syntax on
endif

set novisualbell
"Backup files
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/swap

"TAB simbolių kiekis
set autoindent
set smartindent
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set textwidth=0

"Encoding
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,latin1

"Search
set hlsearch
set incsearch
set ignorecase
set cursorline

"Etc
set tags=./tags,./../tags,./../../tags,tags,$VIM/tags,$VIM/phptags

" Do not wrap lines automatically
set nowrap
" Show cursor position
set ruler

set mouse=a
set nocp
set vb t_vb=
set exrc
set number
set numberwidth=8

"Colors
if has("gui_running")
    colors wombat 
    set guioptions-=T
    set guifont=Monospace\ 9
else
    set t_Co=256
    colors zen
endif

" Copy to clipboard
"vmap <INSERT> o!xclip -f -sel clip<CR>
" Paste to clipboard
"nmap <INSERT> or!xclip -o -sel clip<CR>

"PHP
" The completion dictionary is provided by Rasmus:
" http://lerdorf.com/funclist.txt
" set dictionary-=~/.vim/dictionaries/phpfunclist dictionary+=~/.vim/dictionaries/phpfunclist
" Use the dictionary completion. Use CTRL+N or CTRL+P while in INSERT mode to call completion.
" set complete-=k complete+=k

"
" PHP
"
"Map <CTRL>-B to run PHP parser check
" map <C-B> :w !php -l<CR>
":autocmd FileType php noremap <C-L> :!/usr/bin/php -l %<CR>
":autocmd FileType php noremap <C-M> :w!<CR>:!/usr/bin/php %<CR>

" highlights interpolated variables in sql strings and does sql-syntax highlighting. yay
autocmd FileType php let php_sql_query=1
" does exactly that. highlights html inside of php strings
autocmd FileType php let php_htmlInStrings=1
" discourages use oh short tags. c'mon its deprecated remember
autocmd FileType php let php_noShortTags=0
" automagically folds functions & methods. this is getting IDE-like isn't it?
autocmd FileType php let php_folding=0

" set auto-highlighting of matching brackets for php only
autocmd FileType php DoMatchParen
autocmd FileType php hi MatchParen ctermbg=blue guibg=lightblue

" Twid uses same templates style as Django
autocmd BufRead,BufNewFile *.twig set filetype=htmldjango.html

"
" DJANGO + PYTHON
"
autocmd FileType python set ft=python.django " For SnipMate
autocmd FileType html set ft=htmldjango.html " For SnipMate
autocmd FileType htm set ft=htmldjango.html " For SnipMate


" autocomplete funcs and identifiers for languages
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP


filetype on
filetype plugin on
" Repair wired terminal/vim settings
set backspace=indent,start,eol

"Mappings
cmap w!! %!gksudo tee > /dev/null %
map <F5> <Esc>:EnableFastPHPFolds<Cr> 
map <F6> <Esc>:EnablePHPFolds<Cr> 
map <F7> <Esc>:DisablePHPFolds<Cr>
"
" Autocomplete
"
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
" inoremap { <c-r>=OpenBracket()<CR>
" inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

if !exists("*ClosePair")
    function ClosePair(char)
      if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
      else
        return a:char
      endif
    endf
endif

if !exists("*OpenBracket")
    function OpenBracket()
      if len(getline('.')) == col('.') - 1
        return "{}\<ESC>i"
      else
        return "{}\<ESC>i"
      endif
    endf
endif
if !exists("*CloseBracket")
    function CloseBracket()
      if len(getline('.')) == col('.') - 1
        return "}\<ESC>k$"
      else
        return "}"
      endif
    endf
endif

if !exists("*QuoteDelim")
    function QuoteDelim(char)
      let line = getline('.')
      let col = col('.')
      if line[col - 2] == "\\"
        "Inserting a quoted quotation mark into the string
        return a:char
      elseif line[col - 1] == a:char
        "Escaping out of the string
        return "\<Right>"
      else
        "Starting a string
        return a:char.a:char."\<ESC>i"
      endif
    endf
endif



"
" PLUGINS
"

"Taglist plugin
let Tlist_Ctags_Cmd = "/usr/bin/ctags-exuberant"
let Tlist_Inc_Winwidth = 1
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Process_File_Always = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_php_settings = 'php;c:class;d:constant;f:function'
let Tlist_Sort_Type = "name"
nnoremap <silent> <F8> :TlistToggle<CR>

"PHP Documentor
source ~/.vim/ftplugin/php-doc.vim 
inoremap <C-C> <ESC>:call PhpDocSingle()<CR>i 
nnoremap <C-C> :call PhpDocSingle()<CR> 
vnoremap <C-C> :call PhpDocRange()<CR>

"ZenCoding
let g:user_zen_expandabbr_key = '<c-e>'

" MRU
" let MRU_File = "/home/pawka/.vim/swap/mru" "Must be full path!

"FuzzyFinder
let g:fuf_file_exclude = '\v\~$|\.(o|exe|dll|bak|orig|swp)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
let g:fuf_modesDisable = []
let g:fuf_mrufile_maxItem = 100
let g:fuf_mrucmd_maxItem = 100
" FuzzyFinder - files from current buffer dir.
noremap ~ :FufFileWithCurrentBufferDir<CR>
" FuzzyFinder - most recent files.
noremap <C-A-m> :FufMruFile<CR>
" FuzzyFinder - files from root dir.
noremap <C-A-o> :FufFile<CR>

