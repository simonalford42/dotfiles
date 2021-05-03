" for pathogen plugin manager execute pathogen#infect()
" testing changes
let g:pathogen_disabled = []
call pathogen#infect()
filetype off
syntax on
filetype plugin indent on

" fundamental options
set nocompatible "needed to run plugins?
set t_Co=256 " for color support in vim, not sure if needed with solarized
set hidden " allow changing buffers without saving
" set autochdir " set vim working directory to that of currently edited file

set number " show line numbers
set relativenumber "show relative line numbers. with both, keeps line # at 0
set mouse=a " allow mouse to be used
" allows scrolling in iTerm?
if has("mouse_sgr") " from  https://stackoverflow.com/questions/32103591/vim-cant-scroll-in-iterm2 now it's fine
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

set noshowmode " don't show --INSERT--
set timeoutlen=1000 ttimeoutlen=05 " to make escaping insert mode faster.

set tabstop=4 " set number of spaces in tab
set shiftwidth=4 " set shift width
set softtabstop=4 " backspacing on a pseudotab will delete this
set expandtab " turn tabs into spaces
set laststatus=2 "keep the status line up even if only one window

set bg=dark "dark style
colo solarized " solarized color scheme
hi Normal guibg=NONE ctermbg=NONE

set backspace=indent,eol,start " backspace functionality
set cc=80 " show a vertical line at 80 characters.
set list " show hidden characters
set listchars=tab:>-,trail:_ "add tab as hidden char to show. Not sure if I want trailing spaces shown.
let mapleader=" " "set spacebar to the leader
set linebreak " wrap lines at new words
let $BASH_ENV = "~/.vim/vim_bash" " use bash commands in shell
let g:tex_flavor = "latex"
set tw=79 fo=cqtnlj wm=0 " start a new line after 80 characters.
set visualbell " turn on visual bell so that set t_vb turns off flashing at
set t_vb= " this is supposed to be blank
set iskeyword-=_ " underscores act like new words. trying it out.


" make the status line for foreground winfow bright red. The ctermbg, ctermfg colors can be found by running ~/Documents/bash/test_colors.sh
highlight StatusLine cterm=NONE ctermbg=3 ctermfg=8 gui=underline guibg=#ffffff guifg=#d70000
highlight BufTabLineCurrent cterm=underline ctermbg=14 ctermfg=8 gui=underline guibg=#ffffff guifg=#d70000
"highlight BufTabLineHidden cterm=underline ctermbg=6 ctermfg=10 gui=underline guibg=#ffffff guifg=#d70000
highlight BufTabLineActive cterm=None ctermbg=10 ctermfg=8 gui=underline guibg=#ffffff guifg=#d70000
highlight CursorLineNr cterm=None ctermbg=12 ctermfg=8 gui=None guibg=#ffffff guifg=#d70000
highlight StatusLineNC cterm=NONE ctermbg=12 ctermfg=8 gui=underline guibg=#ffffff guifg=#d70000
hi StatusLine cterm=NONE ctermbg=1 ctermfg=8 gui=NONE guibg=#ffffff guifg=#d70000
hi CursorLine cterm=None ctermbg=0 gui=None guibg=#ffffff guifg=#d70000
hi CursorColumn cterm=None ctermbg=0 gui=None guibg=#ffffff guifg=#d70000

"Autocmds:

" on openmind, don't go to the most recent line upon opening file
if $HOSTNAME == "openmind7"
    au! redhat BufReadPost
endif

" for sketch syntax
au BufRead,BufNewFile *.sk set syntax=sketch
au BufRead,BufNewFile *.sk set filetype=java

augroup Inserting
    autocmd!
    autocmd InsertEnter * highlight StatusLine cterm=NONE ctermbg=4 ctermfg=8 gui=underline gui=NONE guibg=#ffffff guifg=#d70000
    " Revert Color to default when leaving Insert Mode
    autocmd InsertLeave * highlight StatusLine cterm=NONE ctermbg=1 ctermfg=8 gui=underline gui=NONE guibg=#ffffff guifg=#d70000
    autocmd InsertLeave * write " might slow things down a bit
augroup END

augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

" latex current file
autocmd FileType tex,latex noremap <buffer> gl :w<CR>:!latte %<CR>
" autocmd FileType tex,latex noremap <buffer> gb :w<CR>:!latte2 %<CR>

autocmd Filetype scheme set tabstop=2
autocmd Filetype scheme set shiftwidth=2
autocmd Filetype scheme set softtabstop=2

" no line wrapping for bash
autocmd FileType sh set tw=0

" Restore default behaviour when leaving Vim.
autocmd VimLeave * silent !stty ixon

" run python checker
" autocmd BufWritePost *.py call flake8#Flake8()

" set yapf as formatter for python
" doesn't seem to be working though :(
" autocmd FileType python setlocal formatprg=yapf

" latex file upon saving.
" autocmd BufWritePost *.tex FileType tex,latex noremap <buffer> gl :w<CR>:!latte %<CR>
autocmd FileType ocaml set commentstring=(*\ %s\ *)

