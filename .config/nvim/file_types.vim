
autocmd BufNewFile,BufRead *.tex set filetype=tex

autocmd FileType haskell,markdown colorscheme everforest

autocmd BufNewFile,BufReadPost *.asm,*.s,*.disasm set filetype=asm
autocmd FileType asm set formatoptions+=cro

autocmd BufNewFile,BufReadPost *.gdb set filetype=gdb

autocmd FileType markdown 
    \ set formatoptions-=q |
    \ set formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\|^\\s*\[-*+]\\s\\+

