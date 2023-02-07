
" => Plugins (vundle)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'sheerun/vim-polyglot'

Plugin 'psliwka/vim-smoothie'

Plugin 'iamcco/markdown-preview.nvim'
" Plugin 'iamcco/markdown-preview.nvim'
" for normal mode
nmap <silent> <F8> <Plug>MarkdownPreview
" for insert mode
imap <silent> <F8> <Plug>MarkdownPreview
" for normal mode
nmap <silent> <F9> <Plug>StopMarkdownPreview
" for insert mode
imap <silent> <F9> <Plug>StopMarkdownPreview
let g:mkdp_browser='google-chrome-stable'



"""""""""""""""" lightline 
Plugin 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified'] ]
      \ },
      \ }


Plugin 'scrooloose/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 2
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 2
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '//' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
let g:NERDCustomDelimiters = {
    \ 'fut': { 'left': '--'},
    \ 'c': { 'left': '//'},
    \ 'fsharp': { 'left': '//'},
    \ 'fasto': { 'left': '//'},
    \ 'asm':   { 'left': '#'},
    \ 'htmldjango': { 'left': '<!--', 'right': '-->' }
\ }
map <C-e> <plug>NERDCommenterToggle

"" color schemes
Plugin 'sainnhe/forest-night'
Plugin 'morhetz/gruvbox'

call vundle#end()

"" latex specific
autocmd BufNewFile,BufRead *.tex set filetype=tex

"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader=","
let g:mapleader=","

" Fast saving and quitting
nmap <leader>w :w!<cr>
" nmap <leader>wq :wq!<cr>

" (useful for handling the permission-denied error)
command Sudow w !sudo tee % > /dev/null


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set scrolloff=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler
" Height of the command bar
set cmdheight=1

" disable '-- INSERT --' indicator
set noshowmode

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase
set wildignorecase

" When searching try to be smart about cases
set smartcase

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
" How many tenths of a second to blink when matching brackets
set mat=2
set showmatch

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


" Add a bit extra margin to the left
"set foldcolumn=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax on

" 256 colors
set t_Co=256
" set background=light
set background=dark

let g:gruvbox_italic=1
let g:gruvbox_contrast_dark="soft"
let g:gruvbox_improved_warnings=0
colo gruvbox
syntax enable







"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

set encoding=utf8

" use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" width of tab
set shiftwidth=2
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set si "Smart indent
set wrap "Wrap lines
set ai "Auto indent

set number relativenumber
set cursorline
" set cursorcolumn


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" open split windows to the right of currently focused window
set splitright

" highlight all occurrences of word under buffer using search
" map <space> #*
nnoremap <space> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" fast search/replace
nmap <leader>sr :%s/
nmap <leader>gsr :%s//g<Left><Left>
vmap <leader>sr :s/
vmap <leader>gsr :s//g<Left><Left>


" Smart way to move between windows

" open new splits with alt+shift+{j, l}
nnoremap <A-J> :sp<cr>
nnoremap <A-L> :vsp<cr>
map <A-j> <C-W>j
map <A-k> <C-W>k
map <A-h> <C-W>h
map <A-l> <C-W>l


" Save and close the current buffer
map <leader>bd :w<CR>:Bclose<CR>
map <leader>sd :w<CR>:Bclose<CR>

map <leader>twh :set tw=8000<CR>
map <leader>twl :set tw=80<CR>

" Close all the buffers
map <leader>ba :bufdo bd<cr>

" show list of open buffers
map <leader>bs :buffers<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>


map <leader>e :e ./



" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" only show tab bar when more than one tabs open
set showtabline=1

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
" set laststatus=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
" map 0 ^

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete".l:currentBufNum)
   endif
endfunction

" function! CmdLine(str)
"     exe "menu Foo.Bar :" . a:str
"     emenu Foo.Bar
"     unmenu Foo
" endfunction

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

"""" enable/disable search highlighting
set hlsearch

""" remove search highlighting using ,Space
nmap <leader><space> :noh<cr>

""" line-wrap paragraph
nmap <leader>gq gqip
vmap <leader>gq gq

""" no double spaces after periods when auto-wrapping
""" (or line-joining with shift-j)
set nojoinspaces

set textwidth=80
set formatoptions=t
" set formatoptions=c
" set formatoptions-=t

"""" keymaps
" enter normal mode using shift+tab instead of escape.
imap <s-tab> <Esc>
vmap <s-tab> <Esc>
nmap <s-tab> <Esc>
    


"" enter normal mode using Ctrl+c instead of escape.
imap <c-c> <Esc>
vmap <c-c> <Esc>


"" yank and paste from global register/system clipboard using ctrl+y and ctrl+p
set clipboard+=unnamedplus

xnoremap <silent> p p:let @"=@0<CR>

"" filetype specific settings
autocmd FileType haskell,markdown colorscheme everforest


""" 80 character lines and line wrapping for markdown, tex, and txt files
" autocmd FileType markdown,plaintex,tex,text, haskell setlocal textwidth=80
" autocmd FileType markdown,plaintex,tex,text, haskell setlocal formatoptions+=t

""" remove default keyinding of Shift-k to
""" man-page-lookup of word under cursor.
map <S-k> <Nop>

""" quick up/down scrolling with ctrl + {k, j}.
map <C-k> 3k
map <C-j> 3j


""" enter insert at beginning of next word; end of this word; or beginning of
""" this word.
nmap <S-w> wi
nmap <S-e> ea
nmap <S-b> bi

""" select current paragraph under the cursor (or the next, if none under the cursor)
nmap <leader>[] }kV{j$


imap <tab> <C-n>
imap <A-tab> <C-p>



""" easier multiline insert/append while in visual mode
vmap i I
vmap a A


" automatically change directory to the currently open file.
set autochdir

set complete+=k



nmap <CR> <Nop>

" syn on
set conceallevel=0


" set undodir=~/.vim/undodir
" set undofile
" set undolevels=1000
" set undoreload=10000
set undofile



" remove trailing whitespace from every line in file.
nmap <leader>tws :%s/\s\+$<CR>:noh<CR>


" treat \( as ( in haskell code in terms of jumping to matching brackets
set cpoptions+=M

autocmd FileType markdown 
    \ set formatoptions-=q |
    \ set formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\|^\\s*\[-*+]\\s\\+


" remove header from netrw.
let g:netrw_banner    = 0
"
" " tree list view
let g:netrw_liststyle = 3
"
" " open files in new tabs
" let g:netrw_browse_split = 3

" nerdtree-like config.
" let g:netrw_browse_split = 0
let g:netrw_altv = 1
let g:netrw_winsize = 25
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END

tnoremap <s-tab> <C-\><C-n>

nmap <leader>m :w<CR>:!make<cr>
nmap <leader>M :w<CR>:!make<space>

nmap <leader>be wbi\begin{<Esc>lyeea}<CR>\end{<Esc>pa}<Esc>
