if !exists(':Tabularize')
  finish " Tabular.vim wasn't loaded
endif

AddTabularPattern! phpComment /\$\w*

map <leader>st :Tab<cr>
map <leader>sa :Tab /=><cr>
map <leader>sc :Tab phpComment<cr>
