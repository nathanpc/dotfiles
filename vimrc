"" My Vim configuration.
"" Author: Nathan Campos <nathanpc@dreamintech.net>

set nocompatible  " Must be iMproved.
filetype off      " required by Vundle.

""
"" Vundle Package Manager
""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle itself.
Plugin 'VundleVim/Vundle.vim'

" Colorschemes.
Plugin 'chriskempson/base16-vim'

call vundle#end()
filetype plugin indent on


""
""  UI
""
set title
set ruler
set laststatus=2
"set visualbell
set mouse=a
"set cmdheight=2
set number
set cul
set guioptions-=T
colorscheme base16-tomorrow-night

if has("gui_running")
	set lines=55 columns=80
	set guifont=LiterationMono\ Nerd\ Font\ 10
endif


""
""  Usability
""
set ignorecase
set smartcase
set backspace=indent,eol,start
set whichwrap+=<,>,h,l,[,]
set notimeout ttimeout ttimeoutlen=200
set pastetoggle=<F11>
"set nostartofline
set confirm
set history=1000
set clipboard=unnamedplus

""
""  Indentation options.
""
set shiftwidth=4
set tabstop=4
set autoindent

""
""  Must-have options.
""
filetype indent plugin on
syntax on
set hidden
"set autowriteall
set wildmenu
set showcmd
set hlsearch
set incsearch

""
""  Syntax
""
"au! BufNewFile,BufRead *.cir set filetype=spice
"au! BufReadPost *.rkt,*.rktl set filetype=racket
"au! BufNewFile,BufRead *.scrbl set filetype=scribble
"au! BufNewFile,BufRead *.gnu,*.plt,*.gpi,*.gih,*.gp,*.gnuplot set filetype=gnuplot
"au! BufNewFile,BufRead *.m,*.oct set filetype=octave
"au! BufNewFile,BufRead *.csv,*.dat set filetype=csv
"let g:rainbow_active = 1  " Rainbow Parenthesis.
"let g:csv_autocmd_arrange = 1  " Auto arrange columns in a CSV file.

""
"" Specific options.
""
au filetype racket set lisp
au filetype racket set expandtab

""
""  Backup
""
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

""
"" Key mapping.
""
vmap <C-c> "+y
map  <C-v> "+p
vmap <C-v> "+p
imap <C-v> <esc><C-v>

