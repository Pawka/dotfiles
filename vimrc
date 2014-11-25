set nocompatible " Must be first line


" php-getter-setter {
    " Templates needs to be set before plugin load
    let b:phpgetset_setterTemplate =
    \ "    \n" .
    \ "    /**\n" .
    \ "     * Set XXX %varname%\n" .
    \ "     *\n" .
    \ "     * @param mixed $%varname%\n" .
    \ "     */\n" .
    \ "    public function %funcname%($%varname%)\n" .
    \ "    {\n" .
    \ "        $this->%varname% = $%varname%;\n" .
    \ "    }"

   let b:phpgetset_getterTemplate =
    \ "    \n" .
    \ "    /**\n" .
    \ "     * Get %varname%\n" .
    \ "     *\n" .
    \ "     * @return\n" .
    \ "     */\n" .
    \ "    public function %funcname%()\n" .
    \ "    {\n" .
    \ "        return $this->%varname%;\n" .
    \ "    }"
" }

" Bundles {

    " Setup {
        filetype on
        filetype off
        set rtp+=~/.vim/bundle/vundle
        call vundle#rc()
    " }

    " Use bundles config {
        if filereadable(expand("~/.vimrc.bundles"))
            source ~/.vimrc.bundles
        endif
    " }

" }

filetype plugin indent on     " required!

if has("syntax")
    syntax enable
endif

set novisualbell

" Backup files
set backup
set backupdir=~/.vim/backup
set directory=/tmp

" TAB simbolių kiekis
set autoindent
set smartindent
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set textwidth=0

" List characters
set listchars=tab:→\ ,eol:¶

" Max tabs
set tabpagemax=100

" Encoding
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,latin1
set wildignore=*.o,*.obj,*.png,*.jpg,*.jpeg,*.gif,*.tiff,*.bmp,*.xls,*.csv,LICENSE,**/doc/**

"GUI {

    " Statusline {
        " Use powerline fonts
        let g:airline_powerline_fonts = 1
    " }

    " Always show statusline
    set laststatus=2

    " Use 256 colours (Use this setting only if your terminal supports 256 colours)
    set t_Co=256
" }

" Command-Line mode {
    " Enable wildmenu on command mode autocomplete.
    set wildmenu
    set wildmode=full

    " CL default is 20.
    set history=200

    " Map <C-p> and <C-n> filter command history.
    cnoremap <C-p> <Up>
    cnoremap <C-n> <Down>
" }

" Search {
    set hlsearch
    set incsearch
    set ignorecase
    set nosmartcase
    set cursorline
" }

" Global key bindings {
    " Map leader key to ','.
    let mapleader=',' 
    noremap \ ,
    nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
    nnoremap <Leader>m :make<CR>

    " Function keys {
        noremap <F5> :make<CR>
    " }
" }
"
" Command mappings {

    " Map wq commands to avoid case errors
    :command! WQ wq
    :command! Wq wq
    :command! W w
    :command! Q q
" }

" Tags
" set tags=./tags*,./../tags*,./../../tags*,tags*,$VIM/tags,$VIM/phptags
set tags+=vendor.tags

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

" Colors {
    if has("gui_running")
        " Hide toolbar
        set guioptions-=T
        set guifont=Monospace\ 10
    else
      let g:solarized_termcolors=256
    endif

    " set background=dark
    colorscheme solarized

    " Set colors for vim-easymotion
    hi EasyMotionTarget2First ctermbg=none ctermfg=blue cterm=bold
    hi EasyMotionTarget2Second ctermbg=none ctermfg=blue cterm=bold
" }


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
" automagically folds functions & methods. this is getting IDE-like isn't it?
autocmd FileType php let php_folding=0

" set auto-highlighting of matching brackets for php only
autocmd FileType php DoMatchParen
autocmd FileType php hi MatchParen ctermbg=blue guibg=lightblue


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DJANGO + PYTHON
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType python set ft=python.django " For SnipMate

" Autocomplete funcs and identifiers for languages {
    autocmd FileType python set omnifunc=pythoncomplete#Complete
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
    autocmd FileType php set omnifunc=phpcomplete#CompletePHP
" }


filetype on
filetype plugin indent on
" Repair wired terminal/vim settings
set backspace=indent,start,eol

" Syntax {
    autocmd! BufNewFile,BufRead *.pde set ft=arduino            " Arduino syntax highlighting.
    autocmd! BufNewFile,BufRead *.ino set ft=arduino
    autocmd! BufNewFile,BufRead *.json set ft=json              " JSON highlighting.
    autocmd! BufNewFile,BufRead *.php set ft=php
    autocmd! BufNewFile,BufRead *.html set ft=phtml
    autocmd! BufNewFile,BufRead *.html.php set ft=phtml
    autocmd! BufNewFile,BufRead *.text set ft=tex
    autocmd! BufNewFile,BufRead *.twig set ft=htmldjango.html   " Twig/Django - same shit.
" }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Tagbar {
    nmap <F8> :TagbarToggle<CR>
" }

" FuzzyFinder {
    let g:fuf_file_exclude = '\v\~$|\.(o|exe|dll|bak|orig|swp)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
    let g:fuf_modesDisable = []
    let g:fuf_mrufile_maxItem = 100
    let g:fuf_mrucmd_maxItem = 100

    noremap <Leader>` :FufFileWithCurrentBufferDir<CR>
    noremap <Leader>f :FufFileWithCurrentBufferDir<CR>

    noremap <Leader>dd :FufBookmarkDir<CR>
    noremap <Leader>dm :FufMruFile<CR>
    noremap <Leader>db :FufBuffer<CR>
" }

" CtrlP {
    noremap <c-b> :CtrlPBuffer<CR>
    let g:ctrlp_custom_ignore = {
        \ 'dir': '\v(cache|logs|build|app\/sessions|app\/Resources)$'
        \ }
" }


" Syntastic {
    if exists("g:loaded_syntastic_plugin")
        "Disable automatic check for some types.
        let g:syntastic_mode_map = { 'mode': 'passive' ,
                                   \ 'active_filetypes': ['python', 'js', 'php'],
                                   \ 'passive_filetypes': ['puppet'] }
        "Do not move cursor to first error after open/save.
        let g:syntastic_auto_jump = 0
        "Map key to run check.
        nnoremap <silent> <F4> :w<CR> :SyntasticCheck<CR> :Errors<CR>
    endif
" }

" Gundo {
    "Display preview window at bottom.
    " let g:gundo_preview_bottom = 1
    " nnoremap <F7> :GundoToggle<CR>
" }

" Command-T {
    " Ignore dirs
    " let g:CommandTWildIgnore=&wildignore . ",**/cache/**,**/logs/**,**/build/**,**/app/sessions/**,*~,**/app/Resources/**"
    " let g:CommandTMaxHeight=20
" }

" php-getter-setter {
    " Templates needs to be set before plugin load
    let b:phpgetset_setterTemplate =
    \ "    \n" .
    \ "    /**\n" .
    \ "     * Set %varname%\n" .
    \ "     *\n" .
    \ "     * @param mixed $%varname%\n" .
    \ "     */\n" .
    \ "    public function %funcname%($%varname%)\n" .
    \ "    {\n" .
    \ "        $this->%varname% = $%varname%;\n" .
    \ "    }"

   let b:phpgetset_getterTemplate =
    \ "    \n" .
    \ "    /**\n" .
    \ "     * Get %varname%\n" .
    \ "     *\n" .
    \ "     * @return\n" .
    \ "     */\n" .
    \ "    public function %funcname%()\n" .
    \ "    {\n" .
    \ "        return $this->%varname%;\n" .
    \ "    }"
" }
