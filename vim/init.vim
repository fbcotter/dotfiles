
" Don't try to be vi compatible
set nocompatible

let g:loaded_python_provider = 0
let g:python3_host_prog = '/home/fergal/.pyenv/versions/nvim/bin/python3.8'

" Helps force plugins to load correctly when it is turned back on below
filetype off

set shell=bash

" Load the csope mappings file
source $HOME/.vim/cscope.vim


" TODO: Load plugins here (pathogen or vundle)
" set rtp+=$HOME/.vim/bundle/Vundle.vim
" call vundle#begin()
call plug#begin()

" Awesome File browser
Plug 'preservim/nerdtree'         
Plug 'Xuyuanp/nerdtree-git-plugin'
" Awesome git plugin
Plug 'tpope/vim-fugitive'
" Work out indentation automatically
Plug 'tpope/vim-sleuth'
" Awesome way to open files with fuzzy searching
Plug 'ctrlpvim/ctrlp.vim'
Plug 'chrisbra/Recover.vim'
" Do linting
Plug 'dense-analysis/ale'
" Comment zones of text
Plug 'scrooloose/nerdcommenter'    
" See :help Bookmarks, useful for jumping around in buffers
" Plug 'MattesGroeger/vim-bookmarks' 
" Bottom and top of editor
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Can show classes and methods at a glance with F8
Plug 'preservim/tagbar'
" Shows the registers when you type " or @
Plug 'junegunn/vim-peekaboo'
" Some themes
Plug 'skielbasa/vim-material-monokai'
Plug 'NLKNguyen/papercolor-theme'
Plug 'ayu-theme/ayu-vim'
" Python syntax highlighting for vim
Plug 'hdima/python-syntax'
" Python indenting for functions
Plug 'Vimjas/vim-python-pep8-indent'
" Delete all but current buffer with :BufOnly
Plug 'vim-scripts/BufOnly.vim'
" Autocompletion
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" " Code suggestions. See :help deoplete-options
" Plug 'deoplete-plugins/dencode_str_to_uint8eoplete-jedi'
Plug 'sindrets/diffview.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

Plug 'github/copilot.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'CopilotC-Nvim/CopilotChat.nvim'


" Final line of plugins
call plug#end()

lua << EOF
require("CopilotChat").setup {
  -- See Configuration section for options
  layout = {
    position = "right",
    ratio = 0.4,
  },
  keys = {
    { "<leader>zc", ":CopilotChat<CR>", mode = "n", desc = "Chat with Copilot" },
    { "<leader>ze", ":CopilotChatExplain<CR>", mode = "v", desc = "Explain Code" }, 
    { "<leader>zw", ":CopilotChatReview<CR>", mode = "v", desc = "Review Code" }, 
    { "<leader>zf", ":CopilotChatFix<CR>", mode = "v", desc = "Fix Code" }, 
    { "<leader>zo", ":CopilotChatOptimize<CR>", mode = "v", desc = "Optimize Code" }, 
    { "<leader>zd", ":CopilotChatDocs<CR>", mode = "v", desc = "Generate Docs" }, 
    { "<leader>zt", ":CopilotChatTests<CR>", mode = "v", desc = "Generate Tests" }, 
  }
}
EOF

nnoremap <leader>zc :CopilotChat<CR>
vnoremap <leader>ze :CopilotChatExplain<CR>
vnoremap <leader>zw :CopilotChatReview<CR>
vnoremap <leader>zf :CopilotChatFix<CR>
vnoremap <leader>zo :CopilotChatOptimize<CR>
vnoremap <leader>zd :CopilotChatDocs<CR>
vnoremap <leader>zt :CopilotChatTests<CR>

" Set vim man width to 80
let g:man_width = 120
set splitright

" For plugins to load correctly
filetype plugin indent on
set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc

" Deoplete
" let g:deoplete#enable_at_startup = 1
" call deoplete#custom#option('max_menu_width', 100)
" call deoplete#custom#option('max_abbr_width', 20)

"""""""""""""""""""""""" Colours and Appearance """"""""""""""""""""""""
" Turn on syntax highlighting
syntax enable
let g:python_highlight_all=1
set t_Co=256
let colors_env=$LC_COLORS
colorscheme material-monokai
set background=dark
" colorscheme catppuccin-latte " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
" set background=light

