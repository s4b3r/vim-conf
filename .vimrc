" Turn on line numbering. Turn it off with "set nonu"
set nu

" set syntax on
syntax on

" Ruler rules, shows you stuff at the bottom of screen.
set ruler

" Show all them incomplete commands.
set showcmd

" Indent automatically depending on filetype
filetype indent on
set autoindent

" Case insensitive search
set ic

" Highlight search
set hls

" Wrap text instead of being on one line
set lbr

" Change colorscheme from default to delek
colorscheme delek


set noswapfile " no swapfiles

" more tab
set tabstop=4
set shiftwidth=4


inoremap ( ()<Esc>:call BC_AddChar(")")<CR>i
inoremap { {<CR>}<Esc>:call BC_AddChar("}")<CR><Esc>kA<CR>
inoremap [ []<Esc>:call BC_AddChar("]")<CR>i
inoremap " ""<Esc>:call BC_AddChar("\"")<CR>i
inoremap " ""<Esc>:call BC_AddChar("'")<CR>i
" jump out of parenthesis
inoremap <C-j> <Esc>:call search(BC_GetChar(), "W")<CR>a

function! BC_AddChar(schar)
 if exists("b:robstack")
 let b:robstack = b:robstack . a:schar
 else
 let b:robstack = a:schar
 endif
endfunction

function! BC_GetChar()
 let l:char = b:robstack[strlen(b:robstack)-1]
 let b:robstack = strpart(b:robstack, 0, strlen(b:robstack)-1)
 return l:char
endfunction

map <F7> :tabp <CR>
map <F8> :tabn <CR>
