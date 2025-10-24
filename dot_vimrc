set nocp
set encoding=utf-8

syntax on
filetype plugin indent on

set autoindent
set autoread
set backspace=indent,eol,start
set clipboard="unnamedplus"
set completeopt="menu,menuone,noselect"
set conceallevel=0
set confirm
set expandtab
set foldlevel=99
set foldmethod=indent
set foldtext=""
set formatoptions="jcroqlnt"
set grepformat="%f:%l:%c:%m"
set grepprg="rg --vimgrep or grep -n"
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=3
set linebreak
set list
set listchars=tab:›\ ,trail:⋅
set mouse=a " mouse support for all modes
set nocursorline
set noerrorbells
set noshowmatch
set novisualbell
set number relativenumber
set pumheight=10
set ruler
set scrolloff=4
set shiftround
set shiftwidth=2
set showcmd
set showtabline=2
set sidescrolloff=8
set signcolumn=yes
set smartcase
set smoothscroll
set splitbelow
set splitkeep=screen
set splitright
set t_Co=256
set tabstop=2 softtabstop=2
set undofile
set undolevels=10000
set updatetime=200
set virtualedit="block"
set winminwidth=5
set wrap

"""""""""""""""""
"""""""""""""""""
"" key mappings
"""""""""""""""""
"""""""""""""""""

let mapleader=" "

" term exit
tnoremap <esc><esc> <C-\><C-n>

" wrap navigation
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" buffers
nnoremap <Leader>be :buffers<CR>:buffer<Space>
nnoremap <Leader>bb :buffer #<CR>
nnoremap <S-h> <cmd>bnext<CR>
nnoremap <S-l> <cmd>bprev<CR>
nnoremap <leader>bd <cmd>bdelete<CR>
nnoremap <leader>bo <cmd>%bd\|e#\|bd#<CR>

nnoremap <Esc> :nohlsearch<CR><C-l>

" window
nnoremap <C-Up> <cmd>resize +2<cr>
nnoremap <C-Down> <cmd>resize -2<cr>
nnoremap <C-Left> <cmd>vertical resize -2<cr>
nnoremap <C-Right> <cmd>vertical resize +2<cr>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" visual indent
vnoremap > >gv
vnoremap < <gv

" clear whitespace
autocmd BufWritePre * :%s/\s\+$//e

