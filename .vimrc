filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
"  " required! 
Bundle 'gmarik/vundle'

Bundle 'Lokaltog/powerline'
Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-scripts/vmark.vim--Visual-Bookmarking'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'wincent/Command-T'
Bundle 'kchmck/vim-coffee-script'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-fugitive'
Bundle 'bitc/vim-bad-whitespace'
Bundle 'scrooloose/nerdcommenter'
Bundle 'vim-scripts/AutoTag'
Bundle 'ervandew/supertab'
Bundle 'Raimondi/delimitMate'

syntax on
filetype plugin indent on
set nobk
set nobackup
set nowritebackup
set wildignore=*~

" solarized
set background=dark
colorscheme solarized

" tagbar
nmap <F8> :TagbarToggle<CR>

"folding
set foldenable
set foldmethod=syntax
set foldlevelstart=4

" syntastic
let g:syntastic_enable_balloons = 1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" powerline
set guifont=PowerlineSymbols\ for\ Powerline
python import sys; sys.path.append("/Library/Python/2.7/site-packages")
python from powerline.ext.vim import source_plugin; source_plugin()
set nocompatible   " Disable vi-compatibility
set encoding=utf-8 " Necessary to show Unicode glyp
set laststatus=2

set cursorline

autocmd VimEnter * :IndentGuidesEnable
set guioptions-=T
au BufNewFile,BufRead *.apk set filetype=apk

"set tabs to 4 spaces.
set tabstop=2
set expandtab
set shiftwidth=2

" ruby and yaml files are indented by two
autocmd FileType ruby,js,rdoc,cucumber,yaml set softtabstop=2 tabstop=2 shiftwidth=2

"automatically indent
set smartindent
set cindent

"show line numbers on the left
set number

"case insensitive search
set ignorecase
set smartcase

"search the whole build tree for ctags
set tags=tags;/

:let g:indent_guides_enable_on_vim_startup = "1"
"autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

"the so-called 'mandatory option'
:set hidden

let NERDTreeIgnore = ['\.pyc$', '\~$']
map <F2> :NERDTreeToggle<CR>

set nocompatible

"make it so mouse and keyboard don't exit select mode."
"this makes it so we can select with the mouse and then act on that block."
set selectmode=""

" this gives me convenient key mappings for window movement
noremap <silent> ,h :wincmd h<CR>
noremap <silent> ,j :wincmd j<CR>
noremap <silent> ,k :wincmd k<CR>
noremap <silent> ,l :wincmd l<CR>

" a quick way to bring up Ack 
noremap <silent> ,a :Ack --follow 

" create a shortcut to get out of insert mode by typing 'jj'
inoremap jj <ESC>

" highlight unwanted whitespace
:highlight ExtraWhitespace ctermbg=blue guibg=blue
" show trailing whitespace:
:match ExtraWhitespace /\s\+\%#\@<!$/
" show tabs
:2match ExtraWhitespace /\t/

"from here down is the default _vimrc
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

" don't require W to move tabs
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

augroup CommandTExtension
  autocmd!
  autocmd FocusGained * CommandTFlush
  autocmd BufWritePost * CommandTFlush
 augroup END
if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }
endif
