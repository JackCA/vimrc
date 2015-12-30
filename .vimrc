filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

Bundle 'altercation/vim-colors-solarized'
Bundle 'NLKNguyen/papercolor-theme'
Bundle 'Wutzara/vim-materialtheme'
Bundle "daylerees/colour-schemes", { "rtp": ""}
Bundle 'Yggdroot/indentLine'

Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-surround'
Bundle 'thoughtbot/vim-rspec'

Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-fugitive'
Bundle 'bitc/vim-bad-whitespace'
Bundle 'scrooloose/nerdcommenter'
Bundle 'vim-scripts/AutoTag'
Bundle 'Raimondi/delimitMate'
Bundle 'sjl/gundo.vim'
Bundle 'digitaltoad/vim-jade'
Bundle 'othree/html5.vim'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'bling/vim-airline'
Bundle 'mbbill/undotree'
Bundle 'airblade/vim-gitgutter'
Bundle 'goldfeld/vim-seek'
Bundle 'myusuf3/numbers.vim'
Bundle 'mileszs/ack.vim'
Bundle 'terryma/vim-expand-region'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Bundle "Valloric/YouCompleteMe"
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"
Plugin 'othree/yajs.vim'
Bundle 'wesQ3/vim-windowswap'
Bundle 'claco/jasmine.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Konfekt/FastFold'
Bundle 'miyakogi/conoline.vim'
Bundle 'JazzCore/ctrlp-cmatcher'
Bundle 'rking/ag.vim'

"
set backupdir=$HOME/vim-backups

syntax on
au BufReadPost *.hamlc set syntax=haml
au BufReadPost *._sass set syntax=sass
filetype plugin indent on
set nobk
set nobackup
set nowritebackup
set wildignore=*~,*/tmp/*,tmp/*,dist/*,*.swp,*.bak,*.pyc,*.class,*.jar,*.gif,*.png,*.jpg
set wildignore+=vendor

" Leader
let mapleader = " "

" colorscheme
colorscheme papercolor
"set background=dark
"colorscheme Tomorrow-Night

" font
if has('gui_running')
  set guifont=Sauce\ Code\ Powerline:h11
endif

" vv visual expansion
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" tagbar
nmap <F8> :TagbarToggle<CR>

"folding
set foldenable
set foldmethod=indent
set foldlevelstart=4

" syntastic
let g:syntastic_enable_balloons = 1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" snippets
imap aa <esc>a<Plug>snipMateNextOrTrigger
smap aa <Plug>snipMateNextOrTrigger

" gundo
nnoremap <C-G> :GundoToggle<CR>

" use silver searcher
if executable('ag')
  " Note we extract the column as well as the file and line number
  set grepprg=ag\ --nogroup\ --nocolor\ --column
  set grepformat=%f:%l:%c%m
endif

nnoremap \ :Ag<SPACE>
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" CtrlP auto cache clearing.
" ----------------------------------------------------------------------------
function! SetupCtrlP()
  if exists("g:loaded_ctrlp") && g:loaded_ctrlp
    augroup CtrlPExtension
      autocmd!
      autocmd FocusGained  * CtrlPClearCache
      autocmd BufWritePost * CtrlPClearCache
    augroup END
  endif
endfunction
if has("autocmd")
  autocmd VimEnter * :call SetupCtrlP()
endif


" rspec
let g:rspec_runner = "os_x_iterm"
" RSpec.vim mappings
"map <Leader>t :call RunCurrentSpecFile()<CR>
"map <Leader>s :call RunNearestSpec()<CR>
"map <Leader>l :call RunLastSpec()<CR>
"map <Leader>a :call RunAllSpecs()<CR>

" easymotion
map <Leader> <Plug>(easymotion-prefix)
nmap s <Plug>(easymotion-s)

set nocompatible   " Disable vi-compatibility
set encoding=utf-8 " Necessary to show Unicode glyp
set statusline+=%f
set laststatus=2

set cursorline

set guioptions-=T

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

"autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

"the so-called 'mandatory option'
:set hidden

let NERDTreeIgnore = ['\.pyc$', 'tmp', '\~$']
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

set nocompatible

"make it so mouse and keyboard don't exit select mode."
"this makes it so we can select with the mouse and then act on that block."
set selectmode=""


" create a shortcut to get out of insert mode by typing 'jj'
inoremap jj <ESC>

"autoreload this file
augroup reload_vimrc " {
      autocmd!
          autocmd BufWritePost $MYVIMRC source $MYVIMRC
        augroup END " }"

" don't require W to move tabs
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>
nmap <C-H> <C-W><C-H>

nmap <C-f> :Ack<space>

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

function! HasConfig(file, dir)
    return findfile(a:file, escape(a:dir, ' ') . ';') !=# ''
endfunction

autocmd BufNewFile,BufReadPre *.js  let b:syntastic_checkers =
    \ HasConfig('.eslintrc', expand('<amatch>:h')) ? ['eslint'] :
    \ HasConfig('.jshintrc', expand('<amatch>:h')) ? ['jshint'] :
    \     ['standard']

"from here down is the default _vimrc
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

