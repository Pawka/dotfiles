set background=dark
hi clear          

hi Boolean         guifg=#dca3a3 gui=bold
hi Character       guifg=#dca3a3 gui=bold
hi Comment         guifg=#7f7f7f
hi Condtional      guifg=#8fffff
hi Constant        guifg=#dca3a3 gui=bold
hi Cursor          guifg=#000000 guibg=#aeaeae
hi Debug           guifg=#dca3a3 gui=bold
hi Define          guifg=#ffcfaf gui=bold
hi Delimiter       guifg=#8f8f8f
hi DiffAdd         guibg=#613c46
hi DiffChange      guibg=#333333
hi DiffDelete      guifg=#333333 guibg=#464646 gui=none
hi DiffText        guifg=#ffffff guibg=#1f1f1f gui=bold
hi Directory       guifg=#ffffff gui=bold
hi Error           guifg=#000000 guibg=#00ffff
hi ErrorMsg        guifg=#000000 guibg=#00c0cf
hi Exception       guifg=#8fffff gui=underline
hi Float           guifg=#9c93b3
hi FoldColumn      guifg=#dca3a3 guibg=#464646
hi Folded          guifg=#dca3a3 guibg=#333333
hi Function        guifg=#ffff8f
hi Identifier      guifg=#ffffff
hi Include         guifg=#ffcfaf gui=bold
hi IncSearch       guifg=#000000 guibg=#c15c66
hi Keyword         guifg=#ffffff gui=bold
hi Label           guifg=#8fffff gui=underline
hi LineNr          guifg=#7f7f7f guibg=#464646
hi Macro           guifg=#ffcfaf gui=bold
hi ModeMsg         guifg=#dca3a3 gui=bold
hi MoreMsg         guifg=#ffffff gui=bold
hi NonText         guifg=#1f1f1f
hi Normal          guifg=#cccccc guibg=#3f3f3f
hi Number          guifg=#aca0a3
hi Operator        guifg=#ffffff
hi PreCondit       guifg=#dfaf8f gui=bold
hi PreProc         guifg=#ffcfaf gui=bold
hi Question        guifg=#ffffff gui=bold
hi Repeat          guifg=#8fffff gui=underline
hi Search          guifg=#000000 guibg=#c15c66
hi SpecialChar     guifg=#dca3a3 gui=bold
hi SpecialComment  guifg=#dca3a3 gui=bold
hi Special         guifg=#7f7f7f
hi SpecialKey      guifg=#7e7e7e
hi Statement       guifg=#8fffff
hi StatusLine      guifg=#333333 guibg=#f18c96
hi StatusLineNC    guifg=#333333 guibg=#cccccc
hi StorageClass    guifg=#ffffff gui=bold
hi String          guifg=#cc9393
hi Structure       guifg=#ffffff gui=bold,underline
hi Tag             guifg=#dca3a3 gui=bold
hi Title           guifg=#ffffff guibg=#333333 gui=bold
hi Todo            guifg=#ffffff guibg=#000000 gui=bold
hi Typedef         guifg=#ffffff gui=bold,underline
hi Type            guifg=#ffffff gui=bold
hi VertSplit       guifg=#333333 guibg=#cccccc
hi Visual          guifg=#333333 guibg=#f18c96 gui=reverse
hi VisualNOS       guifg=#333333 guibg=#f18c96 gui=bold,underline
hi WarningMsg      guifg=#ffffff guibg=#333333 gui=bold
hi WildMenu        guifg=#000000 guibg=#dca3a3

" OUTLINER
hi OL1 guifg=#8fffff	ctermfg=white		gui=bold
hi OL2 guifg=#dca3a3	ctermfg=red		gui=bold
hi OL3 guifg=#ffffff	ctermfg=lightblue	gui=bold
hi OL4 guifg=#cfcfcf	ctermfg=magenta
hi OL5 guifg=#7f7f7f	ctermfg=white
hi OL6 guifg=red	ctermfg=red
hi OL7 guifg=lightblue	ctermfg=lightblue
hi OL8 guifg=yellow	ctermfg=magenta
hi OL9 guifg=white	ctermfg=white

" colors for tags
hi outlTags guifg=darkred	ctermfg=darkred

" color for body text
hi BT1 guifg=green	ctermfg=green
hi BT2 guifg=green	ctermfg=green
hi BT3 guifg=green	ctermfg=green
hi BT4 guifg=green	ctermfg=green
hi BT5 guifg=green	ctermfg=green
hi BT6 guifg=green	ctermfg=green
hi BT7 guifg=green	ctermfg=green
hi BT8 guifg=green	ctermfg=green
hi BT9 guifg=green	ctermfg=green

" color for pre-formatted text
hi PT1 guifg=blue	ctermfg=cyan
hi PT2 guifg=blue	ctermfg=cyan
hi PT3 guifg=blue	ctermfg=cyan
hi PT4 guifg=blue	ctermfg=cyan
hi PT5 guifg=blue	ctermfg=cyan
hi PT6 guifg=blue	ctermfg=cyan
hi PT7 guifg=blue	ctermfg=cyan
hi PT8 guifg=blue	ctermfg=cyan
hi PT9 guifg=blue	ctermfg=cyan

" color for tables 
hi TA1 guifg=yellow	ctermfg=cyan
hi TA2 guifg=yellow	ctermfg=cyan
hi TA3 guifg=yellow	ctermfg=cyan
hi TA4 guifg=yellow	ctermfg=cyan
hi TA5 guifg=yellow	ctermfg=cyan
hi TA6 guifg=yellow	ctermfg=cyan
hi TA7 guifg=yellow	ctermfg=cyan
hi TA8 guifg=yellow	ctermfg=cyan
hi TA9 guifg=yellow	ctermfg=cyan

" color for user text (wrapping)
hi UT1 guifg=darkred	ctermfg=cyan
hi UT2 guifg=darkred	ctermfg=cyan
hi UT3 guifg=darkred	ctermfg=cyan
hi UT4 guifg=darkred	ctermfg=cyan
hi UT5 guifg=darkred	ctermfg=cyan
hi UT6 guifg=darkred	ctermfg=cyan
hi UT7 guifg=darkred	ctermfg=cyan
hi UT8 guifg=darkred	ctermfg=cyan
hi UT9 guifg=darkred	ctermfg=cyan

" color for user text (non-wrapping)
hi UB1 guifg=darkgray	ctermfg=cyan
hi UB2 guifg=darkgray	ctermfg=cyan
hi UB3 guifg=darkgray	ctermfg=cyan
hi UB4 guifg=darkgray	ctermfg=cyan
hi UB5 guifg=darkgray	ctermfg=cyan
hi UB6 guifg=darkgray	ctermfg=cyan
hi UB7 guifg=darkgray	ctermfg=cyan
hi UB8 guifg=darkgray	ctermfg=cyan
hi UB9 guifg=darkgray	ctermfg=cyan

" colors for folded sections
hi Folded guifg=darkcyan guibg=bg	ctermfg=cyan ctermbg=black
hi FoldColumn guifg=darkcyan guibg=bg	ctermfg=cyan ctermbg=black

" colors for experimental spelling error highlighting
" this only works for spellfix.vim with will be cease to exist soon
hi spellErr gui=underline guifg=yellow	cterm=underline ctermfg=yellow
hi BadWord gui=underline guifg=yellow	cterm=underline ctermfg=yellow

