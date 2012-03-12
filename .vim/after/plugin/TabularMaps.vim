if !exists(':Tabularize')
  finish " Tabular.vim wasn't loaded
endif

AddTabularPattern! phpComment /\$\w*
