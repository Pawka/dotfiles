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
set textwidth=80

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
        set background=dark

        " Use 256 colours
        if $TERM =~ "-256color"
            set t_Co=256
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
        let g:airline_powerline_fonts = 0
        let g:airline_exclude_preview = 1
    " }

    " Always show statusline
    set laststatus=2
    " Horisontal cursor line
    set cursorline
    " Set vertical after 80 symbols mark.
    let &colorcolumn=join([81, 81],",")
    " Show line numbers on the left.
    set number
    " Set fixed line number column width to avoid toggle.
    set numberwidth=8
    " Show cursor position
    set ruler
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

    " Select last edited or pasted text.
    nnoremap <Leader>p `[v`]
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
set tags+=vendor.tags

" Do not wrap lines automatically
set nowrap

set mouse=a
set nocp
set vb t_vb=
set exrc


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FILETYPES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd Filetype gitcommit setlocal spell textwidth=72

" Autocomplete funcs and identifiers for languages {
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
    autocmd FileType php set omnifunc=phpcomplete#CompletePHP
" }


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
" Ale {
    let g:ale_fixers = {
    \   '*': ['remove_trailing_lines', 'trim_whitespace'],
    \}

    " Set this variable to 1 to fix files when you save them.
    let g:ale_fix_on_save = 1
    " Always show sign column.
    let g:ale_sign_column_always = 1

    " Mappings in the style of unimpaired-next
    nmap <silent> [W <Plug>(ale_first)
    nmap <silent> [w <Plug>(ale_previous)
    nmap <silent> ]w <Plug>(ale_next)
    nmap <silent> ]W <Plug>(ale_last)
" }

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
" }

" FZF {
    nnoremap <c-p> :<c-u>FZF<CR>
    nnoremap <c-b> :<c-u>Buffers<CR>
    nnoremap <c-n> :<c-u>History<CR>

    " [Buffers] Jump to the existing window if possible
    let g:fzf_buffers_jump = 1
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

    " NOTE: move to language-native files.
    noremap <Leader>bp :Breakpoint<CR>
" }
"
" Notes {
    let g:notes_directories = ['~/fs/Apps/vimnotes']
" }
"
" vim-wiki {
    let g:vimwiki_list = [{
    \    'path': '~/fs/Apps/vimwiki/',
    \    'syntax': 'markdown',
    \    'ext': '.md'
    \}]

    " Needs to be disabled to make UtilSnips work on vimwiki files.
    " Source: https://github.com/vimwiki/vimwiki/issues/357
    let g:vimwiki_table_mappings = 0
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
    let g:go_list_type = "quickfix"
    let $USE_SYSTEM_GO=1
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
