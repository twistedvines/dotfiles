set nocompatible

set shiftwidth=2

filetype on
syntax on
set guifont=Monaco\ Regular:h18

set number

set expandtab
set tabstop=2

let mapleader=" "

"reload .vimrc after changes
map <Leader>vr :source ~/.vimrc<CR>
map <Leader>ve :split<CR>:e ~/.vimrc<CR>
"easy to quit
nnoremap <Leader>q :q<CR>
"easy to write
nnoremap <Leader>w :w<CR>

"Leader+v for vertical split, Leader+h for horizontal split
"Matches my tmux config :)
nnoremap <Leader>% :vnew<CR>
nnoremap <Leader>" :new<CR>

set hidden
set history=100

"clear whitespace"
autocmd BufWritePre * :%s/\s\+$//e

set hlsearch

"switch to other file
nnoremap <Leader><Leader> :bnext<CR>

set showmatch

"split configuration
set splitbelow
set splitright

"remap for switching vim panes
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

"tabbing keybinds
nnoremap <Leader>te :tabe<CR>

"config for Livedown plugin
nnoremap <Leader>ldp :LivedownPreview<CR>
nnoremap <Leader>ldk :LivedownKill<CR>
nnoremap <Leader>ldt :LivedownToggle<CR>


"plugin installation & management
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
   \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-ruby/vim-ruby'
Plug 'wincent/command-t'
Plug 'shime/vim-livedown'
Plug 'rodjek/vim-puppet'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'

call plug#end()

colorscheme monokai

"lightline configuration"
let g:lightline = {
        \ 'colorscheme': 'seoul256',
        \ }

"command-t configuration
set wildignore+=*.log,*.sql,*.cache
noremap <Leader>r :CommandTFlush<CR>

autocmd FileType Dockerfile syntax on

"NERDTree config
"Will open NERDTree if no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"maps NERDTree to Leader+e
map <Leader>e :NERDTreeToggle<CR>

"remove auto hash alignment
let g:puppet_align_hashes = 0

"Livedown configuration
let g:livedown_autorun = 0
let g:livedown_open = 1
let g:livedown_port = 1337
let g:livedown_browser = "Firefox"

"vimux keymappings
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vz :VimuxZoomRunner<CR>
