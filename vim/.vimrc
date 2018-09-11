
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
"" Plugin 'wincent/Command-T'
"Plugin 'vim-utils/vim-man'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sleuth'
Plugin 'chrisbra/Recover.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'    
Plugin 'scrooloose/nerdtree'         
Plugin 'MattesGroeger/vim-bookmarks' "See :help bookmarks
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin '907th/vim-auto-save'
"" Plugin 'Valloric/YouCompleteMe'
"Plugin 'davidhalter/jedi-vim'
"Plugin 'easymotion/vim-easymotion'
"" Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'junegunn/vim-peekaboo'
Plugin 'hdima/python-syntax'
Plugin 'skielbasa/vim-material-monokai'
Plugin 'ayu-theme/ayu-vim'
Plugin 'taglist.vim'
Plugin 'lervag/vimtex'

" Final line of plugins
call vundle#end()

" Set vim man width to 80
let g:man_width = 80

" For plugins to load correctly
filetype plugin indent on

syntax enable
" Turn on syntax highlighting
let g:python_highlight_all=1

set t_Co=256
let colors_env=$LC_COLORS
if colors_env == 'dark'
    colorscheme material-monokai
    set background=dark
    hi Comment ctermfg=Gray
    hi Visual ctermfg=None ctermbg=Gray
    hi Normal ctermbg=None
    hi nonText ctermbg=None
    hi pythonDot ctermfg=Red
    hi MatchParen cterm=bold ctermfg=7 ctermbg=6
else
    set background=light
    colorscheme solarized
    hi MatchParen cterm=bold ctermfg=Magenta ctermbg=114
endif

 hi TagBarSignature ctermfg=Gray
 set enc=utf-8
 set fileencoding=utf-8
 set fileencodings=ucs-bom,utf8,prc


