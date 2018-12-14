syntax on

" Keep 1000 items in the history.
set history=1000

" show the cursor position.
set ruler

" show incomplete commands.
set showcmd

" shows a menu when using tab completion.
set wildmenu

set scrolloff=5

set hlsearch
set incsearch

set ignorecase
set smartcase

" turn on line numbering
set number

set backup
" set bex=SOMETHING

set lbr

set ai
set si

color slate

"set bg=light
"set bg=dark

" /home/samirpatelgx/.vim/colors here are where the color schemes go
"map KEY KEYSTROKES
" map <F2> iJohn Smith<CR>123 Main Street<CR>Anytown, NY<CR><ESC>
" map <F3> i<ul><CR><Space><li></li><CR><Esc>0i</ul><Esc>kcit
" map <F4> <Esc>o<li></li><Esc>cit
" 
" 
" 
" map <leader>w :w!

set tabstop=2
set shiftwidth=2
set expandtab
nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>
hi Search ctermbg=Black
hi Search ctermfg=DarkRed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set nocompatible
filetype off

set cursorline


let g:pymode_python = 'python3'

call plug#begin("~/.vim/bundle")
Plug 'junegunn/vim-plug'
Plug 'scrooloose/nerdTree' "Documents tree
Plug 'davidhalter/jedi-vim' "python autocompletion
Plug 'tpope/vim-fugitive' "git integration
Plug 'scrooloose/syntastic' "code syntaxis
Plug 'Raimondi/delimitMate' "automatic closing of quotes, parenthesis...
Plug 'yggdroot/indentline' "Show indent lines (useful for loops)
"Plug 'tmhedberg/SimpylFold' "Python folding
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim',{'as':'dracula'}
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
call plug#end()


