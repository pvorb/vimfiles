"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Modified version of <http://amix.dk/vim/vimrc.html> "
"                                                     "
" Author: Paul Vorbach <http://vorb.de>               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""
" General "
"""""""""""

:behave mswin

set nocp " Who cares about vi?

" Sets the history size
set history=700

" Enable filetype plugin
filetype plugin on
filetype indent on

" Default file types
set ffs=unix,dos,mac
set enc=utf8

" Set to auto read when a file is changed from the outside
set autoread

" Set backup behavior
set backupdir=~/vimfiles/tmp
set noswapfile

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>
" Fast editing of the _vimrc
map <leader>v :e! ~/.vimrc<cr>

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

""""""""""""""""""
" User interface "
""""""""""""""""""

set hid " Change buffer - without saving
set ruler " Always show the current position

" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Searching
set ignorecase
set smartcase

set hlsearch " Highlight
set incsearch
set nolazyredraw

set magic " Regular expressions

set showmatch " Show matching bracets when text indicator is over them

" Disable sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Statusline
set laststatus=2
set statusline=[%n]\ %f\ %w%y%r%m[%{&fileformat}][%{&fileencoding}]\ %=\ %l/%L,%-5c\ %P\

""""""""""""""""""""
" Colors and fonts "
""""""""""""""""""""
syntax enable " Enable syntax highlighting

if has('gui_running')

  " Set window size
  set columns=92
  set lines=50

  " Set window position
  winpos 0 0

  " Set number of colors
  set t_Co=256

  " Hide mouse in insertion mode
  set mousehide

  " Font
  set guifont=DejaVu_Sans_Mono:h9
  set linespace=2

  " Line numbers
  set number
  set numberwidth=6
  highlight LineNr guifg=#666666 guibg=#f5f5f5

  set colorcolumn=+1
  highlight colorcolumn guibg=#cccccc
else
  set background=dark
endif

""""""""""""""""""""""
" Tabs and indention "
""""""""""""""""""""""

" Set tab width
"set noexpandtab
set expandtab
set shiftwidth=2
set softtabstop=2
"set tabstop=2
"set smarttab

" Wrap lines that are too long for the window size.
set lbr
" Automatically break lines after 80 characters.
set tw=80

set ai " Auto indent
set si " Smart indent

"""""""""""""""
" Visual Mode "
"""""""""""""""

" Search forward/backward for the selected text by pressing * or #.
vnoremap <silent> * :call VisualSearch('f')<cr>
vnoremap <silent> # :call VisualSearch('b')<cr>

" Grep for the selected text.
vnoremap <silent> gv :call VisualSearch('gv')<cr>
map <leader>g : vimgrep // **/*.<left><left><left><left><left><left><left>

function! CmdLine(str)
  exe "menu Foo.Bar :" . a:str
  emenu Foo
endfunction

" From an idea by Michael Naumann
function! VisualSearch(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  elseif a:direction == 'gv'
    call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
  elseif a:direction == 'f'
    execute "normal /" . l:pattern . "^M"
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

""""""""""""""""
" Command Line "
""""""""""""""""

" Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>

" $q is super useful when browsing on the command line
cno $q <C-\>eDeleteTillSlash()<cr>

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Useful on some European keyboards
map ½ $
imap ½ $
vmap ½ $
cmap ½ $


func! Cwd()
  let cwd = getcwd()
  return "e " . cwd
endfunc

func! DeleteTillSlash()
  let g:cmd = getcmdline()
  if MySys() == "linux" || MySys() == "mac"
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
  else
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
  endif
  if g:cmd == g:cmd_edited
    if MySys() == "linux" || MySys() == "mac"
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
    else
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
    endif
  endif
  return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
  return a:cmd . " " . expand("%:p:h") . "/"
endfunc

" Delete trailing white space
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWS()

set guitablabel=%t

""""""""""""""""""""""""
" Custom functionality "
""""""""""""""""""""""""

""""""""""""""
" File types "
""""""""""""""

if has("autocmd")
  " Set automatic filetype detection to "on"
  filetype on
endif

autocmd BufEnter *.json set filetype=javascript
autocmd BufEnter *.ejs set filetype=html
autocmd BufEnter *.txt set filetype=markdown
autocmd BufEnter *.md set filetype=markdown
