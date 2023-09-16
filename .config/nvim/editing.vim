
""" no double spaces after periods when auto-wrapping
""" (or line-joining with shift-j)
set nojoinspaces

set textwidth=80
set formatoptions=t

""" easy line-wrapping of current paragraph
nmap <leader>gq gqip
vmap <leader>gq gq


""" tab completion
imap <tab> <C-n>
imap <A-tab> <C-p>


" remove trailing whitespace from every line in file.
nmap <leader>tws :%s/\s\+$<CR>:noh<CR>

" treat \( as ( in haskell code in terms of jumping to matching brackets
set cpoptions+=M


" paste in visual mode without overwriting register with the overwritten text
xnoremap p pgvy


" configure backspace so it acts as it should act in insert mode.
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" For regular expressions turn magic on
set magic


" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" width of tab
set shiftwidth=2
set tabstop=4

" Linebreak ??
" set lbr


"" yank and paste from global register/system clipboard using ctrl+y and ctrl+p
set clipboard+=unnamedplus


"" quick make in files
nmap <leader>m :w<CR>:!make<cr>
nmap <leader>M :w<CR>:!make<space>


"" easy exit insert mode while in terminal mode
tnoremap <s-tab> <C-\><C-n>
