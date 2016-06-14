" ----------------------------------------------------------------------------
" Setup vundle first
" ----------------------------------------------------------------------------
set nocompatible								" disable vi compatibility
filetype plugin off             " required for Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Better completion. Disabled because it's too slow
"Plugin 'Valloric/YouCompleteMe'

" NOTE: Add more plugins here. Install with :VundleInstall
" Git integration
Plugin 'tpope/vim-fugitive'
" Great status bar
Plugin 'bling/vim-airline'
" Use for file navigation
Plugin 'ctrlpvim/ctrlp.vim'
" Git Diff inline (on the left)
Plugin 'airblade/vim-gitgutter'
" Move around easier
Plugin 'easymotion/vim-easymotion'
" Javascript syntax
Plugin 'jelera/vim-javascript-syntax'
" Make GUI colorschemes look good in console
Plugin 'godlygeek/csapprox'
" PEP8
Plugin 'hynek/vim-python-pep8-indent'

" Too many colorschemes
Plugin 'wombat256.vim'
Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ----------------------------------------------------------------------------
" Encoding
" ----------------------------------------------------------------------------
set enc=utf-8									" set UTF-8 encoding
set fenc=utf-8
set termencoding=utf-8

" ----------------------------------------------------------------------------
" File Handling
" ----------------------------------------------------------------------------
set directory^=$HOME/.vim/swp/ 					" Use a single swap directory
try												" Persistent undo dir
    set undodir=~/.vim/undo
    set undolevels=1000
    set undofile
endtry

" ----------------------------------------------------------------------------
" User Interface
" ----------------------------------------------------------------------------
set showcmd             						" Show (partial) command in status line
set ruler               						" Show line & column number
set whichwrap+=<,>,h,l  						" arrow keys wrap around line
set wildmode=longest,list,full
set wildmenu            						" For easier tab completion on command line
"set number										" turn on line numbers
set cursorline                " highlight the current line
set laststatus=2              " status bar always on

syntax on										" turn syntax highlighting on
set background=light								" dark background
" Solarized
let g:solarized_termcolors=256
colorscheme solarized

"colorscheme wombat256mod    " Console friendly wombat theme.

" ----------------------------------------------------------------------------
" Formatting
" ----------------------------------------------------------------------------
set autoindent									" use indentation of previous line
set smartindent									" use intelligent indentation for C

set tabstop=2        						" tab width is 2 spaces
set shiftwidth=2     						" indent also with 2 spaces
set expandtab        						" expand tabs to spaces
set textwidth=80								" wrap lines at 80 chars. 
"set wrapmargin=2
set formatoptions=c,q,r         " c: Auto-wrap comments to textwidth
                                " q: Allow formatting comments with "gq".
                                " r: Automatically insert current comment char

set showmatch									  " highlight matching braces
set matchtime=1									" for 1/10th of a second

set comments=sl:/*,mb:\ *,elx:\ */				" intelligent comments

""" Python Settings
au FileType python setl nosmartindent " turn off smart indentation for python files
au FileType python setl sw=4
au FileType python setl ts=4

""" HTML Settings
au FileType html setl nosmartindent
au FileType html setl shiftwidth=2

""" Java settings
au FileType java setl sw=2

""" Makefiles
au FileType make setl noexpandtab " no tabs for makefiles

""" Bazel files are python format
au BufRead,BufNewFile *.bzl set filetype=python

" ----------------------------------------------------------------------------
"  Mouse & Keyboard
" ----------------------------------------------------------------------------
set mousehide       							" Hide the mouse while typing
set backspace=indent,eol,start  				" Influences the working of backspaces

" ----------------------------------------------------------------------------
" Tabs and Windows
" ----------------------------------------------------------------------------
" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" C-tags generate the tag file of the current directory
nmap ,t :!(cd %:p:h;ctags *.[ch])&

" switch between header/source with F4
"map <F4> :e %:p:s,.h$,.X123X,:s,.cc$,.h,:s,.X123X$,.cc,<CR>
map gh :e %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>			"switch between header and source
map ghh :split %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>	"same but with horizontal split
map ghv :vs %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>		"same but with vertical split

" in diff mode we use the spell check keys for merging
if &diff
  " diff settings
  map <M-Down> ]c
  map <M-Up> [c
  map <M-Left> do
  map <M-Right> dp
  map <F9> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg
else
    "spell settings

    function! SwitchSpellLangToEnglish()
    map <F8> :setlocal spell spelllang=en_ca<CR>:call SwitchSpellLangOff()<CR>
    endfunction

    function! SwitchSpellLangOff()
        map <F8> :set nospell<CR>:call SwitchSpellLangToEnglish()<CR>
    endfunction

    call SwitchSpellLangToEnglish()

  " set the spellfile - folders must exist
  set spellfile=~/.vim/spellfile.add
  map <M-Down> ]s
  map <M-Up> [s
endif

" Code to remember previous cursor positions--------------------
" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo
function! ResCur()
  if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END
"---------------------------------------------------------------

" ----------------------------------------------------------------------------
" Search
" ----------------------------------------------------------------------------
set incsearch 							" highlight search matches
set hlsearch							" show search matches as you type
set ignorecase
set smartcase							" override ignore case if pattern contains capitals
" Press space to clear search highlighting and any message already displayed.
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>
