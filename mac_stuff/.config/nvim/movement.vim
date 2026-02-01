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

""" easier multiline insert/append while in visual mode
vmap i I
vmap a A


""" disable Enter key from moving down one line in normal mode.
nmap <CR> <Nop>


" ignore case when searching
set ignorecase
set wildignorecase


" case sensitive search when one or more characters in search string
" is upper case; else case insensitive.
set smartcase
" makes search act like search in modern browsers.
set incsearch
