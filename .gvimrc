call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'chriskempson/base16-vim'

Plugin 'sainnhe/forest-night'





"" latex specific
" Plugin 'lervag/vimtex'
" let g:tex_flavor = 'tex'
" let g:vimtex_syntax_enabled = 1

" let g:tex_conceal = ""
autocmd BufNewFile,BufRead *.tex set filetype=tex


"""""""""""""""" papercolor
Plugin 'NLKNguyen/papercolor-theme'

Plugin 'sheerun/vim-polyglot'


"""""""""""""""" seoul256


"""""""""""""""" lightline 
" Plugin 'shinchu/lightline-seoul256.vim'
Plugin 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'PaperColor',
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
    \ 'fsharp': { 'left': '//'}
\ }

map <C-e> <plug>NERDCommenterToggle


call vundle#end()


set background=light
" colorscheme PaperColor
" autocmd FileType fsharp,haskell colorscheme PaperColor

set guifont=Monospace\ 12
set linespace=2    " extra linespacing (necessary when using large font size)

set guioptions-=m " remove menu bar
set guioptions-=T " remove tool bar
set guioptions-=r " remove right-hand scroll bar

set norelativenumber

set ft=markdown
