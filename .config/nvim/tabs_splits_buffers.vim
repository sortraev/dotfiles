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

" open new splits with alt+shift+{j, l}.
nnoremap <A-J> :sp<cr>
nnoremap <A-L> :vsp<cr>
map <A-l> <C-W>l
map <A-j> <C-W>j
map <A-k> <C-W>k
map <A-h> <C-W>h


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

" only show tab bar when more than one tabs open
set showtabline=1


" don't close window when deleting a buffer
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
