" enter normal mode using shift+tab instead of escape.
imap <s-tab> <Esc>
vmap <s-tab> <Esc>
nmap <s-tab> <Esc>

"" enter normal mode using Ctrl+c instead of escape.
imap <c-c> <Esc>
vmap <c-c> <Esc>


""" remove default keyinding of Shift-k to
""" man-page-lookup of word under cursor.
map <S-k> <Nop>

""" easy begin/end wrapping of words in latex
nmap <leader>be lbi\begin{<Esc>lyeea}<CR>\end{<Esc>pa}<Esc>

