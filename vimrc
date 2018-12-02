set nocompatible " Must be first line

" Vundle setup {
    source ~/.vimrc.bundles
" }

filetype plugin indent on     " required!

if has("syntax")
    syntax enable
endif

set novisualbell
set hidden

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
set wildignore=*.o,*.obj,*.png,*.jpg,*.jpeg,*.gif,*.tiff,*.bmp,*.xls,*.csv,LICENSE,**/doc/**,*.pyc

" Colors {
    if has("gui_running")
        " Hide toolbar
        set guioptions-=T
        set guifont=Monospace\ 10
    else
        set t_Co=16

        " Use 256 colours 
        if $TERM =~ "-256color"
            se t_Co=256
            se background=dark
            " let g:solarized_termcolors=256
            " let g:solarized_contrast="high"
            " let g:solarized_termtrans=1
        endif
    endif

    " loads color scheme if available
    try
        colorscheme solarized
        " vim-gitgutter styling
        highlight clear SignColumn
    catch /^Vim\%((\a\+)\)\=:E185/
        " deal with it
    endtry

    " Set colors for vim-easymotion
    hi EasyMotionTarget2First ctermbg=none ctermfg=blue cterm=bold
    hi EasyMotionTarget2Second ctermbg=none ctermfg=blue cterm=bold
" }

"GUI {
    " Statusline {
        " Use powerline fonts
        let g:airline_powerline_fonts = 1
        let g:airline_exclude_preview = 1
    " }

    " Always show statusline
    set laststatus=2
    " Horisontal cursor line
    set cursorline
    " Set vertical 80 symbols mark.
    let &colorcolumn=join([80, 80],",")
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
    " Ignore case sensitivity by default when searching
    set ignorecase
    set nosmartcase
" }

" Global key bindings {
    " Map leader key to ','.
    let mapleader=',' 
    noremap \ ,
    nnoremap <silent> <Leader>l :<C-u>nohlsearch<CR><C-l>
    nnoremap <Leader>m :make<CR>
    " <number><Leader>z will set foldlevel to <number>
    nnoremap <silent> <Leader>z :<C-u>let &foldlevel = v:count<CR>

    " Function keys {
        " noremap <F5> :make<CR>
    " }
    "

    " Select last edited or pasted text.
    nnoremap <Leader>p `[v`]

    nnoremap <Leader>cd :put =strftime('%Y-%m-%d')<CR>
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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DJANGO + PYTHON
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd Filetype gitcommit setlocal spell textwidth=72

" Autocomplete funcs and identifiers for languages {
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
    autocmd FileType php set omnifunc=phpcomplete#CompletePHP
    autocmd FileType php setlocal ts=2 sts=2 sw=2
    autocmd FileType json setlocal ts=2 sts=2 sw=2
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
    let g:tagbar_phpctags_bin='phpctags'
    let g:tagbar_phpctags_memory_limit = '512M'
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
        let g:syntastic_mode_map = { 'mode': 'active' ,
                                   \ 'active_filetypes': ['python', 'js', 'puppet', 'sh', 'markdown', 'yaml', 'zsh', 'go'],
                                   \ 'passive_filetypes': ['php'] }
        "Do not move cursor to first error after open/save.
        let g:syntastic_auto_jump = 0
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

" Localvimrc {
    " Disable sandbox mode
    let g:localvimrc_sandbox=0
    " Do not ask if .lvimrc should be loaded
    let g:localvimrc_ask=0
    " Load one .lvimrc
    let g:localvimrc_count=1
" }
"
" Vdebug {
    " Break on breakpoints only.
    let g:vdebug_options = {
    \    "port" : 9000,
    \    "server" : 'localhost',
    \    "timeout" : 20,
    \    "on_close" : 'detach',
    \    "break_on_open" : 0,
    \    "continuous_mode": 1,
    \    "watch_window_style": 'compact'
    \}

    noremap <Leader>bp :Breakpoint<CR>
" }
"
" Notes {
    let g:notes_directories = ['~/Documents/notes']
" }
"
" vim-go {
    set updatetime=100 " Update (go-info) every 100ms
    let g:go_auto_type_info = 1
    let g:go_fmt_command = "goimports"
    let g:go_highlight_build_constraints = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_types = 1
    let g:go_metalinter_autosave = 1
" }
"
" UtilSnips {
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" }
"
" YCM {
    " Make YCM compatible with UltiSnips as per:
    " https://github.com/SirVer/ultisnips/issues/512#issuecomment-111733631
    let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
    let g:SuperTabDefaultCompletionType = '<C-n>'

    " Autoclose preview window
    let g:ycm_autoclose_preview_window_after_completion = 1
    let g:ycm_autoclose_preview_window_after_insertion = 1
" }
"
" Emmet {
    let g:user_emmet_leader_key='<Tab>'
    let g:user_emmet_settings = {
    \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
    \}
" }
