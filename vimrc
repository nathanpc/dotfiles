"" My Vim configuration.
"" Author: Nathan Campos <nathanpc@dreamintech.net>

set nocompatible  " Must be iMproved.
filetype off      " required by Vundle.
set encoding=UTF-8

""
"" Vundle Package Manager
""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle itself.
Plugin 'VundleVim/Vundle.vim'

" Colorschemes.
Plugin 'chriskempson/base16-vim'
Plugin 'luochen1990/rainbow'

" Languages.
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Plugin 'StanAngeloff/php.vim'
Plugin '2072/PHP-Indenting-for-VIm'
Plugin 'captbaritone/better-indent-support-for-php-with-html'
Plugin 'skammer/vim-css-color'
Plugin 'mattn/emmet-vim'
Plugin 'alvan/vim-closetag'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'gagbo/vim-gnuplot'
Plugin 'jvirtanen/vim-octave'
Plugin 'chrisbra/csv.vim'
Plugin '1995parham/vim-spice'
Plugin 'wlangstroth/vim-racket'
Plugin 'nickng/vim-scribble'
Plugin 'vim-python/python-syntax'
Plugin 'Vimjas/vim-python-pep8-indent'

" Git integration.
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Auto-complete.
Plugin 'Valloric/YouCompleteMe'
Plugin 'Raimondi/delimitMate'

" Fuzzy finder.
Plugin 'ctrlpvim/ctrlp.vim'

" NERDTree.
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Syntax checker.
Plugin 'vim-syntastic/syntastic'

" Powerline.
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Last ones.
Plugin 'ryanoasis/vim-devicons'

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
set splitbelow
set splitright

if has("gui_running")
	set lines=55 columns=80

	if has("gui_win32")
		" Windows font.
		set guifont=Liberation_Mono:h9:cANSI:qDRAFT
	elseif has("gui_gtk2") || has("gui_gtk3")
		" Linux font.
		set guifont=LiterationMono\ Nerd\ Font\ 10
	endif
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
set modeline

""
""  Indentation options.
""
set shiftwidth=4
set tabstop=4
set smartindent
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
au! BufNewFile,BufRead *.cir set filetype=spice
au! BufReadPost *.rkt,*.rktl set filetype=racket
au! BufNewFile,BufRead *.scrbl set filetype=scribble
au! BufNewFile,BufRead *.gnu,*.plt,*.gpi,*.gih,*.gp,*.gnuplot set filetype=gnuplot
au! BufNewFile,BufRead *.m,*.oct set filetype=octave
au! BufNewFile,BufRead *.csv,*.dat set filetype=csv

""
"" Specific options.
""
au filetype racket set lisp
au filetype racket set expandtab
let g:csv_autocmd_arrange = 1  " Auto arrange columns in a CSV file.
let g:python_highlight_all = 1

""
""  Backup
""
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

""
"" Key mapping.
""
" Ctrl-Shift-Classics
map <C-S-v> "*]p
map <C-S-c> "*yy
map <C-S-x> "*c

""
"" Pseudo-tabs (vim-airline) navigation.
""
" Ctrl-T New tab.
map <C-t> :enew<CR> 
" Ctrl-X Close tab.
map <C-x> :bp <BAR> bd #<CR>
" Ctrl-[ Previous tab. (apparently same as ESC *facepalm*)
"map <C-[> :bprevious<CR>
" Ctrl-] Next tab.
map <C-]> :bnext<CR>

""
"" Plugin configurations.
""

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" delimitMate
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" CSS3 Syntax
augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
augroup END

" Rainbow Parenthesis.
let g:rainbow_active = 1

" PHP
" Coloring PHP documentation in comments.
function! PhpSyntaxOverride()
  " Put snippet overrides in this function.
  hi! link phpDocTags phpDefine
  hi! link phpDocParam phpType
endfunction

" Override the PHP file type.
augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

