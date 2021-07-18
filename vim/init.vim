
" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

set shell=bash

" Load the csope mappings file
source $HOME/.vim/cscope.vim


" TODO: Load plugins here (pathogen or vundle)
" set rtp+=$HOME/.vim/bundle/Vundle.vim
" call vundle#begin()
call plug#begin()

" let Vundle manage Vundle
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-rhubarb'
Plug 'chrisbra/Recover.vim'
" Plug 'scrooloose/syntastic'
Plug 'dense-analysis/ale'
Plug 'scrooloose/nerdcommenter'    
Plug 'scrooloose/nerdtree'         
Plug 'MattesGroeger/vim-bookmarks' "See :help Bookmarks
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'junegunn/vim-peekaboo'
Plug 'hdima/python-syntax'
Plug 'skielbasa/vim-material-monokai'
Plug 'ayu-theme/ayu-vim'
Plug 'vim-scripts/BufOnly.vim'
Plug 'lervag/vimtex'
Plug 'NLKNguyen/papercolor-theme'
Plug 'jpalardy/vim-slime'

" Final line of plugins
call plug#end()

" Set vim man width to 80
let g:man_width = 80

" For plugins to load correctly
filetype plugin indent on
set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc


"""""""""""""""""""""""" Colours and Appearance """"""""""""""""""""""""
" Turn on syntax highlighting
syntax enable
let g:python_highlight_all=1

