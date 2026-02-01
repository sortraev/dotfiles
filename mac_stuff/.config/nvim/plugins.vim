set nocompatible
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin("~/.config/nvim/bundle")

Plugin 'VundleVim/Vundle.vim'
Plugin 'sheerun/vim-polyglot'
" Plugin 'psliwka/vim-smoothie'

Plugin 'iamcco/markdown-preview.nvim'
" for normal mode
nmap <silent> <F8> <Plug>MarkdownPreview
" for insert mode
imap <silent> <F8> <Plug>MarkdownPreview
" for normal mode
nmap <silent> <F9> <Plug>StopMarkdownPreview
" for insert mode
imap <silent> <F9> <Plug>StopMarkdownPreview

let g:mkdp_browser='/Applications/Firefox.app'
let g:mkdp_theme = 'dark'
set updatetime=100


"""""""""""""""" lightline 
Plugin 'itchyny/lightline.vim'
let g:lightline = {}
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified'] ]
      \ },
      \ }

      " \ 'colorscheme': 'PaperColor',

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
    \ 'opencl': { 'left': '//'},
    \ 'fsharp': { 'left': '//'},
    \ 'fasto': { 'left': '//'},
    \ 'asm':   { 'left': ';'},
    \ 'bib':   { 'left': '%'},
\ }
map <C-e> <plug>NERDCommenterToggle

"" color schemes
Plugin 'sainnhe/forest-night'
Plugin 'morhetz/gruvbox'
Plugin 'NLKNguyen/papercolor-theme'

"" futhark syntax highlighting

Plugin 'nvim-lua/plenary.nvim'

Plugin 'tigion/nvim-asciidoc-preview'

let g:haskell_indent_if=2

call vundle#end()
