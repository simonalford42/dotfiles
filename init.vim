" neovim settings for vscode

set relativenumber

" use system clipboard: https://stackoverflow.com/a/8757876/4383594
set clipboard=unnamedplus

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
" disabled to avoid conflicting with copilot!
" nnoremap <TAB> >>

nnoremap <silent> <CR> :<C-u>call append(line("."),   repeat([""], v:count1))<CR>

" LEADER REMAPPINGS.
" Wasn't sure how to get leader working in vscode neovim, so just hard-coding space.

" <Leader> enter adds new line above
nnoremap <silent> <SPACE><CR> :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>

" indent to parentheses above
" note: does not work if there's not whitespace
noremap <SPACE>i k0yf(j^hv0p:s/\%V./ /g<CR>

" indent to line above's indentation
noremap <SPACE>o k0y^j^hv0pv0<ESC>:s/\%V./ /g<CR>:noh<CR>

" make print statement for yanked variable at current line
noremap <SPACE>p oprint(f'<ESC>pa={<ESC>pa}')<ESC>
" noremap <SPACE>p oprint(f'{<ESC>pa=}')<ESC>

" make shape print statement for yanked variable at current line
noremap <SPACE>q oprint(f'{<ESC>pa.shape=}')<ESC>

" repeat last macro
noremap <SPACE>r @@

" put a python comment above the line, instead of at end of line.
" extra work needed to delete trailing whitespace.
noremap <SPACE># ma$F#DV:s/\s\+$//e<CR>O<C-R>"<ESC>`a

noremap <silent> <SPACE>6 :set hlsearch!<CR>

nnoremap <SPACE>] i<CR><ESC>k$

" toggle hlsearch
noremap <silent> <SPACE>6 :set hlsearch!<CR>

" g remappings. For more code/python related stuff but not strict.

" open vimrc TODO not working?
" noremap gb :e ~/dotfiles/init.vim<CR>

" go to definition
noremap gd <Cmd>call VSCodeNotify('editor.action.revealDefinition')<CR>

" source vimrc
noremap gm :so ~/dotfiles/init.vim<CR>:echo "sourced ~/dotfiles/init.vim"<CR>

" bash shebang
noremap gs i#!/usr/bin/env bash<ESC>

noremap gt :!mv <C-R>% ~/trash/ <CR>:bp\|bd #<CR>:echo "moved file to trash"<CR>:bn<CR>

" https://neovim.io/doc/user/lua.html#lua-highlight
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=52})
augroup END

" comment lines
noremap <SPACE>c <Cmd>call VSCodeNotify('editor.action.commentLine')<CR>
" moving to tabs
noremap <SPACE>a <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex1')<CR>
noremap <SPACE>s <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex2')<CR>
noremap <SPACE>d <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex3')<CR>
noremap <SPACE>f <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex4')<CR>
noremap <SPACE>g <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex5')<CR>
noremap <SPACE>h <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex6')<CR>
noremap <SPACE>j <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex7')<CR>
noremap <SPACE>k <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex8')<CR>
noremap <SPACE>l <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex9')<CR>
noremap <SPACE>; <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex10')<CR>

" help
" https://stackoverflow.com/questions/2483849/detect-if-a-key-is-bound-to-something-in-vim
" https://vim.fandom.com/wiki/Unused_keys
