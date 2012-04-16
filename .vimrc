" Pathogen plugin to handle bundles.
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

set nocompatible    " no compatible
if has("syntax")
  syntax on
endif

set novisualbell
"Backup files
set backup
set backupdir=~/.vim/backup
set directory=/tmp

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

"GUI {
    "Always display status line
    set laststatus=2
"}

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


" Status line
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PHP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" The completion dictionary is provided by Rasmus:
" http://lerdorf.com/funclist.txt
" set dictionary-=~/.vim/dictionaries/phpfunclist dictionary+=~/.vim/dictionaries/phpfunclist
" Use the dictionary completion. Use CTRL+N or CTRL+P while in INSERT mode to call completion.
" set complete-=k complete+=k

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

" Twig uses same templates style as Django
autocmd BufRead,BufNewFile *.twig set filetype=htmldjango.html


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DJANGO + PYTHON
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
filetype plugin indent on
" Repair wired terminal/vim settings
set backspace=indent,start,eol

" Syntax {
    autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino "Arduino syntax highlighting.
    autocmd! BufNewFile,BufRead *.json set ft=json "JSON highlighting.
" }

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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Taglist plugin
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PHP Documentor {
    source ~/.vim/ftplugin/php-doc.vim 
    inoremap <A-c> <ESC>:call PhpDocSingle()<CR>i 
    nnoremap <A-c> :call PhpDocSingle()<CR> 
    vnoremap <A-c> :call PhpDocRange()<CR>
" }

" ZenCoding
let g:user_zen_expandabbr_key = '<c-e>'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FuzzyFinder
let g:fuf_file_exclude = '\v\~$|\.(o|exe|dll|bak|orig|swp)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
let g:fuf_modesDisable = []
let g:fuf_mrufile_maxItem = 100
let g:fuf_mrucmd_maxItem = 100

noremap ~ :FufFileWithCurrentBufferDir<CR>
noremap <C-A-m> :FufMruFile<CR>
noremap <C-A-o> :FufFile<CR>

" Syntastic {
    "Disable automatic check for some types.
    let g:syntastic_mode_map = { 'mode': 'passive' ,
                               \ 'active_filetypes': ['python'],
                               \ 'passive_filetypes': ['puppet'] }
    "Do not move cursor to first error after check.
    let g:syntastic_auto_jump = 0
" }

