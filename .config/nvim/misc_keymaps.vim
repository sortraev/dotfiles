" enter normal mode using shift+tab instead of escape.
imap <s-tab> <Esc>
vmap <s-tab> <Esc>
nmap <s-tab> <Esc>

"" enter normal mode using Ctrl+c instead of escape.
imap <c-q> <Esc>
vmap <c-q> <Esc>
nmap <c-q> <Esc>



nmap <A-c> :set cursorcolumn!<cr>
nmap <A-C> :set cursorline!<cr>


""" remove default keyinding of Shift-k to
""" man-page-lookup of word under cursor.
map <S-k> <Nop>

""" easy begin/end wrapping of words in latex
nmap <leader>be lbi\begin{<Esc>lyeea}<CR>\end{<Esc>pa}<Esc>

let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            " set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

" Toggle terminal on/off (neovim)
nnoremap <C-t> :call TermToggle(24)<CR>
inoremap <C-t> <Esc>:call TermToggle(24)<CR>
tnoremap <C-t> <C-\><C-n>:call TermToggle(24)<CR>

" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>
