:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline' " Improve view
Plug 'https://github.com/preservim/nerdtree' " File browser
Plug 'https://github.com/preservim/tagbar' " Variables browser
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Autocomplete
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Color theme
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

nnoremap <C-f> :NERDTreeFocus<CR> " ctrl + f to view files
nnoremap <C-t> :TagbarToggle<CR> " ctrl + t to view variables

source $HOME/.config/nvim/plugins/airline.vim

syntax on
colorscheme onedark
