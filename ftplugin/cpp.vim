
"C++
"build tags of your own project with <F8>
map <F8> :!ctags -R --sort=yes --fields=+iaS --extra=+qf --sort=foldcase `pwd`<CR>

" Format source file
map \cw gg=G

" Jump to definition
map f <C-]>
map F <]C-]>

" configure tags - add additional tags here or comment out not-used ones
"
" HELP:
" http://en.kioskea.net/faq/2367-the-autocompletion-c-c-in-vim
" http://stackoverflow.com/questions/5626188/ctags-ignore-lists-for-libc6-libstdc-and-boost
"set tags+=~/.vim/tags/stdlibcpp
"set tags+=~/.vim/tags/libqt4

" clang-complete configuration
let g:clang_library_path='/usr/lib/llvm-3.3/lib/'
let g:clang_complete_macros=1
let g:clang_complete_auto=0
let g:clang_auto_select=1
let g:clang_snippets=1
let g:clang_snippets_engine='clang_complete'
let g:clang_complete_copen=1
"let g:clang_user_options='-std=c++11 -stdlib=libc++ -I'
"let g:clang_close_preview=1
"
"let g:SuperTabDefaultCompletionType = "context"

autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"set completeopt=menu,menuone
set completeopt=menu,menuone,longest

" Limit popup menu height
set pumheight=15

