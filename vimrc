call plug#begin('~/.vim/plugged')
Plug 'danhart/flatlandia'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-leiningen'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'losingkeys/vim-niji'
Plug 'vim-ruby/vim-ruby'
Plug 'rodjek/vim-puppet'
Plug 'groenewege/vim-less'
Plug 'kien/ctrlp.vim'
Plug 'othree/html5.vim'
Plug 'ervandew/supertab'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'godlygeek/tabular'
Plug 'pangloss/vim-javascript'
Plug 'junegunn/vim-easy-align'
Plug 'guns/vim-sexp'
Plug 'guns/vim-clojure-static'
Plug 'bling/vim-airline'
Plug 'rking/ag.vim'
Plug 'tpope/vim-fugitive'
call plug#end()

" Must Haves
filetype plugin indent on

" Tab settings

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Tab settings for less
augroup filetype_less
  au!
  au FileType less setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
  au FileType less setlocal commentstring=//\ %s
augroup END

augroup filetype_sass
  au!
  au FileType sass setlocal iskeyword+=-
augroup END

" It's annoying to see the trail listchar while typing
" So only set list while in normal mode
augroup no_list_in_insert_mode
  au!
  au InsertEnter * set nolist
  au InsertLeave * set list
augroup END

" Make things better

set scrolloff=3
set wildmode=list:longest
set visualbell
set cursorline
set cursorcolumn
set ttyfast
set number
set undofile

let mapleader = ","

" Sane Searching/Moving

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set showmatch

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

" No more help key

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" save on losing focus
" au FocusLost * :wa

" Strip all trailing white space
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

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

" Split windows
" new vertical split
nnoremap <leader>w <C-w>v<C-w>l

nnoremap <Leader>t :NERDTreeToggle<Enter>

nnoremap <leader><space> :noh<cr>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resize splits when the window is resized
au VimResized * :wincmd =

colorscheme flatlandia

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['clojure', 'ruby', 'eruby', 'php', 'css', 'less', 'cucumber', 'javascript'],
                           \ 'passive_filetypes': ['puppet'] }

set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set backup                        " enable backups
set noswapfile                    " It's 2012, Vim.

" When switching the buffer using :sb use the tab if it's open
" set switchbuf=usetab

let g:ctrlp_extensions = ['tag']

" Fix error when opening vim with latest nerdtree
let NERDTreeHijackNetrw = 0

" Don't try to highlight lines longer than 800 characters.
set synmaxcol=800

highlight SpellBad term=underline gui=undercurl guisp=Orange
set spelllang=en_gb
