
" Setter
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set relativenumber
set nu
set nohlsearch
set incsearch
" Plugin
call plug#begin('~/.config/nvim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'sainnhe/gruvbox-material'
Plug '/morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'preservim/nerdtree'

call plug#end()

" Autocompletion + lsp
set completeopt=menuone,noinsert,noselect
set shortmess+=c
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua require'lspconfig'.pyls.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.cmake.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.clangd.setup{ on_attach=require'completion'.on_attach }

" Mappings
let mapleader= " "
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>n :NERDTree<CR>
nnoremap <leader>nn :NERDTreeClose<CR>
nnoremap <F8> :w <CR> :!gcc % -Wall -pthread -o %< && ./%< <CR>
inoremap ' ''<ESC>ha
inoremap " ""<ESC>ha
inoremap ` ``<ESC>ha
inoremap ( ()<ESC>ha
inoremap [ []<ESC>ha
inoremap { {<CR><TAB><TAB><CR>}<ESC>ka
inoremap /* /** */<ESC>2ha
" Theme
syntax on
colorscheme onedark
highlight Normal guibg=none


