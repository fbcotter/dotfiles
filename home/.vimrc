" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

set shell=bash

" Load the csope mappings file
source $HOME/.vim/cscope.vim

" TODO: Load plugins here (pathogen or vundle)
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'wincent/Command-T'
Plugin 'lervag/vimtex' 
Plugin 'vim-utils/vim-man'
Plugin 'tpope/vim-fugitive'
Plugin 'chrisbra/Recover.vim'
"Plugin 'gerw/vim-latex-suite'
"Plugin 'vim-latex/vim-latex'
"Plugin 'jcf/vim-latex.git'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'    
Plugin 'scrooloose/nerdtree'         
Plugin 'MattesGroeger/vim-bookmarks' "See :help bookmarks
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin '907th/vim-auto-save'

" Final line of plugins
call vundle#end()

" Disable vimtex for normal vim (enable it in gvimrc)
let g:vimtex_enabled=0
" Set vim man width to 80
let g:man_width = 80

" For plugins to load correctly
filetype plugin indent on

" Turn on syntax highlighting
syntax enable
set background=dark
colorscheme solarized

" Allow windows style ctrl+c, ctrl+v to work in vim
" Now, to get to visual mode, use CTRL-Q
source $VIMRUNTIME/mswin.vim
behave mswin

" Set the home directory to the e drive
"let workpath='E:\Google Drive'
"cd `=workpath`

" TODO: Pick a leader key
" let mapleader = ","

set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc

""""""""""""""""""""" Some airline settings """""""""""""""""""""""""""""
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

""""""""""""""""""""" Some vim-latex settings """""""""""""""""""""""""""""
" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
" set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
" set grepprg=grep\ -nH\ $*

" let g:tex_flavor='latex'
hi clear texItalStyle
hi clear texBoldStyle

""""""""""""""""""""" Some Syntastic settings"""""""""""""""""""""""""""""
"let g:statline_syntastic = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_enable_highlighting = 1
let g:syntastic_enable_signs = 1

let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "!"
let g:syntastic_style_error_symbol = "😞"
let g:syntastic_style_warning_symbol = "😕"
let g:syntastic_tex_checkers = ['lacheck']
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""" Some Nerdcommenter settings"""""""""""""""""""""""""""""
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
"let g:NERDCompactSexyComs

" Allow commenting empty lines
let g:NERDCommentEmptyLines = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""" Some Nerdtree settings"""""""""""""""""""""""""""""
" Ensure that vim opens up in the opened file's directory
" autocmd BufEnter * lcd %:p:h
" Automatically start nerdtree on opening vim
autocmd vimenter * NERDTree
autocmd vimenter * wincmd p

" Autoclose vim if only window open is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


map <F3> :NERDTreeToggle<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""" Some vim-markdown settings"""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_math = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""" Some auto-save settings"""""""""""""""""""""""""""""
let g:auto_save_events = ["CursorHold", "CursorHoldI", "CompleteDone", "InsertLeave", "TextChangedI"]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=0 " Uses whatever tabstop value we have
set softtabstop=4
set expandtab
set noshiftround

"Special options for some files
autocmd Filetype tex setlocal ts=2 sw=2 sts=2 

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden
" Easy cycling through buffers
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
" Close one buffer and go to the next
command Bd bp | sp | bn | bd

" Rendering
set ttyfast

" Turn on spell checking
set spell
set spelllang=en_gb

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

noh

" Allow scrolling
set mouse=a
