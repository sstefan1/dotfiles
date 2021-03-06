" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.
"
"------------------------------------------------------------
" Added from my vimrc.
set tabstop=2
set shiftwidth=2
set expandtab

" call clang-format on save
function! FormatOnSave()
    let l:formatdiff = 1
    py3f ~/llvm/llvm-project/clang/tools/clang-format/clang-format.py
endfunction

autocmd BufWritePre *.h,*.hh,*hxx,*.cc,*.cpp,*.cxx call FormatOnSave()

function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc

" NerdCommenter
let g:NERDAltDelims_c = 1
let g:NERDCustomDelimeters = { 'c': {'left': '/*', 'right':'*/'} }
let g:NERDSpaceDelims = 1

:let mapleader = ","

" ClangFormat
let g:python3_host_prog = '/usr/bin/python3'
imap <c-o> :py3f ~/llvm/llvm-project/clang/tools/clang-format/clang-format.py<cr>
map <C-I> :py3f ~/llvm/llvm-project/clang/tools/clang-format/clang-format.py<cr>
map <C-n> :NERDTreeToggle<cr>
map <C-c> :NeoCompleteEnable<cr>
map <C-p> :CtrlP<cr>
nnoremap <leader>nt :call NumberToggle()<cr>

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline unicode symbols
" let g:airline_left_sep = '»'                                                                                                                                                     │~                              |    2 "------------------------------------------------------------
" let g:airline_left_sep = '▶'                                                                                                                                                     │~                              |    3 " Features {{{1
" let g:airline_right_sep = '«'                                                                                                                                                    │~                              |    4 "
" let g:airline_right_sep = '◀'                                                                                                                                                    │~                              |    5 " These options and commands enable some very useful features in Vim, that
" let g:airline_symbols.linenr = '␊'                                                                                                                                               │~                              |    6 " no user should have to live without.
" let g:airline_symbols.linenr = '␤'                                                                                                                                               │~                              |    7
" let g:airline_symbols.linenr = '¶'                                                                                                                                               │~                              |    8 " Set 'nocompatible' to ward off unexpected things that your distro might
" let g:airline_symbols.branch = '⎇'                                                                                                                                               │~                              |    9 " have made, as well as sanely reset options when re-sourcing .vimrc
" let g:airline_symbols.paste = 'ρ'                                                                                                                                                │~                              |   10 set nocompatible
" let g:airline_symbols.paste = 'Þ'                                                                                                                                                │~                              |   11
" let g:airline_symbols.paste = '∥'                                                                                                                                                │~                              |   12 " Attempt to determine the type of a file based on its name and possibly its
" let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.
 
" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
 
" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on
 
"------------------------------------------------------------
set nowrap
set noswapfile

"------------------------------------------------------------
" YouCompleteMe
"
set encoding=utf-8


"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.
 
" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden
 
" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall
 
" Better command-line completion
set wildmenu
 
" Show partial commands in the last line of the screen
set showcmd
 
" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch
 
" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline
 
 
"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.
 
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
 
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
 
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
 
" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline
 
" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler
 
" Always display the status line, even if only one window is displayed
set laststatus=2
 
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
 
" Use visual bell instead of beeping when doing something wrong
set visualbell
 
" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=
 
" Enable use of the mouse for all modes
set mouse=a
 
" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=1
 
" Display line numbers on the left
set number
set relativenumber
 
" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200
 
" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>
 
 
"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.
 
" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab
 
" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
"set tabstop=4
 
 
"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings
 
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$
 
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>
 
"------------------------------------------------------------
" Vundle and plugins

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.

Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'tomasr/molokai'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/Conque-GDB'
Plugin 'oplatek/Conque-Shell'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/vimshell.vim'
Plugin 'Shougo/unite.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'majutsushi/tagbar'
Plugin 'junegunn/vim-easy-align'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ctrlpvim/ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" NERDtree related config
let g:nerdtree_tabs_open_on_console_startup=1

" Syntax highlighting
syntax on
colorscheme molokai

" Solarized colorscheme config
let g:solarized_termcolors=256
"
" Doxygen settings
let g:DoxygenToolkit_briefTag_pre="\\brief "
let g:DoxygenToolkit_paramTag_pre="\\param "
let g:DoxygenToolkit_templateParamTag_pre="\\tparam "
let g:DoxygenToolkit_returnTag_pre="\\returns "
