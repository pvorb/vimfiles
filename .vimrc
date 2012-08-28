"""""""""""""""""""""""""""""""""""""""""
" Author: Paul Vorbach <http://vorb.de> "
"""""""""""""""""""""""""""""""""""""""""

set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf8
set fileformats=unix,dos        " use either unix or dos file format
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plug-ins + indentation

"" Whitespace
set nowrap
set tabstop=2 shiftwidth=2      " a tab is two spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive ...
set smartcase                   " unless they contain at least one capital

"" Highlighting
set showmatch                   " highlight matching brackets

"" Appearance
set ruler                       " show current position

set noerrorbells
set novisualbell

let os = substitute(system('uname'), "\n", "", "")
if os == "Linux"
  set guifont=DejaVu\ Sans\ Mono\ 9
else
  set guifont=DejaVu_Sans_Mono:h9
endif

if has('gui_running')
  colors vorbach

  winpos 683 0                    " position new windows in the top left corner
  set columns=92
  set lines=50

  set number                    " show line numbers
  set cursorline                  " show a line at the current cursor position
  set cursorcolumn


  set t_Co=256
  set linespace=3               " use spacing between lines
  
  set colorcolumn=+1

  set mousehide                 " hide mouse in insert mode
else
  set background=dark
endif

"" Behavior
set linebreak                   " wrap long lines
set textwidth=80                " break after 80 characters
set autoindent                  " automatic indentation
set smartindent

set noswapfile                  " disable swap file
set nobackup                    " disable backups

"" File types
if has("autocmd")
  " Set automatic filetype detection to "on"
  filetype on

  autocmd BufEnter *.json set filetype=javascript
  autocmd BufEnter *.ejs set filetype=html
  autocmd BufEnter *.txt set filetype=pdc
  autocmd BufEnter *.mkd set filetype=pdc
  autocmd BufEnter *.md set filetype=pdc
  autocmd BufEnter *.markdown set filetype=pdc
  autocmd BufEnter *.xaml set filetype=xml
  autocmd BufEnter *.less set filetype=css
  autocmd BufEnter *.sbt set filetype=scala
endif
