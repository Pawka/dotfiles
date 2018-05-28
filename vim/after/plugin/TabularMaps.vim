if !exists(':Tabularize')
  finish " Tabular.vim wasn't loaded
endif

AddTabularPattern! phpComment /&\?\$\w*

map <leader>st :Tabularize<cr>
map <leader>sa :Tabularize /=><cr>
map <leader>sc :Tabularize phpComment<cr>
