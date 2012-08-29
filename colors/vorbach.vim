" Vim color file
" Maintainer:   Paul Vorbach
" Last Change:  2012 Aug 28
" Email:        <paul@vorb.de>

" Color settings inspired by BBEdit for Mac OS, plus I liked
" the low-contrast comments from the 'oceandeep' colorscheme
" Adapted from the 'tolerable' colorscheme

set background=light
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="vorbach"

hi Cursor       guifg=white guibg=black

hi Normal       gui=none guifg=black guibg=white
hi NonText      gui=none guifg=darkcyan guibg=white

hi Statement    gui=bold guifg=blue
hi Special      gui=none guifg=orangered
hi Constant     gui=none guifg=red
hi Comment      gui=italic guifg=#333333
hi Preproc      gui=bold guifg=darkgreen
hi Type         gui=none guifg=darkmagenta
hi Identifier   gui=bold guifg=darkcyan
hi Title        gui=bold guifg=black

hi StatusLine   gui=none guibg=#333333 guifg=white
hi StatusLineNC gui=none guibg=#333333 guifg=white
hi VertSplit    gui=none guibg=#333333 guifg=white

hi Visual       gui=none guibg=green guifg=black
hi Search       gui=none guibg=yellow
hi Directory    gui=none guifg=darkblue
hi WarningMsg   gui=none guifg=red
hi Error        gui=none guifg=white guibg=red
hi Todo         gui=none guifg=black guibg=yellow

hi MoreMsg      gui=none
hi ModeMsg      gui=bold

hi CursorLine   guibg=#eeeeee
hi CursorColumn guibg=#eeeeee
hi LineNr       guifg=#bbbbbb
hi ColorColumn  guibg=#dddddd