" augroup remember_folds
"  autocmd!
"  au BufWinLeave ?* mkview 1
"  au BufWinEnter ?* silent! loadview 1
" augroup END

" for yank highlighted text
if !exists('##TextYankPost')
   map y <Plug>(highlightedyank)
endif

" REMAPPINGS
" double clicking highlights word, yanks to register
nnoremap <silent> <2-LeftMouse> :let @/='\V\<'.escape(expand('<cword>'),'\').'\>'<cr>:set hls<cr>:let @"=expand('<cword>')<cr>

" add parenthesis to end of line while in insert mode
inoremap <C-B> <ESC>A)<ESC>

" make it easier to yank to system register
noremap K "*
" since s and s are redundant, map to start and end of line.
noremap s ^
noremap S $
noremap gs g^
noremap gS g$

" switch colon and semicolon keys in normal mode
noremap ; :
noremap : ;

function! HLLine(blinktime)
    set invcursorline
    set invcursorcolumn
    redraw
    exec 'sleep ' . float2nr(a:blinktime*1000) . 'm'
    set invcursorline
    set nocursorcolumn
    redraw
endfunction

" close buffer while leaving split open
" cnoremap bs bp\|bd #
" old Y was a synonym for yy, this gives parallelism with C and D behavior
map Y y$


" move line down or up; maintain selection
vnoremap <C-J> :move +1<CR>gv
vnoremap <C-K> :move -2<CR>gv

"make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv
" ctrl-S saves all and escapes
" note: if ctrl-S and ctrl-Q aren't working, see
" https://vi.stackexchange.com/questions/2419/mapping-ctrls-does-not-work
inoremap <C-S> <ESC>:wa<CR>
nnoremap <C-S> :wa<CR>
" C-S stopped working for me, so I'm switching to this
" inoremap <C-H> <ESC>:wa<CR>
" nnoremap <C-H> :wa<CR>

" this is also giving me issues, so turning off :(
"inoremap <ESC> <ESC>:wa<CR>
" this just started causing my issues with keys getting pressed when I open vim
" nnoremap <ESC> :wa<CR>

" next and previous buffer
nnoremap <silent> <C-K> :<C-U>execute v:count1 . "bn"<CR>
nnoremap <silent> <C-J> :<C-U>execute v:count1 . "bp"<CR>
nnoremap <C-Q> :bp\|bd #<CR>
nnoremap <C-N> :call HLLine(0.1)<CR>

" give basic keys some functionality in normal mode
nnoremap <BS> <<
nnoremap <TAB> >>
nnoremap <silent> <CR> :<C-u>call append(line("."),   repeat([""], v:count1))<CR>

" LEADER REMAPPINGS.

noremap <LEADER>a :e ~/.vim/clip.txt<CR>:%d<CR>"0P:w<CR>:bd<CR>:echo "copied clipboard to ~/.vim/clip.txt"<CR>

" <Leader> enter adds new line above
nnoremap <silent> <LEADER><CR> :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>
" comment line
nmap <LEADER>c gcc
vmap <LEADER>c gc

noremap <LEADER>d :DelTrailWhite<CR>

