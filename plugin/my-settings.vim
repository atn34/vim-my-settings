if exists('g:loaded_my_settings') || &compatible
  finish
else
  let g:loaded_my_settings = 1
endif

" secret stuff
let s:secretrc = expand($HOME . '/.secret.vim')
if filereadable(s:secretrc)
    exec ":source" . s:secretrc
endif

" local vimrc
set exrc
set secure

" ==========================================================
" Basic Settings
" ==========================================================
syntax on                     " syntax highlighing
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
set number                    " Display line numbers
set numberwidth=1             " using only 1 column (and 1 space) while possible
set title                     " show title in console title bar
set wildmode=full             " <Tab> cycles between all matching choices.
set hidden                    " allow hidden unsaved buffers

set undofile   " Maintain undo history between sessions
set undodir=~/.vim/undo
set directory=~/.vim/swap//,. " keep swp files under ~/.vim/swap

set history=1000

" visualize trailing whitespace
set list

" enable mouse
set mouse+=a

" disable autocommenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" disable autowrap
set wrap linebreak textwidth=0

" have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Delete comment character when joining commented lines
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j
endif

" use /usr/share/dict/words as dict
set dictionary+=/usr/share/dict/words

" Insert completion
set pumheight=20             " Keep a large completion window
set splitright
set splitbelow

" Moving Around/Editing
set cursorline              " have a line indicate the cursor location
set ruler                   " show the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set linebreak               " don't wrap textin the middle of a word
set tabstop=4               " <tab> inserts 4 spaces
set shiftwidth=4            " but an indent level is 2 spaces wide.
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set foldmethod=indent       " allow us to fold on indents
set foldlevel=99            " don't fold by default

" Reading/Writing
set noautowrite             " Never write a file unless I request it.
set noautowriteall          " NEVER.
set noautoread              " Don't automatically re-read changed files.
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.

" Messages, Info
set ls=2                    " allways show status line
set confirm                 " Y-N-C prompt if closing with unsaved changes.
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler                   " Show some info, even without statuslines.

" Status
set statusline=                            " start status line
set statusline+=[%l,%v\ %P%M]              " add line number, column and modified flag
set statusline+=\ %f                       " file name relative to working directory
set statusline+=\ %r%h%w                   " flags
set statusline+=\ %y                       " file type
set statusline+=\ (%{&ff})                 " file format

" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set hlsearch                " Highlight searches by default.

set lazyredraw

" needs to be at end for some reason
" don't bell or blink
set noerrorbells
set t_vb=