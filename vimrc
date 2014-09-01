"" My .vimrc
"" Author: Nathan Campos <nathanpc@dreamintech.net>

set nocompatible

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
colorscheme Tomorrow-Night

if has("gui_running")
	set lines=55 columns=80
	set guifont=Monaco\ 9
endif

" Powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

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
au BufNewFile,BufRead *.cir set filetype=spice
au BufReadPost *.rkt,*.rktl set filetype=racket
au BufNewFile,BufRead *.scrbl set filetype=scribble
au BufNewFile,BufRead *.gnu,*.plt,*.gpi,*.gih,*.gp,*.gnuplot set filetype=gnuplot
let g:rainbow_active = 1  " Rainbow Parenthesis.

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
""  Pathogen
""
execute pathogen#infect()
