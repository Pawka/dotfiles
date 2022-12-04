syntax on
set nu ru et
set ts=2 sts=2 sw=2
set cursorline
set hlsearch

set nocompatible   " be improved, required
filetype off       " required" store the plugins in plugged dir


" PLUGINS
call plug#begin('~/.config/nvim/plugged')

Plug 'altercation/vim-colors-solarized'

" Telescope requires plenary to function
Plug 'nvim-lua/plenary.nvim'
" The main Telescope plugin
Plug 'nvim-telescope/telescope.nvim'
" An optional plugin recommended by Telescope docs
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make' }

Plug 'neovim/nvim-lspconfig'
Plug 'tpope/vim-fugitive'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'onsails/lspkind-nvim'

" Languages
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

colorscheme solarized

" remaps
nnoremap <C-p> :Telescope find_files<Cr>
nnoremap <C-b> :Telescope buffers<Cr>

lua require('pawka')
