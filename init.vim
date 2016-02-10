scriptencoding utf8


"   ================================================================ "
"    __   ___   _( ) __   __  ________    ____   _____   _( ) ____   
"   |  \ | | \ / / |/ _\_/_ \|  __/ __|  |  _ \ / _ \ \ / / ||  _ \     
"   | |\\| |\ V /| | | | | | | | ( (__   | |_) / /_\ \ V /| || |_) )    
"   |_| \__| \_/ |_|_| |_| |_|_|  \___|()|____/|_| |_|\_/ |_||____/     	   
"
"   ================================================================ "



call plug#begin('~/.config/nvim/bundle/')

Plug 'Shougo/vimproc.vim', { 'do' : 'make' }
Plug 'itchyny/lightline.vim'

Plug 'Raimondi/delimitMate', { 'for' : ['c', 'cpp', 'java', 'vim', 'scheme',  'lisp', 'python', 'lua', 'haskell', 'javascript', 'css'] }
Plug 'haya14busa/incsearch.vim'
Plug 'scrooloose/nerdtree', { 'on' : 'NERDTreeToggle' }  " F3
Plug 'mhinz/vim-startify'
Plug 'christoomey/vim-tmux-navigator'

"" Colourscheme(s)
Plug 'altercation/vim-colors-solarized'


"" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'


"" Unite
Plug 'Shougo/unite.vim'


"" Text Editing
Plug 'luochen1990/rainbow'
Plug 'Lokaltog/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'chrisbra/unicode.vim'
Plug 'vim-pandoc/vim-pandoc', {'for' : 'markdown' }
Plug 'vim-pandoc/vim-pandoc-syntax', {'for' : 'markdown' }

"" Binary Editing
Plug 'Shougo/vinarise.vim'


"" Coding
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-rooter'
Plug 'ervandew/regex', {'for' : ['java', 'python'] }
Plug 'benekastah/neomake', { 'for' : ['c', 'cpp', 'javascript', 'latex', 'haskell', 'vim', 'python'] }
Plug 'Yggdroot/indentLine', { 'for' : ['c', 'cpp', 'python', 'java', 'lua', 'haskell', 'javascript'] }
Plug 'airblade/vim-gitgutter', { 'for' : ['c', 'cpp', 'java', 'javascript', 'lisp', 'haskell', 'python'] }
Plug 'majutsushi/tagbar', { 'on' : 'TagbarToggle' }
Plug 'bruno-/vim-man', { 'for' : ['c', 'zsh', 'sh', 'awk', 'sed'] }
Plug 'Chiel92/vim-autoformat', { 'for' : ['java', 'javascript', 'latex'] }


"" YouCompleteMe, Snippets & Tags
Plug 'SirVer/ultisnips', { 'on' : [] } | Plug 'honza/vim-snippets', { 'on' : [] }
Plug 'Valloric/YouCompleteMe', { 'on': [] , 'do' : './install.py --clang-completer --system-libclang --system-boost --tern-completer'}

augroup load_us_ycm
  autocmd!
  autocmd InsertEnter * call plug#load('ultisnips', 'YouCompleteMe', 'vim-snippets')
                     \| call youcompleteme#Enable() | autocmd! load_us_ycm
augroup END


"" C and C++
Plug 'brookhong/cscope.vim', { 'for' : ['c', 'cpp'] }
Plug 'vim-jp/vim-cpp', { 'for' : 'cpp'}
Plug 'critiqjo/lldb.nvim', { 'for' : ['c', 'cpp', 'h'] }
Plug 'bbchung/Clamp', { 'for' : ['c', 'cpp', 'lua']}
Plug 'justinmk/vim-syntax-extra', { 'for' : ['c', 'lex'] }


"" Lisps
Plug 'guns/vim-sexp', { 'for' : ['lisp', 'scheme'] }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for' : ['lisp', 'scheme'] }


"" Haskell
Plug 'neovimhaskell/haskell-vim', { 'for' : 'haskell' }
Plug 'eagletmt/ghcmod-vim', { 'for' : 'haskell' }
Plug 'eagletmt/neco-ghc', { 'for' : 'haskell' }
Plug 'enomsg/vim-haskellConcealPlus', { 'for' : 'haskell' }
Plug 'Twinside/vim-haskellFold', { 'for' : 'haskell' }
Plug 'Twinside/vim-hoogle', { 'for' : 'haskell' }
Plug 'bitc/vim-hdevtools', { 'for' : 'haskell' }

"" Miranda
Plug '~/.config/nvim/bundle/miranda.nvim'


"" Java & Python
Plug 'starcraftman/vim-eclim', { 'for' : ['java', 'python'] }
Plug 'tfnico/vim-gradle', { 'for' : 'gradle' }
Plug 'hdima/python-syntax', { 'for' : 'python' }


"" Javascript, HTML5 and CSS
Plug 'jelera/vim-javascript-syntax', { 'for' : 'javascript' }
Plug 'pangloss/vim-javascript', { 'for' : 'javascript' }
Plug 'marijnh/tern_for_vim', { 'for' : 'javascript' }
Plug 'othree/html5.vim', { 'for' : ['html', 'css'] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for' : 'javascript' }
Plug 'matthewsimo/angular-vim-snippets', { 'for' : 'javascript' }
Plug 'burnettk/vim-angular', { 'for' : 'javascript' }


"" LaTeX
Plug 'lervag/vimtex', { 'for' : ['tex', 'latex'] }


"" Shell & Scripting
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


 "======================="
 "      Navigation       "
 "======================="
 
"" unbind ESC
inoremap fj <Esc>

"" local leader
let g:maplocalleader=','

"" Switch between splits
set splitbelow
set splitright
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>
" don't allow vim to resize splits
set noequalalways

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


"augroup cursor
    "au Cursorhold * checktime
"augroup END


"============================="
"      Plugin Options         "
"============================="

"" easymotion
let g:EasyMotion_leader_key = '\#'

"" Neomake
augroup neomaketypes
    autocmd! BufWritePost *.vim Neomake
    autocmd! BufWritePost *.js Neomake
    autocmd! BufWritePost *.latex Neomake
    autocmd! BufWritePost *.hs Neomake
    autocmd! BufWritePost *.py Neomake
augroup END

"" search with incsearch.vim
nmap / <Plug>(incsearch-forward)
nmap ? <Plug>(incsearch-backward)

"" IndentLine
let g:indentLine_char='¦' 
let g:indentLine_color_term = 239

"" Easytags
let g:easytags_dynamic_files=2

"" mips
nnoremap mips :set syntax=mips<CR>

"" Omnifunc completions
set omnifunc=syntaxcomplete#Complete
" miranda
autocmd filetype miranda setlocal omnifunc=mirandacomplete#CompleteMiranda
" Eclim
let g:EclimCompletionMethod='omnifunc'

"" vinarise autodetect
nnoremap <F9> :Vinarise<CR>

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

""javascript
let g:used_javascript_libs = 'angularjs, jasmine'
augroup angularjs
    autocmd BufReadPre *.js let b:javascript_lib_use_angularjs=1
augroup END

try
    source ~/.config/nvim/config/ultisnips.vim
    source ~/.config/nvim/config/cscope.vim
    source ~/.config/nvim/config/ycm.vim
    source ~/.config/nvim/config/unite.vim
    source ~/.config/nvim/config/lightline.vim
    source ~/.config/nvim/config/rainbow.vim
    source ~/.config/nvim/config/haskell.vim
    source ~/.config/nvim/config/terminal.vim
    source ~/.config/nvim/config/startify.vim
catch
endtry