" " Moving back and forth between lines of same or lower indentation.
 nnoremap <silent> [l :call NextIndent(0, 0, 0, 1)<CR>
 nnoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<CR>
 nnoremap <silent> [L :call NextIndent(0, 0, 1, 1)<CR>

 nmap <F9> :TagbarToggle<CR>
 let g:tagbar_width = 40
 let g:tagbar_sort = 0

 let g:peekaboo_window = ":vert bo 50new"

" """"""""""""""""""""" Some vimtex settings """""""""""""""""""""""""""""
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" """"""""""""""""""""" Some bookmark settings """""""""""""""""""""""""""""
 nnoremap <C-b> :BookmarkToggle<CR>
 nnoremap <C-x> :BookmarkNext<CR>
 nnoremap <C-z> :BookmarkPrev<CR>
 nnoremap <C-g> :BookmarkShowAll<CR>
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 """"""""""""""""""""" Some airline settings """""""""""""""""""""""""""""
 let g:airline#extensions#tabline#enabled = 1
 let g:airline#extensions#tabline#left_sep = ' '
 let g:airline#extensions#tabline#left_alt_sep = '|'
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

 " """"""""""""""""""""" Some Syntastic settings"""""""""""""""""""""""""""""
  let g:syntastic_python_checkers = ['flake8']
  " let g:syntastic_python_flake8_exec = '/usr/bin/python3'
  let options = "--max-complexity 11 --max-line-length=80 --ignore=E111,E114,E116,E306,E731,E231,E226,C901,E741"
  let g:syntastic_python_flake8_args = options
  let g:syntastic_tex_checkers = ['lacheck']
  "let g:statline_syntastic = 0
  " set statusline+=%#warningmsg#
  " set statusline+=%{SyntasticStatuslineFlag()}
  " set statusline+=%*
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
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  """"""""""""""""""""" Some Nerdcommenter settings"""""""""""""""""""""""""""""
  " Add spaces after comment delimiters by default
  let g:NERDSpaceDelims = 1
  " Use compact syntax for prettified multi-line comments
  "let g:NERDCompactSexyComs
  " Allow commenting empty lines
  " let g:NERDCommentEmptyLines = 1
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

" " """"""""""""""""""""" Some YouCompleteMe settings """""""""""""""""""""""""
" let g:ycm_server_python_interpreter='python'
" " let g:ycm_autoclose_preview_window_after_completion=1
" let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
" let g:ycm_complete_in_comments = 0 " Completion in comments
" let g:ycm_complete_in_strings = 0 " Completion in string
" let g:ycm_filetype_blacklist = {
    " \ 'markdown' : 1,
    " \ 'rst'      : 1,
    " \ 'tex'      : 1
" \}
" map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
" " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" " """"""""""""""""""""""""" Some jedi-vim settings """"""""""""""""""""""""""
" " let g:jedi#auto_vim_configuration = 0
" " set completeopt=menuone,longest
" " let g:jedi#popup_on_dot = 0
" " let g:jedi#show_call_signatures = 0
" " " augroup previewWindowPosition
   " " " au!
   " " " autocmd BufWinEnter * call PreviewWindowPosition()
" " " augroup END
" " " function! PreviewWindowPosition()
   " " " if &previewwindow
      " " " wincmd L
   " " " endif
" " " endfunction 
" " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" " """""""""""""""""""""""" Some easymotion settings """""""""""""""""""""""""
" " " <Leader>f{char} to move to {char}
" " map  <Leader>f <Plug>(easymotion-bd-f)
" " nmap <Leader>f <Plug>(easymotion-overwin-f)
" " " s{char}{char} to move to {char}{char}
" " nmap s <Plug>(easymotion-overwin-f2)
" " " Move to line
" " map <Leader>L <Plug>(easymotion-bd-jk)
" " nmap <Leader>L <Plug>(easymotion-overwin-line)
" " " Move to word
" " map  <Leader>w <Plug>(easymotion-bd-w)
" " nmap <Leader>w <Plug>(easymotion-overwin-w)
" " map  <Leader>/ <Plug>(easymotion-sn)
" " omap <Leader>/ <Plug>(easymotion-tn)
" " " map  n <Plug>(easymotion-next)
" " " map  N <Plug>(easymotion-prev)
" " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" " """""""""""""""""""""""""" Some ctrlP settings """""""""""""""""""""""""""
" " let g:ctrlp_map = '<c-o>'
" " let g:ctrlp_cmd = 'CtrlP'
" " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

 " " Security
 " set modelines=0

 " " Show line numbers
 set number relativenumber

 " " Show file stats
 set ruler

 " " Blink cursor on error instead of beeping (grr)
 set visualbell

 " " Encoding
 set encoding=utf-8
 set termencoding=utf-8

 " " Whitespace
 set wrap
 set textwidth=80
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
 map <leader><space> :let @/=''<cr> " clear search

onoremap an :<c-u>call <SID>NextTextObject('a')<cr>
xnoremap an :<c-u>call <SID>NextTextObject('a')<cr>
onoremap in :<c-u>call <SID>NextTextObject('i')<cr>
xnoremap in :<c-u>call <SID>NextTextObject('i')<cr>

function! s:NextTextObject(motion)
    echo
    let c = nr2char(getchar())
    exe "normal! f".c."v".a:motion.c
endfunction

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

" " " Remap help key.
" inoremap <F1> <ESC>:set invfullscreen<CR>a
" nnoremap <F1> :set invfullscreen<CR>
" vnoremap <F1> :set invfullscreen<CR>

" " " Textmate holdouts

" " " Formatting
" " map <leader>q gqip

" " " Visualize tabs and newlines
" " set listchars=tab:▸\ ,eol:¬
" " " Uncomment this to enable by default:
" " " set list " To enable by default
" " " Or use your leader key + l to toggle on/off
" " map <leader>l :set list!<CR> " Toggle tabs and EOL

" " noh

" " " Allow scrolling
" set mouse=a

" " Jump to the next or previous line that has the same level or a lower
" " level of indentation than the current line.
" "
" " exclusive (bool): true: Motion is exclusive
" " false: Motion is inclusive
" " fwd (bool): true: Go to next line
" " false: Go to previous line
" " lowerlevel (bool): true: Go to line with lower indentation level
" " false: Go to line with the same indentation level
" " skipblanks (bool): true: Skip blank lines
" " false: Don't skip blank lines
" function! NextIndent(exclusive, fwd, lowerlevel, skipblanks)
  " let line = line('.')
  " let column = col('.')
  " let lastline = line('$')
  " let indent = indent(line)
  " let stepvalue = a:fwd ? 1 : -1
  " while (line > 0 && line <= lastline)
    " let line = line + stepvalue
    " if ( ! a:lowerlevel && indent(line) == indent ||
          " \ a:lowerlevel && indent(line) < indent)
      " if (! a:skipblanks || strlen(getline(line)) > 0)
        " if (a:exclusive)
          " let line = line - stepvalue
        " endif
        " exe line
        " exe "normal " column . "|"
        " return
      " endif
    " endif
  " endwhile
" endfunction