set t_Co=256
let colors_env=$LC_COLORS
colorscheme material-monokai 
set background=dark
hi MatchParen cterm=bold ctermfg=Magenta ctermbg=114
if colors_env == 'light'
  set background=light
  colorscheme PaperColor
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""" Misc """""""""""""""""""""""""""""""""
" " Moving back and forth between lines of same or lower indentation.
nnoremap <silent> [l :call NextIndent(0, 0, 0, 1)<CR>
nnoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<CR>
nnoremap <silent> [L :call NextIndent(0, 0, 1, 1)<CR>
nnoremap <F5> :buffers<CR>:buffer<Space>

let g:peekaboo_window = ":vert bo 50new"
set tags^=./.git/tags;

set number  " Show line numbers
" Show current file
nnoremap <leader>f :echo @%<CR>  

" " Show file stats
set visualbell  " No sound on errors

" " Encoding
set encoding=utf-8
set termencoding=utf-8

" " Whitespace
set wrap
set textwidth=120
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=0 " Uses whatever tabstop value we have
set softtabstop=4
set expandtab
set noshiftround

" " Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" " Move up/down editor lines
nnoremap j gj
nnoremap k gk

" " Allow hidden buffers
set hidden
" " Easy cycling through buffers
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
" Close one buffer and go to the next
if !exists(":Bd")
    command Bd bp | sp | bn | bd
endif
set path+=**
" " Rendering
set ttyfast

" Set spell checking properties, but turn off for most file types (will turn on
" in ftplugin)
set nospell
set spelllang=en_gb
hi clear SpellBad
hi SpellBad cterm=underline
syn match myExCapitalWords +\<\w*[A-Z]\S*\>|'s+ contains=@NoSpell

" " Status bar
set laststatus=2

" " Last line
set showmode
set showcmd

" " Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
let g:solarized_termcolors=256

" Copy current file name to clipboard
nmap ,cs :let @*=expand("%")<CR>
nmap ,cl :let @*=expand("%:p")<CR>

""""""""""""""""""""""" Some vimtex settings """""""""""""""""""""""""""""
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
hi clear texItalStyle
hi clear texBoldStyle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""" Some vim-fugitive settings """""""""""""""""""""""
nnoremap <leader>g :silent Ggrep! <cword><CR>
let g:EasyGrepRecursive = 1
let g:EasyGrepFilesToExclude=".git,*.swp,tags"
autocmd QuickFixCmdPost *grep* cwindow
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""" Some bookmark settings """""""""""""""""""""""""
nnoremap <C-b> :BookmarkToggle<CR>
nnoremap <C-i> :BookmarkAnnotate<CR>
nnoremap <C-x> :BookmarkNext<CR>
nnoremap <C-z> :BookmarkPrev<CR>
nnoremap <C-g> :BookmarkShowAll<CR>
let g:bookmark_disable_ctrlp = 1
let g:bookmark_auto_close = 1
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
let g:bookmark_center = 1
let g:ctrlp_max_files=0
let g:ctrlp_custom_ignore = {
   \ 'dir':  '[\/]\.(git|hg|svn)$',
   \ 'file': '\.(exe|so|dll|DS_Store)$',
   \ 'build': 'bazel-out$\|node_modules$',
   \ }
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""" Some airline settings """"""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" """"""""""""""""""""" Some Syntastic settings"""""""""""""""""""""""""
let g:syntastic_python_checkers = ['flake8']
let options = "--max-line-length=120 --select E,F,C9 --ignore=E226,E126"
let g:syntastic_python_flake8_args = options
let g:syntastic_tex_checkers = ['lacheck']
let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_highlighting = 1
let g:syntastic_enable_signs = 1

" Gutter symbols
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "!"
let g:syntastic_style_error_symbol = ":("
let g:syntastic_style_warning_symbol = ":/"
" Easy cycling through errors 
nnoremap <C-j> :lnext<CR>
nnoremap <C-k> :lprev<CR>

" """"""""""""""""""""" Some ALE Settings """"""""""""""""""""""""""""""
let g:ale_linters = {
\   'python': ['pylint', 'flake8', 'mypy'],
\}
let g:ale_python_mypy_executable= 'mypy'
let g:ale_python_mypy_options = '--config-file $HOME/mypy.ini'
let g:ale_python_pylint_executable= 'py_lint_pylint'
let g:ale_python_pylint_options = '--rcfile $HOME/pylintrc.txt'
let g:ale_python_flake8_executable= 'py_lint_flake8'
let g:ale_python_flake8_options = '--config $HOME/flake8.setup.cfg'
" let g:ale_python_pylint_options = "--max-line-length=120 --select E,F,C9 --ignore=E226,E126"
" let g:ale_python_pylint_options = "--max-line-length=120"
let g:ale_sign_column_always = 0
let g:ale_sign_error = "✗"
let g:ale_sign_warning = "!"
let g:ale_sign_style_error = ":("
let g:ale_sign_style_warning = ":/"
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""" Some TagBar Settings """"""""""""""""""""""""""""
nmap <F9> :TagbarToggle<CR>
let g:tagbar_width = 40
let g:tagbar_sort = 0
hi TagBarSignature ctermfg=Gray
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""" Some Nerdcommenter settings"""""""""""""""""""""""
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
"let g:NERDCompactSexyComs
" Allow commenting empty lines
" let g:NERDCommentEmptyLines = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""" Some Nerdtree settings""""""""""""""""""""""""""""
" Ensure that vim opens up in the opened file's directory
" autocmd BufEnter * lcd %:p:h
" Automatically start nerdtree on opening vim
autocmd vimenter * NERDTree
autocmd vimenter * wincmd p
" Autoclose vim if only window open is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <F3> :NERDTreeToggle<CR>
map <F4> :NERDTreeFind<CR>
let g:NERDTreeWinSize = 35
let g:NERDTreeShowBookmarks=1
let g:NERDTreeBookmarksSort=0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""" Some Taglist settings"""""""""""""""""""""""""""""
nmap <F8> :TlistToggle<CR>
let g:Tlist_Exit_OnlyWindow = 1
let g:Tlist_Use_Right_Window = 1
let g:Tlist_WinWidth = 50

""""""""""""""""""""" Some vim-markdown settings"""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_math = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" " """"""""""""""""""""" Some auto-save settings"""""""""""""""""""""""""""""
let g:auto_save_events = ["CursorHold", "CursorHoldI", "CompleteDone", "InsertLeave", "TextChangedI"]
" " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" " """""""""""""""""""""""""" Some ctrlP settings """""""""""""""""""""""""""
let g:ctrlp_map = '<c-o>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>r :CtrlPMRU<cr>
let g:ctrlp_root_markers = ['.ctrlp']

" " """""""""""""""""""""""""" Some vim-slime settings """"""""""""""""""""""""
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":0.1"}
let g:slime_python_ipython = 1
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

