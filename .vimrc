" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    .vimrc                                             :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: melperri <melperri@student.42.fr>          +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2022/02/25 02:54:28 by melperri          #+#    #+#              "
"    Updated: 2022/02/25 03:59:49 by melperri         ###   ########.fr        "
"                                                                              "
" **************************************************************************** "

"""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""

if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Theming
Plug 'nanotech/jellybeans.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Filetype specific plugins
Plug 'vim-syntastic/syntastic'

" Git utils
Plug 'tpope/vim-fugitive'

Plug 'vim/killersheep'

call plug#end()

filetype plugin on

"""""""""""""""""""""""""""""""""""""""""""""""""
" Display options
"""""""""""""""""""""""""""""""""""""""""""""""""

syntax on


let g:jellybeans_overrides = {
\	'background': { 'guibg': '101010'},
\}

colorscheme jellybeans

set number
set relativenumber
set cursorline
set laststatus=2
set showmatch
set wrap

set showmode
set showcmd

" Display whitespace characters
set list
set listchars=tab:>─,eol:¬,trail:\ ,nbsp:¤
set fillchars=vert:│

"""""""""""""""""""""""""""""""""""""""""""""""""
" Utility options
"""""""""""""""""""""""""""""""""""""""""""""""""

set scrolloff=5
set mouse=a
set hidden
set nobackup
set noswapfile

" Reload a file when it is changed from outside
set autoread

" Write the file when we leave the buffer
set autowrite
"
" Make backspace behave as expected
set backspace=eol,indent,start

" Enhance command line completion
set wildmenu
set wildmode=longest:full,list:full
set completeopt=longest,menuone

"""""""""""""""""""""""""""""""""""""""""""""""""
" 42 Norm
"""""""""""""""""""""""""""""""""""""""""""""""""

set colorcolumn=81
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent

"""""""""""""""""""""""""""""""""""""""""""""""""
" Search options
"""""""""""""""""""""""""""""""""""""""""""""""""

set ignorecase
set smartcase
set incsearch
set nohlsearch

""""""""""""""""""""""""""""""""""""""""""""""""""
" Persistence options
""""""""""""""""""""""""""""""""""""""""""""""""""

" Persistent undo
if version >= 703
    set undofile
    set undodir=~/.vim/undodir
    silent !mkdir -p ~/.vim/undodir
endif

""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
""""""""""""""""""""""""""""""""""""""""""""""""""

function Ft_template(...)
	au!
		let ext=expand('%:e')
		if ext=='cpp'
			read ~/.vim/templates/skeleton.cpp
		endif
		if ext=='hpp'
			read ~/.vim/templates/skeleton.hpp
			for i in a:000
				let foundline=search('private:')
				call append(foundline,"\t\t_".expand(i))
			endfor
			silent %s/SKELETON/\=toupper(expand('%:r'))/g
		endif
		%s/skeleton/\=tolower(expand('%:r'))/Ig
		%s/Skeleton/\=expand('%:r')/g
	augroup END
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""
" Mapping
""""""""""""""""""""""""""""""""""""""""""""""""""
" Set "," as map leader
let mapleader = ","

"nnoremap <> :source ~/.vimrc<CR>

" Comment line
nnoremap <C-K> :s/^/\/\//<CR>
nnoremap ; :s/$/\;/<CR>
"autocmd BufNewFile *.cpp 0r ~/.vim/templates/skeleton.cpp



" Search file wich contain word
nnoremap <F3> :call Ft_template(
nnoremap <F4> :grep! "\<<cword>\>" . -r<CR>:copen<CR>
" Uncomment line
"nnoremap <C-S-k> :s/\/\///<CR>

" Disable arrow
"nnoremap <Left> :echo "No left for you!"<CR>;
"vnoremap <Left> :echo "No left for you!"<CR>
"inoremap <Left> <nop>
"nnoremap <Right> :echo "No right for you!"<CR>
"vnoremap <Right> :echo "No right for you!"<CR>
"inoremap <Right>  <nop>
"nnoremap <Up> :echo "No up for you!"<CR>
"vnoremap <Up> :echo "No up for you!"<CR>
"inoremap <Up> <nop>
"nnoremap <Down> :echo "No down for you!"<CR>
"vnoremap <Down> :echo "No down for you!"<CR>
"inoremap <Down> <nop>)
