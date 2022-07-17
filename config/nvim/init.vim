syntax on
set nu ru et
set ts=2 sts=2 sw=2
set cursorline
set hlsearch

set nocompatible   " be improved, required
filetype off       " required" store the plugins in plugged dir


" PLUGINS
call plug#begin('~/.config/nvim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'tpope/vim-fugitive'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

lua require('pawka')
