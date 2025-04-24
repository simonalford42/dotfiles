" for pathogen plugin manager execute pathogen#infect()
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
set cc=100 " show a vertical line at 80 characters.
set list " show hidden characters

"add tab, trailing whitespace as hidden chars to show
set listchars=tab:>-,trail:_
" add tab as hidden char to show
" set listchars=tab:>-,

let mapleader=" " "set spacebar to the leader
set linebreak " wrap lines at new words
" let $BASH_ENV = "~/.vim/vim_bash" " use bash commands in shell
" maybe this will work?
" let $BASH_ENV = "/usr/bin/bash"

let g:tex_flavor = "latex"
set tw=99 fo=cqtnlj wm=0 " start a new line after 99 characters.
set visualbell " turn on visual bell so that set t_vb turns off flashing at
set t_vb= " this is supposed to be blank


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

" no line wrapping for bash
autocmd FileType sh set tw=0

" Restore default behaviour when leaving Vim.
autocmd VimLeave * silent !stty ixon

autocmd FileType ocaml set commentstring=(*\ %s\ *)

" for yank highlighted text
if !exists('##TextYankPost')
   map y <Plug>(highlightedyank)
endif

function! HLLine(blinktime)
    set invcursorline
    set invcursorcolumn
    redraw
    exec 'sleep ' . float2nr(a:blinktime*1000) . 'm'
    set invcursorline
    set nocursorcolumn
    redraw
endfunction

" Allow us to use Ctrl-s and Ctrl-q as keybinds
silent !stty -ixon

" COMMANDS

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

" PLUGINS
let g:tagbar_width=70 " tag bar width
let g:tagbar_zoomwidth=80 " tag bar width when zoomed via x
let g:tagbar_compact=1 "compactify the tag bar
let g:tagbar_indent=1
let g:tagbar_show_line_numbers=2 "relative line numbers
let g:tagbar_singleclick=1 " jump by a single clikc
let g:tagbar_sort=1 " don't sort alphabetically
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
let g:buftabline_asdf=1
let g:buftabline_separators=1
let g:buftabline_plug_max = 13
let g:highlightedyank_highlight_duration = 52
let g:netrw_dirhistmax = 0 " don't save history in .netrwhist file
let g:ctrlp_map = '<C-P>'
let g:ctrlp_cmd = 'CtrlP'
let g:surround_no_mappings=1 " customize surround mappings
nmap d<LEADER>2  <Plug>Dsurround
nmap c<LEADER>2  <Plug>Csurround
nmap c<LEADER>3  <Plug>CSurround
nmap y<LEADER>2  <Plug>Ysurround
nmap y<LEADER>3  <Plug>YSurround
nmap y<LEADER>22 <Plug>Yssurround
nmap y<LEADER>32 <Plug>YSsurround
nmap y<LEADER>33 <Plug>YSsurround
xmap <LEADER>3   <Plug>VSurround
xmap g<LEADER>3  <Plug>VgSurround
