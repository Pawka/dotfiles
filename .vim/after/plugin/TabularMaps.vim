if !exists(':Tabularize')
  finish " Tabular.vim wasn't loaded
endif

AddTabularPattern! phpComment /\$\w*

map <leader>ta :Tab /=><cr>
map <leader>tc :Tab phpComment<cr>
