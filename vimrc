" General {

" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving, sourceing and editing
nnoremap <leader>w :write!<cr>
nnoremap <leader>ev :edit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Copy
set clipboard=unnamedplus


" }

" Plugins and Settings {
call plug#begin('~/.vim/plugged')

" Colorscheme
Plug 'altercation/vim-colors-solarized'

" Tmux
Plug 'christoomey/vim-tmux-navigator'

" Tagbar
Plug 'majutsushi/tagbar'

" Snippets
Plug 'SirVer/ultisnips'

" Fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'

" Statusline
Plug 'itchyny/lightline.vim'

" Explorer
Plug 'scrooloose/nerdtree'

" Commenting
Plug 'tpope/vim-commentary'

" Surround stuff
Plug 'tpope/vim-surround'

" Align stuff
Plug 'junegunn/vim-easy-align'

" Repeat stuff that works with other plugins
Plug 'tpope/vim-repeat'

" Asychronous build and test
Plug 'tpope/vim-dispatch'

" Incsearch
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'

" Easy motion
Plug 'easymotion/vim-easymotion'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" PL/B
Plug 'daggemann/vim-plb'

" Multicursor
Plug 'terryma/vim-multiple-cursors'

" Golang
Plug 'fatih/vim-go'

" Vim ack
Plug 'mileszs/ack.vim'

call plug#end()

" Settings {

" CtrlP {
nnoremap <leader>f :CtrlPMRUFiles<CR>

" }

" NERDTree {
nnoremap <leader>nn :NERDTreeToggle<CR>
let g:NERDTreeWinPos = 'right'
" }

" UltiSnips {
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"                                            
let g:UltiSnipsJumpForwardTrigger="<tab>"                                       
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" }

" vim-easy-align {
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"}

" Ack {
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" }

" vim-plb {
let g:plb_runtime_dir = $PLBCMP_OUT
" }

" incsearch.vim and easymotion {
map <space> <Plug>(incsearch-easymotion-/)
map <c-@> <Plug>(incsearch-easymotion-?)

" }

" lightline {
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
" }

" vim-go {
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_autosave = 1
" }

" }

" }

" User interface {

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the wild menu
set wildmenu

"Always show current position
set ruler

" Set relative numbers
set relativenumber

" Height of the command bar
set cmdheight=2

" Add a bit extra margin to the left
set foldcolumn=1

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 

" How many tenths of a second to blink when matching brackets
set matchtime=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Always show the status line
set laststatus=2

" Allow changing buffers without saving them
set hidden
" }

" Colors and fonts {

" Enable syntax highlighting
syntax enable 

" Colorscheme and settings
if has('gui_running')
    set background=light
else
    set t_Co=256
    set background=dark
    let g:solarized_termcolors=256
endif
colorscheme solarized

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" }

" Text, tab and indent {

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set linebreak
set textwidth=500

set autoindent "Auto indent
set smartindent "Smart indent
set wrap "Wrap lines

" }

" Visual mode {

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann


vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" }

" Moving around, tabs, windows and buffers {
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
" Using incsearch.vim instead
" nnoremap <space> /
" nnoremap <c-space> ?

" Disable highlight when <leader><cr> is pressed
nnoremap <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" Close the current buffer
nnoremap <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
nnoremap <leader>ba :bufdo bd<cr>

nnoremap <leader>l :bnext<cr>
nnoremap <leader>h :bprevious<cr>

" Create new tab
nnoremap <leader>tn :tabnew<cr> 
" Close all other tabs than the current
nnoremap <leader>to :tabonly<cr>
" Close current tab
nnoremap <leader>tc :tabclose<cr>
" Move current tab to tab number given as input (starting at 0)
nnoremap <leader>tm :tabmove 
" Go to tab number given as input (starting at 0)
nnoremap <leader>t<leader> :tabnext 
" Let <leader>'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabnext ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
nnoremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
" From https://vi.stackexchange.com/questions/4888/how-should-the-option-switchbuf-work
" 'switchbuf' is only honored by quickfix commands (like :cc) and buffer-splitting commands (like :sb).
" It doesn't affect :buffer and other "regular" buffer-related commands.
set switchbuf=useopen,usetab,newtab
set stal=1

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Quickfix
"nnoremap <C-n> :cnext<CR>
"nnoremap <C-m> :cprevious<CR>
"nnoremap <leader>a :cclose<CR>

" }

" Editing { 
"

" Exit insert mode
inoremap jk <Esc>

" Remap VIM 0 to first non-blank character
nnoremap 0 ^

" select last paste in visual mode
nnoremap <expr> gv '`[' . strpart(getregtype(), 0, 1) . '`]'
" }

" Filetype {

" PL/B {

augroup filetype_plb
    autocmd!
    autocmd filetype plb nnoremap <localleader>sc I//<ESC>100A-<ESC>
augroup END
" }

" Golang {
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" }

" }

" Backup {

set nobackup
set nowb
set noswapfile

" }

" Helper functions {

" Function for searching what is visually selected
function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

function! <SID>Repeat(char, times)
    execute "normal a" . repeat(a:char, a;times)
endfunction
" }

" vim: set foldmarker={,} foldlevel=0 foldmethod=marker: 
