set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
set backspace=2
set viminfo='20,<10000

syntax match nonascii "[^\x00-\x7F]"
highlight nonascii guibg=Red ctermbg=2

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'kien/rainbow_parentheses.vim'
Plug 'rhysd/vim-clang-format'
Plug 'rdolgushin/groovy.vim'
Plug 'guns/vim-clojure-highlight'
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-fireplace'
Plug 'jelera/vim-javascript-syntax'
Plug 'maksimr/vim-jsbeautify'
Plug 'elzr/vim-json'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'chase/vim-ansible-yaml', { 'for': 'yaml' }
Plug 'rust-lang/rust.vim'
call plug#end()

syntax on
filetype plugin indent on

setlocal cindent cino=N-s,j1,(0,ws,Ws,g0,h2
let g:vim_json_syntax_conceal = 0
let g:rainbow_active = 1

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:rbpt_colorpairs = [
    \ ['brown',       'SteelBlue2'],
    \ ['lightblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'SteelBlue2'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'SteelBlue2'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['lightblue',    'firebrick3'],
    \ ['darkgreen',   'SteelBlue2'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:clang_format#code_style="llvm"
autocmd FileType c,cpp nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp vnoremap <buffer><Leader>cf :ClangFormat<CR>

let g:config_Beautifier = {
  \ "js": {
    \ "indent_style": "space",
    \ "indent_size": 2,
    \ "max_line_length": 80
  \},
  \ "json": {
    \ "indent_style": "space",
    \ "indent_size": 2,
    \ "max_line_length": 80
  \}
 \}

autocmd FileType javascript noremap <buffer><Leader>cf :call JsBeautify()<cr>
autocmd FileType json noremap <buffer><Leader>cf :call JsonBeautify()<cr>
autocmd FileType jsx noremap <buffer><Leader>cf :call JsxBeautify()<cr>
autocmd FileType html noremap <buffer><Leader>cf :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer><Leader>cf :call CSSBeautify()<cr>
autocmd FileType python nnoremap <buffer><Leader>cf :Black<cr>
autocmd FileType rust nnoremap <buffer><Leader>cf :RustFmt<cr>
