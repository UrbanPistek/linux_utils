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
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Color theme
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Autocomplete - Python, Rust

call plug#end()

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"      \ coc#pum#visible() ? coc#pum#next(1) :
"      \ CheckBackspace() ? "\<Tab>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

nnoremap <C-f> :NERDTreeFocus<CR> " ctrl + f to view files
nnoremap <C-t> :TagbarToggle<CR> " ctrl + t to view variables

source $HOME/.config/nvim/plugins/airline.vim

syntax on
colorscheme onedark
