" vim: set foldmethod=marker foldmarker={,} foldlevel=3 spell;

set nocompatible
set encoding=utf-8

call plug#begin('~/.vim/plugged')
Plug 'dockyard/vim-easydir'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'kana/vim-textobj-user'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'elixir-lang/vim-elixir'
Plug 'tpope/vim-rake'
Plug 'mustache/vim-mustache-handlebars'
Plug 'mattn/emmet-vim'
Plug 'gabebw/vim-spec-runner'
Plug 'christoomey/vim-tmux-runner'
Plug 'christoomey/vim-conflicted'
Plug 'chriskempson/base16-vim'
Plug 'stefanoverna/vim-i18n'
call plug#end()

set shell=/bin/sh

inoremap jk <ESC>
let mapleader="\<space>"

set ruler
set cursorline
set cursorcolumn
set colorcolumn=100

"Disable ctrlp cache & use ag directly
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0

let g:airline_powerline_fonts=1
let g:bufferline_echo=0
set laststatus=2

"Git plugins
let g:gitgutter_enabled = 1
let g:gitgutter_realtime = 0

"Script tools
vmap <Leader>z :call I18nTranslateString()<CR>
vmap <Leader>dt :call I18nDisplayTranslation()<CR>
let g:mustache_abbreviations = 1

"Test runners
nnoremap <Leader>va :VtrAttachToPane<CR>
let g:spec_runner_dispatcher = "VtrSendCommand! {command}"
command! RunAllSpecs VtrSendCommandToRunner! rspec spec
command! RunFailedSpecs VtrSendCommandToRunner! rspec spec --only-failures
command! RunMixTest VtrSendCommandToRunner! mix test

map <Leader>t <Plug>RunCurrentSpecFile<CR>
map <Leader>f <Plug>RunFocusedSpec<CR>
map <Leader>l <Plug>RunMostRecentSpec<CR>
map <Leader>a :RunAllSpecs<CR>
map <Leader>q :RunFailedSpecs<CR>
map <Leader>e :RunMixTest<CR>
nnoremap <Leader>z :VtrFocusRunner<CR>
nnoremap <leader>p :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'pry'}<CR>

"Colors
set t_Co=256
let base16colorspace=256
colorscheme base16-monokai
set bg=dark
syntax on "Enable syntax highlighting

set relativenumber
set number

set nohidden "Hide buffers instead of close
set nobackup
set noswapfile
set splitbelow
set splitright

"Access system clipboard on macsox
if $TMUX == ''
  set clipboard+=unnamed
endif

set timeout timeoutlen=500
imap <C-q> <ESC>

"Keystoke reductions
nmap 0 ^
map <C-s> <ESC>:w<CR>
imap <C-s> <ESC>:w<CR>
map <silent> <leader>re :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
autocmd FileType eruby let b:surround_45 = "<% \r %>" "surround with yss-
autocmd FileType eruby let b:surround_61 = "<%= \r %>" "Surround with yss=

"Git mappings
nmap <leader>gb :Gblame<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gw :Gwrite<CR>
nmap <silent> <leader>gf <ESC>/\v^[<=>]{7}( .*\|$)<CR>

set backspace=indent,eol,start " allow backspacing over everything
set nojoinspaces " only insert one space when joining sentences
set expandtab " no actual tabs by default
set tabstop=8  " tab size (how many characters wide tabs are)
set shiftwidth=2 " general purpose indent/unindent size
set softtabstop=2 " number of spaces to insert instead of a tab
set shiftround " round up to the next indentation column
set autoread
set incsearch
set ignorecase
set smartcase
set hlsearch
set list
set listchars=trail:·,tab:▸\ ,eol:¬

filetype plugin indent on
autocmd FileType gitcommit setlocal spell

autocmd VimResized * :wincmd =

nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

set winwidth=80
set winheight:10
:silent! set winminheight:10
set winheight:999

set scrolloff=5
set sidescroll=1
set sidescrolloff=5
