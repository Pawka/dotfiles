syntax on

set nocompatible
filetype off       " required" store the plugins in plugged dir

set autoindent
set smartindent
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set textwidth=80
" Do not wrap lines automatically
set nowrap

" Plugins
call plug#begin('~/.config/nvim/plugged')

" GUI {
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'altercation/vim-colors-solarized'
    Plug 'bling/vim-airline'
" }

" Navigation {
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'Lokaltog/vim-easymotion'
    " Telescope requires plenary to function
    Plug 'nvim-lua/plenary.nvim'
    " The main Telescope plugin
    Plug 'nvim-telescope/telescope.nvim'
    " An optional plugin recommended by Telescope docs
    Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make' }
    " Recent files for Telescope
    Plug 'smartpde/telescope-recent-files'
    Plug 'tpope/vim-rhubarb'
" }
" Editing {
    Plug 'windwp/nvim-autopairs'
    Plug 'airblade/vim-gitgutter'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'honza/vim-snippets'
    Plug 'janko/vim-test'
    Plug 'mhinz/vim-grepper'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-fugitive'
    Plug 'rgroli/other.nvim'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'
    " Notes
    Plug 'vimwiki/vimwiki'
    Plug 'w0rp/ale'
" }

" Autocompletion {
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'L3MON4D3/LuaSnip'
    Plug 'onsails/lspkind-nvim'
    Plug 'saadparwaiz1/cmp_luasnip'
" }

" Languages {
    Plug 'neovim/nvim-lspconfig'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'tpope/vim-markdown'
    Plug 'chase/vim-ansible-yaml'
    Plug 'rust-lang/rust.vim'
" }

call plug#end()

" Ensure backspace is working the same in all environments.
set backspace=indent,eol,start

" Max tabs
set tabpagemax=100

" Encoding
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,latin1
set wildignore=*.o,*.obj,*.png,*.jpg,*.jpeg,*.gif,*.tiff,*.bmp,*.xls,*.csv,LICENSE,**/doc/**,*.pyc

" GUI {
    " List characters
    set listchars=tab:→\ ,eol:¶
    " Set vertical after 80 symbols mark.
    let &colorcolumn=join([81, 81],",")
    " Show line numbers on the left.
    set number
    " Display relative numbers on the left.
    set relativenumber
    " Set fixed line number column width to avoid toggle.
    set numberwidth=8
    " Show cursor position
    set ruler
    " Show horisontal cursor lint
    set cursorline

    colorscheme solarized

    " vim-gitgutter styling
    highlight clear SignColumn
" }

" Folding {
    set foldnestmax=1
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
"
" Filetypes {
    autocmd Filetype gitcommit setlocal spell textwidth=72
    autocmd BufRead,BufNewFile *.star set filetype=python
" }
"
"
" Command mappings {
    " Map wq commands to avoid case errors
    :command! WQ wq
    :command! Wq wq
    :command! W w
    :command! Q q
" }
"
" Global key bindings {
    " Map leader key to ','.
    let mapleader=','
    noremap \ ,
    " Deselect text highlighted by search.
    nnoremap <silent> <Leader>l :<C-u>nohlsearch<CR><C-l>

    " Select last edited or pasted text.
    nnoremap <Leader>p `[v`]
" }
"
" Telescope {
    nnoremap <C-b> :Telescope buffers<Cr>
    nnoremap <C-g> :Telescope live_grep<Cr>
    nnoremap <C-p> :Telescope find_files<Cr>
    nnoremap <Leader>f :Telescope find_files cwd=%:h<Cr>
    nnoremap <Leader>lr :Telescope lsp_references<Cr>
    nnoremap <Leader>li :Telescope lsp_implementations<Cr>
    nnoremap <Leader>lc :Telescope lsp_incoming_calls<Cr>
    nnoremap <Leader>ls :Telescope lsp_document_symbols<Cr>
"}
"
" EasyMotion {
    " Set colors for vim-easymotion
    hi EasyMotionTarget2First ctermbg=none ctermfg=blue cterm=bold
    hi EasyMotionTarget2Second ctermbg=none ctermfg=blue cterm=bold
" }
"
" Ale {
    let g:ale_fixers = {
    \   '*': ['remove_trailing_lines', 'trim_whitespace'],
    \   'rust': ['rustfmt'],
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
"
" vim-wiki {
    let g:vimwiki_list = [
    \ {'path': '~/Documents/Apps/vimwiki/', 'syntax': 'markdown', 'ext': '.md'},
    \ {'path': '~/Documents/Apps/vimwiki-uber/', 'syntax': 'markdown', 'ext': '.md'}
    \ ]

    " Needs to be disabled to make UtilSnips work on vimwiki files.
    " Source: https://github.com/vimwiki/vimwiki/issues/357
    let g:vimwiki_table_mappings = 0
" }
"
" vim-go {
    " set updatetime=100 " Update (go-info) every 100ms
    " let g:go_auto_type_info = 1
    " let g:go_fmt_command = "goimports"
    " let g:go_highlight_build_constraints = 1
    " let g:go_highlight_fields = 1
    " let g:go_highlight_functions = 1
    " let g:go_highlight_methods = 1
    " let g:go_highlight_operators = 1
    " let g:go_highlight_types = 1
    " let g:go_metalinter_autosave = 0
    " let g:go_list_type = "quickfix"
    " let $USE_SYSTEM_GO=1
" }
"
" Grepper {
    " Search for the current word"
    nnoremap <Leader>* :Grepper -tool rg -cword -noprompt<CR>
" }
"
" other-nvim {
    nnoremap <Leader>a :Other<CR>
" }
"
" LuaSnip {
    " press <Tab> to expand or jump in a snippet.
    imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
" }
"
" Github & Git {
    " Open Github PR in a browser. PR number must be a current word under
    " cursor. Requires `gh` tool to be installed and configured.
    nnoremap <expr> <Leader>pr ':!gh pr view -w '.expand('<cword>').'<CR>'
    nnoremap <Leader>gb :Git blame<CR>
    nnoremap <Leader>go :GBrowse<CR>
" }

lua require('pawka')
