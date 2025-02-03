set encoding=utf8

" use Unix as the standard file type
set ffs=unix,mac

"" set leader key.
let mapleader=","
let g:mapleader=","


" Fast saving and quitting
nmap <leader>w :w!<cr>
nmap <leader>wq :wq!<cr>
imap <leader>wq <Esc>:wq!<cr>


" (useful for handling the permission-denied error)
command Sudow w !sudo tee % > /dev/null

" Set 7 lines to the cursor - when moving vertically using j/k
set scrolloff=7

" Turn on the WiLd menu
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store


" height of the command bar
set cmdheight=1

" disable '-- INSERT --' indicator
set noshowmode


" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"" netrw configuration
"" remove header from netrw.
let g:netrw_banner    = 0
" " tree list view
let g:netrw_liststyle = 3
" " nerdtree-like config.
let g:netrw_altv = 1
let g:netrw_winsize = 25


"" enable undofile. TODO: is this command alone enough?
set undofile

" syn on. TODO: what does this do?
set conceallevel=0


" automatically change working directory to the currently open file.
set autochdir

set complete+=k


"" yank and paste from global register/system clipboard using ctrl+y and ctrl+p
set clipboard+=unnamedplus
xnoremap <silent> p p:let @"=@0<CR>


"""" enable/disable search highlighting
" set hlsearch
""" remove search highlighting using <leader><space>
nmap <leader><space> :noh<cr>


""" press * or # to jump to next/previous occurrence of word under cursor.
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

let l:pattern = escape(@", "\\/.*'$^~[]")

let l:pattern = substitute(l:pattern, "\n$", "", "")

if a:direction == 'gv'
    call CmdLine("Ack '" . l:pattern . "' " )
elseif a:direction == 'replace'
    call CmdLine("%s" . '/'. l:pattern . '/')
endif

let @/ = l:pattern
let @" = l:saved_reg
endfunction

""" return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" set to auto update when a file is changed from the outside
set autoread


""" smart indent
set si
""" wrap lines
set wrap
""" auto indent
set ai

set number relativenumber
set cursorline

""" set theme
set background=dark

let g:gruvbox_italic=1
let g:gruvbox_contrast_dark="soft"
let g:gruvbox_improved_warnings=0
colo gruvbox


" Show matching brackets when text indicator is over them
" How many tenths of a second to blink when matching brackets.
set mat=2
set showmatch

""" A buffer becomes hidden when it is abandoned
" set hid


" sets how many lines of history VIM has to remember
set history=500

filetype plugin indent on
