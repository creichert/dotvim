" This must be first, because it changes other options as a side effect.
set nocompatible

" Pathogen
execute pathogen#infect()
" System vimrc can turn filetype plugin on before setup.
filetype off
syntax on
filetype plugin on

set undofile                " Save undo's after file closes
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

set backspace=indent,eol,start
set backup		" keep a backup file
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set smartindent
set cindent
set tabstop=4
set shiftwidth=4
set expandtab
"set smarttab
set number
"set foldmethod=syntax

" Close everything at once.
map Q :wqall<CR>

" Format a paragraph to 80 char lins
map \fp  gqap<CR>

" Vertical split and open dir
map :vs   :vsplit .<CR>

map <TAB> :tabnext<CR>

" setup .clang_complete
map \cp :!clang_complete_gen

" Make
map m :make

map f <C-]>
map F <]C-]>
map s <C-t>

set pumheight=20
set tags=./tags,tags;$HOME

autocmd BufEnter *.md exe 'noremap <F5> :!start chromium %:p<CR>'

" NERDTree config
" autocmd VimEnter * NERDTree
nmap <F2> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\env', '\~$', '\.pyc$', '\.swp$', '^dist$', '^build$', '_darcs', 'tags']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\~$']
let NERDTreeShowBookmarks=1
let NERDTreeHightlightCursorline=1
map b :Bookmark 
nmap <leader>n :NERDTreeToggle<cr>

" QML support.
au BufNewFile,BufRead *.qml set filetype=qml

" Colors
:hi Directory guifg=#FF0000 ctermfg=red
set t_Co=256

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END


endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

