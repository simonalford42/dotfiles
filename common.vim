set relativenumber "show relative line numbers. with both, keeps line # at 0

"make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

" since s and s are redundant, map to start and end of line.
noremap s ^
noremap S $
noremap gs g^
noremap gS g$

" switch colon and semicolon keys in normal mode
noremap ; :
noremap : ;

" old Y was a synonym for yy, this gives parallelism with C and D behavior
map Y y$

" add parenthesis to end of line while in insert mode
inoremap <C-B> <ESC>A)<ESC>

nmap <S-tab> <<
