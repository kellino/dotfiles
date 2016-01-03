
"       __   _( ) __   __  ________    ____   _____   _( ) ____   
"       \ \ / / |/ _\_/_ \|  __/ __|  |  _ \ / _ \ \ / / ||  _ \     
"        \ V /| | | | | | | | ( (__   | |_) / /_\ \ V /| || |_) )    
"         \_/ |_|_| |_| |_|_|  \___|()|____/|_| |_|\_/ |_||____/     	   
"

set nocompatible

call plug#begin('~/.config/nvim/bundle/')

Plug 'Shougo/vimproc.vim', { 'do' : 'make' }
Plug 'itchyny/lightline.vim'

Plug 'Raimondi/delimitMate', { 'for' : ['c', 'cpp', 'java', 'vim', 'scheme',  'lisp', 'python', 'lua', 'clojure', 'haskell', 'javascript'] }
Plug 'tpope/vim-surround', { 'for' :  ['c', 'cpp', 'java', 'vim', 'scheme',  'lisp', 'python', 'lua', 'clojure', 'haskell', 'javascript'] }
Plug 'haya14busa/incsearch.vim'
Plug 'scrooloose/nerdtree', { 'on' : 'NERDTreeToggle' }
Plug 'mhinz/vim-startify'


"" Colourscheme(s)
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/limelight.vim'


"" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'


"" Unite
Plug 'Shougo/unite.vim' | Plug 'Shougo/neomru.vim' 
            \ | Plug 'thinca/vim-unite-history' | Plug 'Shougo/unite-outline'
            \ | Plug 'ujihisa/unite-colorscheme' | Plug 'osyo-manga/unite-quickfix'


"" Text Editing
Plug 'Lokaltog/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'chrisbra/unicode.vim'
Plug 'ervandew/regex', {'for' : ['java', 'python']}
Plug 'luochen1990/rainbow'
Plug 'vim-pandoc/vim-pandoc', {'for' : 'markdown'}
Plug 'vim-pandoc/vim-pandoc-syntax', {'for' : 'markdown'}


"" Coding
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-rooter'
Plug 'scrooloose/syntastic', { 'for' : ['java', 'lisp', 'lex', 'lua', 'tex', 'latex', 'xml', 'html', 'css', 'yacc', 'zsh', 'clojure', 'python', 'javascript'] }
Plug 'benekastah/neomake', { 'for' : ['c', 'cpp', 'java', 'javascript', 'tex', 'latex'] }
Plug 'Yggdroot/indentLine', { 'for' : ['c', 'cpp', 'python', 'java', 'lua', 'haskell', 'javascript'] }
Plug 'airblade/vim-gitgutter', { 'for' : ['c', 'cpp', 'java', 'javascript', 'clojure', 'lisp', 'haskell'] }
Plug 'majutsushi/tagbar', { 'on' : 'TagbarToggle'}
Plug 'bruno-/vim-man', { 'for' : ['c', 'zsh', 'sh', 'awk', 'sed']}
Plug 'Chiel92/vim-autoformat'


"" YouCompleteMe, Snippets & Tags
Plug 'xolox/vim-misc', { 'for' : ['c', 'cpp', 'java', 'lisp', 'lua', 'javascript']}
Plug 'xolox/vim-easytags', { 'for' : ['c', 'cpp', 'java', 'lisp', 'lua', 'javascript']}

Plug 'SirVer/ultisnips', { 'on' : [] } | Plug 'honza/vim-snippets', { 'on' : [] }
Plug 'Valloric/YouCompleteMe', { 'on': [] , 'do' : './install.sh --clang-completer --system-libclang --system-boost'}

augroup load_us_ycm
  autocmd!
  autocmd InsertEnter * call plug#load('ultisnips', 'YouCompleteMe', 'vim-snippets')
                     \| call youcompleteme#Enable() | autocmd! load_us_ycm
augroup END


"" C and C++
Plug 'brookhong/cscope.vim', { 'for' : ['c', 'cpp']}
Plug 'vim-jp/vim-cpp', { 'for' : 'cpp'}
Plug 'justinmk/vim-syntax-extra', { 'for' : ['c', 'flex', 'lex', 'yacc']}


"" Lisps
Plug 'guns/vim-sexp', { 'for' : ['lisp', 'scheme', 'clojure'] }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for' : ['lisp', 'scheme', 'clojure'] }
"" Clojure specific
Plug 'guns/vim-clojure-static', { 'for' : 'clojure' }
Plug 'guns/vim-clojure-highlight', { 'for' : 'clojure' }
Plug 'tpope/vim-salve', { 'for' : 'clojure' }
Plug 'tpope/vim-fireplace', { 'for' : 'clojure' }
Plug 'tpope/vim-classpath', { 'for' : ['clojure'] }


"" Haskell
Plug 'neovimhaskell/haskell-vim', { 'for' : 'haskell' }
Plug 'eagletmt/ghcmod-vim', { 'for' : 'haskell' }
Plug 'eagletmt/neco-ghc', { 'for' : 'haskell' }
Plug 'Twinside/vim-haskellConcealPlus', { 'for' : 'haskell' }
Plug 'Twinside/vim-haskellFold', { 'for' : 'haskell' }
Plug 'Twinside/vim-hoogle', { 'for' : 'haskell' }
Plug 'bitc/vim-hdevtools', { 'for' : 'haskell' }

Plug 'vim-scripts/Miranda-syntax-highlighting', { 'for' : 'miranda' }


