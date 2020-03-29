call plug#begin('~/.vim/plugged')
    Plug 'scrooloose/nerdtree'                                 	" NerdTree
    Plug 'fratajczak/one-monokai-vim'	                        " One Monokai Theme
    Plug 'vim-airline/vim-airline'                            	" Vim AirLine
    Plug 'Raimondi/delimitMate'                             	" Delimit Mate
    Plug 'terryma/vim-multiple-cursors'                         " Muliple Cursor
    Plug 'terryma/vim-smooth-scroll'                            " Smooth Scroll
call plug#end()


" ColorScheme and Font
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1
set termguicolors
colorscheme one_monokai
set guifont=Fira_Code

" Basic Settings
if has("syntax")
    syntax on
endif
set nu
set relativenumber
set mouse=a                     " Allow Mouse Use
let delimitMate_expand_cr=1     " delimitMate
set ruler                       " Show Position of Current Cursor
set ignorecase                  " Ignore Upper or Lower Cases during searching
set hlsearch                    " Highlight Search
set background=dark             " For Syntax Highlight
set nocompatible                " Allow Using Arrow Keys
set fileencodings=utf-8,euc-kr  " File encoding format
set bs=indent,eol,start         " Allow using backspace key
set history=1000                
set nobackup
set showmatch
set nowrap
set wmnu                        " Tab snippet

let g:deoplete#enable_at_startup = 1    " Deoplete.


" INDENT SETTING
set tabstop=4                   " Tab Size
set shiftwidth=4                " Set shift move(>, >>, <, <<)
set softtabstop=4

set expandtab                   " Use Spaces rather Tab
set smarttab

set ai                          " Auto Indent
set si                          " Smart Indent
set cindent                     " C Style Indent

autocmd FileType make setlocal noexpandtab

" 컴파일
function RunFile(filetype, name)
    let str = ':!'
    let str .= 'echo "' . a:name . '"; '
    let str .= 'echo "---- RUN --------------"' . '; '
    if a:filetype=='c'
        let str .= 'gcc *.c; ./a.out 2>&1' . '; '
    elseif a:filetype=='swift'
        let str .= 'swift "' . a:name . '"; '
    else
        let str .= 'echo "지원하지 않는 파일 입니다."; '
    endif
    let str .= 'echo "\n---- END --------------"'
    execute str
endfunction

" 디버그 모드
function DebugRunFile(filetype, name)
    let str = ':!'
    if a:filetype=='c'
        let str .= 'gcc -g *.c; lldb ./a.out' . '; '
    elseif a:filetype=='swift'
        let str .= 'swift "' . a:name . '"; '
    else
        let str .= 'echo "지원하지 않는 파일 입니다."; '
    endif
    execute str
endfunction

map <C-a> ggVG " 전체 선택
map <C-c> "+y  " 복사   
map <C-s> <ESC>:w<CR>
imap <C-s> <ESC>:w<CR>
"map <C-s> <ESC>:Prettier<CR>
"imap <C-s> <ESC>:Prettier<CR>
map <C-S-e> <ESC>:NERDTreeToggle<CR>
imap <C-S-e> <ESC>:NERDTreeToggle<CR>
map <F6> <ESC>:w<CR>:call RunFile(expand('%:e'), expand('%'))<CR>
imap <F6> <ESC>:w<CR>:call RunFile(expand('%:e'), expand('%'))<CR>
map <S-F6> <ESC>:w<CR>:call DebugRunFile(expand('%:e'), expand('%'))<CR>
imap <S-F6> <ESC>:w<CR>:call DebugRunFile(expand('%:e'), expand('%'))<CR>

" vim-multiple-cursor
let g:multi_cursor_use_default_mapping=0
" Default mapping
" Ctrl + n 단어 선택
" Ctrl + p 이전 단어
" Ctrl + x 단어 스킵
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" vim-smooth-scroll
" Ctrl + D, Ctrl + U를 누르면 스크롤이 반페이지정도 내려가거나 올라갑니다. 
" Ctrl + F, Ctrl + B를 누르면 스크롤이 한 페이지정도 내려가거나 올라갑니다. 
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 10, 5)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 10, 5)<CR>
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 10, 3)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 10, 3)<CR>

