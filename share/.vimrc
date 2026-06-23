
" An example for a vimrc file.
"
" Maintainer:	The Vim Project <https://github.com/vim/vim>
" Last Change:	2023 Aug 10
" Former Maintainer:	Bram Moolenaar <Bram@vim.org>
"
" To use it, copy it to
"	       for Unix:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"	 for MS-Windows:  $VIM\_vimrc
"	      for Haiku:  ~/config/settings/vim/vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" 기본
set nocompatible
set number
set hidden
set clipboard=unnamedplus
set backspace=indent,eol,start
set encoding=utf-8
set cursorline
set ruler
set showcmd
set termguicolors
set scrolloff=5

" 검색
set ignorecase
set smartcase
set incsearch
set hlsearch

" 문법 강조
syntax on

" 들여쓰기 관련
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set cindent

" 공백 보기
set list
set listchars=tab:»·,trail:·

"긴 줄 자동 줄바꿈 안함
set nowrap

" 중괄호 짝 강조
set showmatch

" undo 히스토리 유지
set undofile

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
Plug 'vhda/verilog_systemverilog.vim'
Plug 'morhetz/gruvbox'
Plug 'lervag/vimtex'

call plug#end()

nnoremap <silent> <CR> :if v:hlsearch \| noh \| endif<CR><CR>

autocmd FileType verilog setlocal tabstop=2 shiftwidth=2

set background=dark
colorscheme gruvbox
set nomodeline

filetype plugin indent on

let g:tex_flavvor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'latexmk'