""""""""""""""""""""""""" Misc """""""""""""""""""""""""""""""""
set tags^=./.git/tags;
set visualbell  " No sound on errors
set encoding=utf-8
" set termencoding=utf-8
set wrap
set textwidth=120
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=0 " Uses whatever tabstop value we have
set softtabstop=4
set expandtab
set noshiftround
" " Status bar
set laststatus=2
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

" " Move up/down editor lines
nnoremap j gj
nnoremap k gk
" " Allow hidden buffers
set hidden
" " Easy cycling through buffers
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
" " Easy cycling through quickfix list
nnoremap <C-j> :cn<CR>
nnoremap <C-k> :cN<CR>
" Close one buffer and go to the next
if !exists(":Bd")
    command Bd bp | sp | bn | bd
endif

" Show the buffers and open one
nnoremap <F5> :buffers<CR>:buffer<Space>

" Show line numbers
set number  

" Echo the current file name
nnoremap <leader>f :echo @%<CR>  

""""""""""""""""""""" Some airline settings """"""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" """"""""""""""""""""" Some ALE Settings """"""""""""""""""""""""""""""
let g:ale_linters = {
\   'python': ['pylint', 'flake8', 'mypy'],
\}
let g:ale_python_mypy_executable = '/home/fergal/WayveCode/bzl-build/bin/build_support/python/flake8'
let g:ale_python_mypy_options = '--config-file /home/fergal/mypy.ini'
let g:ale_python_pylint_executable= '/home/fergal/WayveCode/bzl-build/bin/build_support/python/py_lint_pylint'
let g:ale_python_pylint_options = '--rcfile /home/fergal/pylintrc.conf'
let g:ale_python_flake8_executable= '/home/fergal/WayveCode/bzl-build/bin/build_support/python/py_lint_flake8'
let g:ale_python_flake8_options = '--config /home/fergal/flake8.setup.cfg'
let g:ale_python_black_executable = '/home/fergal/WayveCode/bzl-build/bin/tools/blackfmt'
let g:ale_python_black_options = '--config /home/fergal/pyproject.toml'
" let g:ale_python_pylint_options = "--max-line-length=120 --select E,F,C9 --ignore=E226,E126"
" let g:ale_python_pylint_options = "--max-line-length=120"
let g:ale_sign_column_always = 0
let g:ale_sign_error = "✗"
let g:ale_sign_warning = "!"
let g:ale_sign_style_error = ":("
let g:ale_sign_style_warning = ":/"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""" Some Nerdcommenter settings"""""""""""""""""""""""
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
"let g:NERDCompactSexyComs
" Allow commenting empty lines
" let g:NERDCommentEmptyLines = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use % to jump between pairs
set matchpairs+=<:> 

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

""""""""""""""""""""" Some vim-fugitive settings """""""""""""""""""""""
nnoremap <leader>g :silent Ggrep! <cword><CR>
let g:EasyGrepRecursive = 1
let g:EasyGrepFilesToExclude=".git,*.swp,tags"
autocmd QuickFixCmdPost *grep* cwindow
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""" Some airline settings """"""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""" Some TagBar Settings """"""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>
let g:tagbar_width = 40
let g:tagbar_sort = 0
hi TagBarSignature ctermfg=Gray
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""" Some Nerdcommenter settings"""""""""""""""""""""""
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" " """""""""""""""""""""""""" Some ctrlP settings """""""""""""""""""""""""""
let g:ctrlp_map = '<c-o>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>r :CtrlPMRU<cr>
let g:ctrlp_root_markers = ['.ctrlp']
let g:ctrlp_max_depth = 15
let g:ctrlp_max_files = 20000
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
let g:ctrlp_custom_ignore = {
\ 'dir':  '\v[\/]\.(git|hg|svn)$',
\ 'other_dir':  '(data|work_dir|bzl-build|build_support|foxglove)$',
\ 'file': '\v\.(exe|so|dll)$',
\ }

" """""""""""""""""""""""""""" Some copilot settings """""""""""""""""""""""""""""""""""
imap <silent> <C-y> <Plug>(copilot-dismiss)
imap <silent> <C-j> <Plug>(copilot-next)
" imap <silent> <C-k> <Plug>(copilot-previous)
imap <silent> <C-b> <Plug>(copilot-suggest)
