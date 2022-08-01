" neovim settings for vscode

" TODO: figure out how to get leader to work
" set spacebar for leader
let mapleader="\<space>"

nmap <S-tab> <<

"make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

" since s and s are redundant, map to start and end of line.
noremap s ^
noremap S $
noremap gs g^
noremap gS g$

" add parenthesis to end of line while in insert mode
inoremap <C-B> <ESC>A)<ESC>

" make it easier to yank to system register
noremap K "*

" switch colon and semicolon keys in normal mode
noremap ; :
noremap : ;

" old Y was a synonym for yy, this gives parallelism with C and D behavior
map Y y$

" give basic keys some functionality in normal mode
nnoremap <BS> <<
nnoremap <TAB> >>
nnoremap <silent> <CR> :<C-u>call append(line("."),   repeat([""], v:count1))<CR>

" LEADER REMAPPINGS.

" <Leader> enter adds new line above
nnoremap <silent> <LEADER><CR> :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>
" break line, but stay at current spot?
nnoremap <LEADER>] i<CR><ESC>k$

" comment line
" nmap <LEADER>c gcc
" vmap <LEADER>c gc

" toggle hlsearch
noremap <silent> <LEADER>6 :set hlsearch!<CR>

" indent to parentheses above
" note: does not work if there's not whitespace
noremap <LEADER>i k0yf(j^hv0p:s/\%V./ /g<CR>

" make an enumerate clause for latex
" noremap <LEADER>le o\begin{enumerate}[label=(\alph*)]<ESC>o<ESC>I\item<ESC>o<ESC>I\end{enumerate}<ESC>kA

" indent to line above's indentation
noremap <LEADER>o k0y^j^hv0pv0<ESC>:s/\%V./ /g<CR>:noh<CR>

" make print statement for yanked variable at current line
noremap <LEADER>p oprint(f"<ESC>pa: {<ESC>pa}")<ESC>

" repeat last macro
noremap <LEADER>r @@

" put a python comment above the line, instead of at end of line.
" extra work needed to delete trailing whitespace.
noremap <LEADER># ma$F#DV:s/\s\+$//e<CR>O<C-R>"<ESC>`a

" g remappings. For more code/python related stuff but not strict.

" open vimrc
noremap gb :e ~/.vim/init.vim<CR>

" source vimrc
noremap gm :so ~/.vim/init.vim<CR>

" bash shebang
noremap gs i#!/usr/bin/env bash<ESC>
noremap gd gdzt

noremap gt :!mv <C-R>% ~/trash/ <CR>:bp\|bd #<CR>:echo "moved file to trash"<CR>:bn<CR>

" reload files
noremap <silent> gr :bufdo! e<CR>

" help
" https://stackoverflow.com/questions/2483849/detect-if-a-key-is-bound-to-something-in-vim
" https://vim.fandom.com/wiki/Unused_keys

" https://neovim.io/doc/user/lua.html#lua-highlight
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=52})
augroup END
