" pathogen + bundles
runtime bundle/vim-pathogen/autoload/pathogen.vim
" Bundle: tpope/vim-pathogen
" Bundle: altercation/vim-colors-solarized
" Bundle: vim-scripts/vmark.vim--Visual-Bookmarking
" Bundle: nathanaelkane/vim-indent-guides
" Bundle: wincent/Command-T
" Bundle: vim-scripts/AutoTag
" Bundle: skwp/vim-ruby-conque 
" Bundle: tpope/vim-surround
" Bundle: tpope/vim-endwise
call pathogen#infect()

filetype off
call pathogen#runtime_append_all_bundles() 

syntax on
filetype plugin indent on
set nobk
set nobackup
set nowritebackup
set wildignore=*~


"folding
set foldenable
set foldmethod=syntax
set foldlevelstart=4

" solarized
set background=dark
colorscheme solarized
set cursorline
autocmd VimEnter * :IndentGuidesEnable
set guioptions-=T
" don't know what this is actually
au BufNewFile,BufRead *.apk set filetype=apk

" tab autocompletion
imap <Tab> <C-P>

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

"open the window larger than normal (100 wide by 40 tall)
"win 100 40

set nocompatible
"allow for c,w to change part of a camel-cased word
"source $HOME/Dropbox/dev/camelcasemotion.vim

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
:let g:ConqueTerm_CWInsert = 1
:let g:ConqueTerm_InsertOnEnter = 0
" show tabs                                                                                                                                                                                                         
:2match ExtraWhitespace /\t/

"from here down is the default _vimrc
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

augroup CommandTExtension
  autocmd!
  autocmd FocusGained * CommandTFlush
  autocmd BufWritePost * CommandTFlush
 augroup END

 " Cmd-Shift-R for RSpec
nmap <silent> <D-R> :call RunRspecCurrentFileConque()<CR>
" Cmd-Shift-L for RSpec Current Line
nmap <silent> <D-L> :call RunRspecCurrentLineConque()<CR>
" ,Cmd-R for Last conque command
nmap <silent> ,<D-R> :call RunLastConqueCommand()<CR>
