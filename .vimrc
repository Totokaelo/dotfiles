" we're running vim, not vi!
set nocompatible

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" enable syntax highlighting
syntax on

let g:airline_theme = "light"

" Enable filetype-specific indenting and plugins
filetype on
filetype plugin on
filetype indent on

" highlight search terms
set hlsearch

set wildmenu

" show matches while typing
set incsearch

" fixed backspace key
set bs=2
set t_kb=

" set max width / min height
set winwidth=105
set winheight=5
set colorcolumn=100

" hide, don't close, buffers
set hidden

" show line numbers unless relativenumber is already set
if (!&relativenumber)
  set number
end
set numberwidth=5

" show ruler
set ruler

" 256 terminal colors
set t_Co=256
set background=dark
color grb256

" who needs swapfiles?
set noswapfile
set nobackup

" remember more commands and search history
set history=1000

" use many muchos levels of undo
set undolevels=1000

" nobody wants to glob these
set wildignore=*.swp,*.bak,*.pyc,*.class

" don't beep
set visualbell
set noerrorbells

" indent 2 spaces
set autoindent
set shiftwidth=2
set softtabstop=2
set expandtab

set cursorline
set showtabline=2

" leader key
let mapleader = ","
let maplocalleader = "\\"

" Quickly edit/reload .vimrc
nnoremap <silent> <leader>ev :vsp $MY_VIMRC<CR>
nnoremap <silent> <leader>sv :so $MY_VIMRC<CR>

" improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

" toggle between paste and nopaste
set pastetoggle=<F2>

" remap : to ;
nnoremap ; :

" background
inoremap <C-Z> <Esc><C-Z>

" clear searches
nnoremap <silent> <leader>/ :let @/=""<CR>

" NERDTree shortcuts
nnoremap <leader>n :NERDTreeClose<CR>:NERDTreeToggle<CR>
nnoremap <leader>m :NERDTreeClose<CR>:NERDTreeFind<CR>
nnoremap <leader>N :NERDTreeClose<CR>

" disable F1 key
nnoremap <F1> <nop>
let g:CommandTAcceptSelectionSplitMap=['<CR>', '<C-g>']

"noremap <Left> <nop>
"noremap <Right> <nop>
"noremap <Up> <nop>
"noremap <Down> <nop>

hi NonText    guifg=#303030 guibg=NONE gui=NONE ctermfg=236 ctermbg=NONE cterm=NONE
hi SpecialKey guifg=#303030 guibg=NONE gui=NONE ctermfg=236 ctermbg=NONE cterm=NONE

function! SwitchNumberingScheme()
  if (&number)
    set relativenumber
  elseif (&relativenumber)
    set number
  end
endfunction

nnoremap <leader>r :call SwitchNumberingScheme()<CR>

set cmdheight=2

" Move current line down
noremap <leader>- ddp

" Move current line up
noremap <leader>_ kddpk

" Uppercase current word
inoremap <c-u> <esc>viwU<esc>ei
nnoremap <leader><c-u> viwU<esc>e

vnoremap <leader>" di""<esc>P
nnoremap H ^
nnoremap L $

"inoremap jk <esc>
"inoremap <esc> <nop>

aug filetype_ruby
  au!

  " Set tab sizes
  au FileType ruby set shiftwidth=2 softtabstop=2

" Comment out a line
  au FileType ruby :nnoremap <buffer> <localleader>c I#

  " Create a method
  au FileType ruby :iabbrev <buffer> defm def<cr>end<up>

  " Create an if block
  au FileType ruby :iabbrev <buffer> ifs if<cr>end<up>

  " Create an if/else block
  au FileType ruby :iabbrev <buffer> ife if<cr>else<cr>end<up><up>

  " Create an example group
  au FileType ruby :iabbrev <buffer> desce describe do<cr>end<up><right><right><right><right><right>

  " Create a spec
  au FileType ruby :iabbrev <buffer> ite it<cr>end<up><right>

  " These are Ruby files in disguise.
  au BufRead,BufNewFile *.ru,Gemfile,Guardfile set filetype=ruby

  " Remove trailing spaces from Ruby files. God help me if I actually
  " want that trailing space.
  au BufWritePre *.rb :%s/\s\+$//e
aug END

" Put contents of unnamed register in OS X clipboard
set clipboard=unnamed

set laststatus=2
"set statusline=%{fugitive#statusline()}\ %h%m%r%=%-14.(%l,%c%V%)\ %P
"set statusline=%f\ %m\ %{fugitive#statusline()}\ %y%=%l,%c\ %P

" who needs swapfiles?
set noswapfile
set nobackup
