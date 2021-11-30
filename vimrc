call plug#begin()

  Plug 'preservim/nerdtree', { 'on':	'NERDTreeToggle' }
  Plug 'tpope/vim-surround'
  "Plug 'vim-airline/vim-airline'
  Plug 'jiangmiao/auto-pairs'
  Plug 'easymotion/vim-easymotion'
  Plug 'vimwiki/vimwiki'

"colorchemes
  Plug 'morhetz/gruvbox'

call plug#end()

"mapping

map <C-n> :NERDTreeToggle<CR>
map <S-t> :tabedit<CR>

set number
set autoindent

set hlsearch
set incsearch

set nocompatible
filetype plugin on
syntax on

"Vimwiki diary template hack
au BufNewFile ~/vimwiki/diary/*.wiki :silent 0r !~/.vim/bin/generate-vimwiki-diary-template '%'
