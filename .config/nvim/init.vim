filetype off

" vim-plug
call plug#begin('~/.local/share/nvim/plugged')
" color schemes
Plug 'arcticicestudio/nord-vim'
Plug 'altercation/vim-colors-solarized'

Plug 'leafgarland/typescript-vim'
" version control
Plug 'tpope/vim-fugitive'

" helpers
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'mtth/scratch.vim'
" Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mboughaba/i3config.vim'
Plug 'chiel92/vim-autoformat'
Plug 'valloric/youcompleteme'

" typescript
Plug 'shougo/vimproc.vim', {'do' : 'make'}
Plug 'quramy/tsuquyomi'

" utils
Plug 'vim-airline/vim-airline'
call plug#end()

" update plugins and vim-plug
com! PU PlugUpdate | PlugUpgrade

" filetype settings
filetype on
filetype plugin on
filetype indent on

" line numbers
set number relativenumber

set autoindent
set shiftwidth=2
set smartindent
set cursorline
set scrolloff=4
set smartcase

" spaces and tabs
set expandtab
set softtabstop=2
set smarttab

" nord color scheme
let g:nord_italic=1
let g:nord_underline=1
let g:nord_italic_comments=1
colorscheme nord
" highlight Folded ctermbg=11

" " clear trailing whitespaces on save
" autocmd BufWritePre * %s/\s\+$//e

" set leader key
let mapleader="\<space>"

" turn off search highlight
nnoremap <leader>ho :nohlsearch<CR>

" test view saving
noremap <F11> mkHmlggg?G`lzt`k

" auto format
nnoremap <leader>af :Autoformat<CR>
let g:autoformat_verbosemode=1

" frequent files mappings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :so $MYVIMRC<CR>
nnoremap <leader>sz :so ~/.zshrc<CR>

" switch between scss, html, ts files
noremap <F2> :e %<.ts<CR>
noremap <F3> :e %<.html<CR>
noremap <F4> :e %<.scss<CR>

" disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" swap colon and semicolon
noremap ; :
noremap : ;

" preserve selection after indentation
vmap > >gv
vmap < <gv

" treat broken line as separate lines
map j gj
map k gk

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" open fuzzy finder
noremap <leader>ff :FZF<CR>

autocmd BufNewFile,BufRead config set syntax=config
autocmd BufNewFile,BufRead *.git/config set syntax=gitconfig
autocmd BufNewFile,BufRead *.myconf/config set syntax=gitconfig
autocmd BufNewFile,BufRead ~/.i3/config set filetype=i3config

" netrw settings
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_altv=0
autocmd FileType netrw setl bufhidden=delete

" formatters definition
let g:formatdef_html_formatter='"html-beautify -s 2 -A aligned-multiple -w 100"'
let g:formatters_html=['html_formatter']

let g:formatdef_scss_formatter='"scssfmt % %"'
let g:formatters_scss=['scss_formatter']

" let g:formatdef_ts_formatter='"tsfmt --useTslint /home/alexander/development/tzoa/fm/fleet-management/tslint.json --stdin %"'
" let g:formatters_typescript=['ts_formatter']

" diff of current buffer with original
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

" " save views
" augroup remember_folds
"   autocmd!
"   autocmd BufWinLeave * mkview
"   autocmd BufWinEnter * silent! loadview
" augroup END