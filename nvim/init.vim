" Configuration requires the following external options
"
" Open nvim with vim term command
" > alias vim="nvim"
"
" Install vim-plug package manager
" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

""""""""""""""""""""
" General Settings "
"                  "
""""""""""""""""""""

" Syntax highlighting
syntax on

" Fix input lag on windows
set timeoutlen=1000 ttimeoutlen=0

" Misc settings
set number
set shiftwidth=4
set tabstop=4
set scrolloff=8

" Searching
set incsearch " Incremental search 
set hlsearch " Highlight search

" :term settings 
set splitbelow " always split below

" Transparent background
hi Normal guibg=NONE ctermbg=NONE

""""""""""""""""""""
" vim-plug plugins "
"                  "
""""""""""""""""""""

call plug#begin()

" Color scheme
Plug 'morhetz/gruvbox'

" Language support
Plug 'sheerun/vim-polyglot'

" File system explorer 
Plug 'preservim/nerdtree'

" Source file outliner
" Required dependency 'Exuberant Ctags'
" Install via sudo apt install exuberant-ctags
Plug 'preservim/tagbar'

" File system search 
" Requires dependency 'ack'
" Install via sudo apt install ack
Plug 'dyng/ctrlsf.vim'

" File switching between header/implementation files
Plug 'derekwyatt/vim-fswitch'

" Pulling prototypes into implementation files 
Plug 'derekwyatt/vim-protodef'

call plug#end()

"""""""""""""""""""
" Plugin settings "
"                 "
"""""""""""""""""""

" Color scheme
colorscheme gruvbox

" NERDTree file system explorer settings
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=0
let NERDTreeMinimalMenu=1
let NERDTreeWinPos="left"
" NERDTree mappings
nmap <F2> :NERDTreeToggle<CR>

" Tagbar source file outliner settings
let g:tagbar_autofocus=1 " Focus on open
let g:tagbar_autoshowtag=1 " Symbol under cursor highlighted on tagbar
let g:tagbar_position = 'botright vertical' " Position of tagbar
" Tagbar mappings
nmap <F8> :TagbarToggle<CR>

" Ctrlsf file system search settings
" Use the ack tool as the backend
let g:ctrlsf_backend = 'ack'
" Auto close the results panel when opening a file
let g:ctrlsf_auto_close = { "normal":0, "compact":0 }
" Immediately switch focus to the search window
let g:ctrlsf_auto_focus = { "at":"start" }
" Don't open the preview window automatically
let g:ctrlsf_auto_preview = 0
" Use the smart case sensitivity search scheme
let g:ctrlsf_case_sensitive = 'smart'
" Normal mode, not compact mode
let g:ctrlsf_default_view = 'normal'
" Use absoulte search by default
let g:ctrlsf_regex_pattern = 0
" Position of the search window
let g:ctrlsf_position = 'right'
" Width or height of search window
let g:ctrlsf_winsize = '46'
" Search from the current working directory
let g:ctrlsf_default_root = 'cwd'
" Ctrlsf mappings
" (Ctrl+F) Open search prompt (Normal Mode)
nmap <C-F>f <Plug>CtrlSFPrompt 
" (Ctrl-F + f) Open search prompt with selection (Visual Mode)
xmap <C-F>f <Plug>CtrlSFVwordPath
" (Ctrl-F + F) Perform search with selection (Visual Mode)
xmap <C-F>F <Plug>CtrlSFVwordExec
" (Ctrl-F + n) Open search prompt with current word (Normal Mode)
nmap <C-F>n <Plug>CtrlSFCwordPath
" (Ctrl-F + o )Open CtrlSF window (Normal Mode)
nnoremap <C-F>o :CtrlSFOpen<CR>
" (Ctrl-F + t) Toggle CtrlSF window (Normal Mode)
nnoremap <C-F>t :CtrlSFToggle<CR>
" (Ctrl-F + t) Toggle CtrlSF window (Insert Mode)
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

" FSwitch header/implementation switcher settings
" Link cpp and h files with the same name
au! BufEnter *.cpp let b:fswitchdst='hpp,h'
au! BufEnter *.h let b:fswitchdst='cpp,c'
" FSwitch mappings
" (Ctrl+Z) Split vertical window into linked file
nmap <C-Z> :vsplit <bar> :wincmd 1 <bar> :FSRight<CR>

" Protodef pulling prototypes into implementation settings
" Protodef mappings
nmap <buffer> <silent> <leader> ,PP " (\+PP)Pull in prototypes
nmap <buffer> <silent> <leader> ,PN " (\+PN)Pull in protos without namespace def