" in python, search function you're inside's name
nmap <LEADER>e [[w*

noremap <LEADER>f :call flake8#Flake8()<CR>

" toggle hlsearch
noremap <silent> <LEADER>h :set hlsearch!<CR>
" indent to parentheses above
noremap <LEADER>i k0yf(j^hv0pv0<ESC>:s/\%V./ /g<CR>:noh<CR>

" make an enumerate clause for latex
noremap <LEADER>le o\begin{enumerate}[label=(\alph*)]<ESC>o<ESC>I\item<ESC>o<ESC>I\end{enumerate}<ESC>kA
" run mypy type checker
noremap <LEADER>m :!./mypy.sh<CR>

" indent to line above's indentation
noremap <LEADER>o k0y^j^hv0pv0<ESC>:s/\%V./ /g<CR>:noh<CR>

" make print statement for yanked variable at current line
noremap <LEADER>p oprint(f"<ESC>pa: {<ESC>pa}")<ESC>

" paste stuff
noremap <LEADER>q :set paste<CR>"*p:set nopaste<CR>
" repeat last macro
noremap <LEADER>r @@
" compare swap file and original
noremap <LEADER>dg <C-w>o:sav! ~/.vim/.recovered<CR>:vs<CR><C-w>w:bn<CR>
noremap <LEADER>df :windo diffthis<CR>
noremap <LEADER>do :windo diffoff<CR>

" run yapf
noremap <LEADER>y ma:0,$!yapf<CR>:w<CR>`a

" copy file into temp file
noremap <LEADER>z :%y<CR>:e ~/.vim/temp.txt<CR>:%d<CR>"0p

function! ToggleTW()
    if &tw
        set tw=0
    else
        set tw=80
    endif
    echo 'tw ='&tw
endfunction

" toggle line wrapping while in insert mode
inoremap <C-H> <C-O>:call ToggleTW()<CR>
noremap <C-H> :call ToggleTW()<CR>

" put a python comment above the line, instead of at end of line.
" extra work needed to delete trailing whitespace.
noremap <LEADER># ma$F#DV:s/\s\+$//e<CR>O<C-R>"<ESC>`a

command! DelTrailWhite :%s/\s\+$//e


" go to buffer
nmap <LEADER>1 <Plug>BufTabLine.Go(1)
nmap <LEADER>2 <Plug>BufTabLine.Go(2)
nmap <LEADER>3 <Plug>BufTabLine.Go(3)
nmap <LEADER>4 <Plug>BufTabLine.Go(4)
nmap <LEADER>5 <Plug>BufTabLine.Go(5)
nmap <LEADER>6 <Plug>BufTabLine.Go(6)
nmap <LEADER>7 <Plug>BufTabLine.Go(7)
nmap <LEADER>8 <Plug>BufTabLine.Go(8)
nmap <LEADER>9 <Plug>BufTabLine.Go(9)
nmap <LEADER>0 <Plug>BufTabLine.Go(10)
nmap <LEADER>- <Plug>BufTabLine.Go(11)
nmap <LEADER>= <Plug>BufTabLine.Go(12)
nmap <LEADER><BS> <Plug>BufTabLine.Go(13)
nmap <LEADER>\ <Plug>BufTabLine.Go(14)
nmap <LEADER>] <Plug>BufTabLine.Go(15)
nmap <LEADER>[ <Plug>BufTabLine.Go(16)

" g remappings. For more code/python related stuff but not strict.
" open vimrc
noremap gb :e $MYVIMRC<CR>
" open/close tag bar
noremap <silent> gH :TagbarToggle<CR>
" move focus to tag bar
noremap <silent> gh :TagbarOpen fj<CR>:set relativenumber<CR>
" source vimrc
noremap gm :so $MYVIMRC<CR>


" Allow us to use Ctrl-s and Ctrl-q as keybinds
silent !stty -ixon

" COMMANDS

" Remove a file. not recommended, should move to ~/trash/ using bash instead.
"command! -complete=file -nargs=1 Remove :echo 'Remove: '.'<f-args>'.' '
"            \.(delete(<f-args>) == 0 ? 'SUCCEEDED' : 'FAILED')
" Clear all previous mappings
command! Mapclearr :mapclear | mapclear <buffer> | mapclear!
            \| mapclear! <buffer>
" clear previous mappings, source vimrc
command! Vimrc :mapclear | mapclear <buffer> | mapclear! | mapclear! <buffer>
            \| so $MYVIMRC
command! DelTrailWhite :%s/\s\+$//e
" switch from 2 spaces to 4 and back
command! ToFourSpaces :set ts=2 sts=2 noet | retab! | set ts=4 sts=4 et
            \| retab
command! ToTwoSpaces :set ts=4 sts=4 noet | retab! | set ts=2 sts=2 et | retab
command! Flake call flake8#Flake8()
command! Hits %g!/Hits/d



" PLUGINS

let g:tagbar_width=40 " tag bar width
let g:tagbar_zoomwidth=80 " tag bar width when zoomed via x
let g:tagbar_compact=1 "compactify the tag bar
let g:tagbar_indent=1
let g:tagbar_show_line_numbers=2 "relative line numbers
let g:tagbar_singleclick=1 " jump by a single clikc
let g:tagbar_sort=0 " don't sort alphabetically
let g:tagbar_wrap=1 " wrap tags if they go past width
let g:netrw_liststyle = 4 " file navigator default view
let g:netrw_banner = 0 " don't show the header for file navigator
let g:netrw_winsize = 25 "file navigator width is 25% of page
let g:netrw_list_hide = '^\./$' " for hiding ./ I think
let g:netrw_bufsettings = 'noma nomod ro'
let ghregex='\(^\|\s\s\)\zs\.\S\+'
let g:netrw_list_hide.=',' . ghregex
let g:netrw_hide = 1
let g:buftabline_numbers=2
let g:buftabline_separators=1
let g:buftabline_plug_max = 13
let g:highlightedyank_highlight_duration = 52
let g:netrw_dirhistmax = 0 " don't save history in .netrwhist file
let g:ctrlp_map = '<C-P>'
let g:ctrlp_cmd = 'CtrlP'
let g:surround_no_mappings=1 " customize surround mappings
nmap d<LEADER>s  <Plug>Dsurround
nmap c<LEADER>s  <Plug>Csurround
nmap c<LEADER>S  <Plug>CSurround
nmap y<LEADER>s  <Plug>Ysurround
nmap y<LEADER>S  <Plug>YSurround
nmap y<LEADER>ss <Plug>Yssurround
nmap y<LEADER>Ss <Plug>YSsurround
nmap y<LEADER>SS <Plug>YSsurround
xmap <LEADER>S   <Plug>VSurround
xmap g<LEADER>S  <Plug>VgSurround

" Terminal prefs

" help
" https://stackoverflow.com/questions/2483849/detect-if-a-key-is-bound-to-something-in-vim
" https://vim.fandom.com/wiki/Unused_keys
"
" If you need high contrast color scheme:
" Go to Terminal preferences and make Bright the default. Open a new tab, and
" set colo Delek. Also increase the font size a bit.