"" Java
Plug 'artur-shaik/vim-javacomplete2', { 'for' : 'java' }
Plug 'tfnico/vim-gradle', { 'for' : 'gradle' }


"" Javascript, HTML5 and CSS
Plug 'jelera/vim-javascript-syntax', { 'for' : 'javascript' }
Plug 'pangloss/vim-javascript', { 'for' : 'javascript' }
Plug 'marijnh/tern_for_vim', { 'for' : 'javascript' }
Plug 'othree/html5.vim', { 'for' : ['html', 'css'] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for' : 'javascript' }
Plug 'mattn/emmet-vim', { 'for' : ['html', 'css'] }
Plug 'matthewsimo/angular-vim-snippets', { 'for' : 'javascript' }
Plug 'burnettk/vim-angular', { 'for' : 'javascript' }


"" LaTeX
Plug 'lervag/vimtex', { 'for' : 'tex'}


"" Go
Plug 'fatih/vim-go', { 'for' : 'go' }


"" Shell & Scripting
Plug 'awk.vim', { 'for' : 'awk'}
Plug 'vim-scripts/sh.vim--Cla', { 'for' : ['zsh', 'sh'] }


call plug#end()

filetype plugin indent on


 "======================="
 "      Appearance       "
 "======================="

set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
colorscheme solarized

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

hi FoldColumn ctermbg=235
hi LineNr ctermfg=200

let g:limelight_conceal_ctermfg=240
let g:limelight_conceal_coefficient=0.7
let g:limelight_priority=-1


 "======================="
 "      Navigation       "
 "======================="
 
"" shell
set shell=/usr/bin/zsh

"" unbind ESC
inoremap fj <Esc>

"" local leader
let maplocalleader=","

"" Switch between splits
set splitbelow
set splitright
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>
" don't allow vim to resize splits
set noequalalways

set fileencodings=utf-8
scriptencoding utf-8

set cmdheight=2
set showcmd
set showmatch
set nowrap
set number
set mousefocus
set sidescrolloff=0
set autoindent
set copyindent
set textwidth=100
set noshowmode

"" tabs
set shiftwidth=4
set softtabstop=4
set expandtab

"" search
set incsearch
set ignorecase
set smartcase
set nohlsearch
set wrapscan

set scrolloff=10
set scrolljump=3

set hidden

"" Remove backups
set nobackup
set nowritebackup
set noswapfile

set completeopt=longest,menuone
set wildmenu
set wildmode=longest:list,full

"" Folding
set foldenable
set foldcolumn=1
set foldmethod=manual
set foldnestmax=1
set foldlevel=0

"" Tab
noremap <Leader>to :tabnew<CR>
noremap <Leader>tt :tabclose<CR>

"" Copy / Paste
map <Leader>yy "*y
map <Leader>pp "*p

"" History settings
set history=500
set viminfo='1000,<500,f1
set viewoptions=cursor,folds

"" Recursively search for tagfiles
set tags=./tags;


let g:lisp_rainbow=1
let g:listp_instring=1
let g:lispsyntax_clisp=1
let g:c_syntax_for_h=1
let g:tex_conceal=''


"" Autoload configuration when .vimrc changes
autocmd! BufWritePost init.vim source %

set autoread
au Cursorhold * checktime


"============================="
"      Plugin Options         "
"============================="

"" easymotion
let g:EasyMotion_leader_key = '\#'

"" Neomake
autocmd! BufWritePost *.java Neomake

"" search with incsearch.vim
nmap / <Plug>(incsearch-forward)
nmap ? <Plug>(incsearch-backward)

"" IndentLine
let g:indentLine_char='¦' 
let g:indentLine_color_term = 239

"" Easytags
let g:easytags_dynamic_files=2

"" limelight
noremap <F10> :Limelight!!<CR>

"" delimitMate
au FileType clojure let b:delimitMate_quotes = "\""

"" Omnifunc completions
set ofu=syntaxcomplete#Complete
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

"" html
map <F11> :!html5check %<CR>

"" Android
let g:android_sdk_path="/opt/android-sdk/"

"" Fireplace
noremap <F9> :Eval<CR>

"" Multiple-cursors
let g:multi_cursor_next_key='<C-u>'
let g:multi_cursor_prev_key='<C-i>'
let g:multi_cursor_skip_key='<C-o>'
let g:multi_cursor_quit_key='<Esc>'

"" Unicode
map <F12> <Plug>(MakeDigraph)
nmap ga <Plug>(UnicodeGA)

"" Tagbar
map <F8> :TagbarToggle<CR>

"" JavaComplete2
imap <F4>a <Plug>(JavaComplete-Imports-Add)
imap <F4>r <Plug>(JavaComplete-Imports-RemoveUnused)
nmap <F4>a <Plug>(JavaComplete-Imports-Add)
nmap <F4>r <Plug>(JavaComplete-Imports-RemoveUnused)

"" syntastic
function! SetSyntastic()
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_always_populate_loc_list=1
    let g:syntastic_auto_loc_list=1
    let g:syntastic_check_on_open=1
    let g:syntastic_check_on_wq=0
endfunction

""javascript
let g:used_javascript_libs = 'angularjs, jasmine'
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1

source ~/.config/nvim/config/ultisnips.vim
source ~/.config/nvim/config/cscope.vim
source ~/.config/nvim/config/ycm.vim
source ~/.config/nvim/config/unite.vim
source ~/.config/nvim/config/lightline.vim
source ~/.config/nvim/config/rainbow.vim
source ~/.config/nvim/config/haskell.vim
source ~/.config/nvim/config/terminal.vim
source ~/.config/nvim/config/startify.vim
