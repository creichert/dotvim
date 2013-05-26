
set tags+=~/.vim/tags/haskell-platform-tags

" try gf on import line, or ctrl-x ctrl-i, or [I, [i, ..
setlocal include=^import\\s*\\(qualified\\)\\?\\s*
setlocal includeexpr=substitute(v:fname,'\\.','/','g').'.'
setlocal suffixesadd=hs,lhs,hsc

"" Key Mappings

nmap <silent> --h "=HaskellModuleHeader()<CR>:0put =<CR>
nmap <silent> --s "=HaskellModuleSection()<CR>gp

" Create tags
map <F8> _ct<CR>

" Show type
map T _t<CR>

" Show info for id under cursor
map I _t<CR>

" Hoogle
map <F12> _?1<CR>

" Reload all type info
map  R :GHCReload<CR>
nmap L :GhciRange<CR>
vmap L :GhciRange<CR>
nmap F :GhciFile<CR>

map <F5> :make<CR>


" This assumes that ghc is in your path, if it is not, or you
" wish to use a specific version of ghc, then please change
" the ghc below to a full path to the correct one
au BufEnter *.hs compiler ghc

" For this section both of these should be set to your
" browser and ghc of choice, I used the following
" two vim lines to get those paths:
" :r!which google-chrome
" :r!which ghc
let g:haddock_browser = "/usr/bin/chromium"
let g:ghc = "/usr/bin/ghc"

let s:width = 80

function! HaskellModuleSection(...)
    let name = 0 < a:0 ? a:1 : inputdialog("Section name: ")

    return  repeat('-', s:width) . "\n"
    \       . "--  " . name . "\n"
    \       . "\n"

endfunction

function! HaskellModuleHeader(...)
    let name = 0 < a:0 ? a:1 : inputdialog("Module: ")
    let note = 1 < a:0 ? a:2 : inputdialog("Note: ")
    let description = 2 < a:0 ? a:3 : inputdialog("Describe this module: ")

    return  repeat('-', s:width) . "\n"
    \       . "-- | \n"
    \       . "-- Module      : " . name . "\n"
    \       . "-- Note        : " . note . "\n"
    \       . "-- \n"
    \       . "-- " . description . "\n"
    \       . "-- \n"
    \       . repeat('-', s:width) . "\n"
    \       . "\n"

endfunction

