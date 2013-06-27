" Must Haves
filetype off
call pathogen#infect()
filetype plugin indent on
set nocompatible

set modelines=0

" Tab settings

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Tab settings for JavaScript
augroup filetype_javascript
  au!
  au FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
augroup END

" Tab settings for less
augroup filetype_less
  au!
  au FileType less setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
  au FileType less setlocal commentstring=//\ %s
augroup END

" It's annoying to see the trail listchar while typing
" So only set list while in normal mode
augroup no_list_in_insert_mode
  au!
  au InsertEnter * set nolist
  au InsertLeave * set list
augroup END

" Make things better

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set cursorcolumn
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile

let mapleader = ","

" Sane Searching/Moving

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" Move selection up/down (add =gv to reindent after move)
vmap <D-S-Up> :m-2<CR>gv
vmap <D-S-Down> :m'>+<CR>gv

" Handle long lines

set nowrap
set textwidth=80
set colorcolumn=+1
" set formatoptions=qrn1

" Invisible Chars
set list

" Nabbed from Tim Pope's vim-sensible plugin
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
  let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u26ad"
  let &fillchars = "vert:\u259a,fold:\u00b7"
endif

" New to vim!

nnoremap j gj
nnoremap k gk

" No more help key

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" save on losing focus
" au FocusLost * :wa

" Strip all trailing white space
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Ack map
nnoremap <leader>a :Ack

" HTML fold tag function
nnoremap <leader>ft Vatzf

" Sort CSS properties
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

" rehardwrap paragraphs of text
nnoremap <leader>q gqip

" reselect pasted text
nnoremap <leader>v V`]

" open vimrc in split window
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
"
" source vimrc file after changes
nnoremap <leader>sv :so $MYVIMRC<cr>

" rake less:compile
nnoremap <leader>rlc :!rlc<cr><cr>
nnoremap <leader>t :!ttr<cr><cr>
nnoremap <leader>bs :Bundle install<cr>

" Split windows
" new vertical split
nnoremap <leader>w <C-w>v<C-w>l

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resize splits when the window is resized
au VimResized * :wincmd =

colorscheme molokai

if has('gui_running')
    set guifont=Menlo:h14

    " Remove all the UI cruft
    set go-=T
    set go-=l
endif

let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['ruby', 'eruby', 'php', 'css', 'less', 'cucumber', 'javascript'],
                           \ 'passive_filetypes': ['puppet'] }

set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set backup                        " enable backups
set noswapfile                    " It's 2012, Vim.

" YankRing
nnoremap <silent> <F3> :YRShow<cr>
inoremap <silent> <F3> <ESC>:YRShow<cr>

" Set interactive command prompt
set shellcmdflag=-lic

" When switching the buffer using :sb use the tab if it's open
set switchbuf=usetab

let g:ctrlp_extensions = ['tag']

set wildignore+=*.css

" Don't try to highlight lines longer than 800 characters.
set synmaxcol=800

