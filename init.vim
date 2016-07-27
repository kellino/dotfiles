
"    d888888b d8b   db d888888b d888888b    db    db d888888b .88b  d88. 
"      `88'   888o  88   `88'      88       88    88   `88'   88'YbdP`88 
"       88    88V8o 88    88       88       Y8    8P    88    88  88  88 
"       88    88 V8o88    88       88       `8b  d8'    88    88  88  88 
"      .88.   88  V888   .88.      88    db  `8bd8'    .88.   88  88  88 
"    Y888888P VP   V8P Y888888P    YP    VP    YP    Y888888P YP  YP  YP 
                                                                    
call plug#begin('~/.config/nvim/bundle/')

"" general
Plug 'Shougo/vimproc.vim', { 'do' : 'make' }
Plug 'itchyny/lightline.vim'
Plug 'itchyny/calendar.vim'

Plug 'mhinz/vim-startify'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-eunuch' " unix commands
Plug 'justinmk/vim-dirvish' " file browser
Plug 'justinmk/vim-sneak'
Plug 'rhysd/clever-f.vim'
Plug 'haya14busa/incsearch.vim'

"" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"" Colourscheme(s)
Plug 'altercation/vim-colors-solarized'

"" Text Editing
Plug 'Raimondi/delimitMate'
Plug 'Valloric/vim-operator-highlight', { 'for' : ['c', 'java', 'python', 'sh', 'rust', 'vim', 'elixir'] }
Plug 'luochen1990/rainbow', { 'for' : ['c', 'java', 'python', 'sh', 'rust', 'vim'] }
Plug 'chrisbra/unicode.vim'
Plug 'vim-pandoc/vim-pandoc', { 'for' : 'markdown' }
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for' : 'markdown' }
Plug 'godlygeek/tabular'

"" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter', { 'for' : ['c', 'java', 'haskell', 'python', 'sh', 'rust', 'vim'] }

"" General coding
Plug 'eugen0329/vim-esearch'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-rooter', { 'for' : ['c', 'python', 'rust', 'sh', 'elixir'] } 
Plug 'benekastah/neomake', { 'for' : ['c', 'cpp', 'tex', 'latex', 'haskell', 'vim', 'python', 'sh', 'rust', 'erlang', 'elixir', 'markdown'] }
Plug 'majutsushi/tagbar', { 'on' : 'TagbarToggle' }
Plug 'Konfekt/FastFold'
Plug 'thinca/vim-ref'

" deoplete 
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'Shougo/neosnippet.vim' | Plug 'Shougo/neosnippet-snippets' 

"" C 
Plug 'critiqjo/lldb.nvim', { 'for' : 'c' }
Plug 'zchee/deoplete-clang', { 'for' : ['c', 'cpp' ] }
Plug 'arakashic/chromatica.nvim', { 'for' : ['c', 'cpp' ] }
Plug 'Shougo/neoinclude.vim', { 'for' : 'c' }

"" Haskell
Plug 'neovimhaskell/haskell-vim', { 'for' : 'haskell' }
Plug 'eagletmt/ghcmod-vim', { 'for' : 'haskell' }
Plug 'eagletmt/neco-ghc', { 'for' : 'haskell' }
Plug 'Twinside/vim-haskellFold', { 'for' : 'haskell' }
Plug 'Twinside/vim-hoogle', { 'for' : 'haskell' }
Plug 'itchyny/vim-haskell-indent', { 'for' : 'haskell' }
Plug 'bitc/vim-hdevtools', { 'for' : 'haskell' }
"Plug 'pbrisbin/vim-syntax-shakespeare'

"" Java
Plug 'starcraftman/vim-eclim', { 'for' : 'java' }

"" Python
Plug 'zchee/deoplete-jedi', { 'for' : 'python' }
Plug 'hdima/python-syntax', { 'for' : 'python' }

"" LaTeX
Plug 'LaTeX-Box-Team/LaTeX-Box', { 'for' : ['tex', 'latex'] }

"" Shell Scripting & Vim
Plug 'vim-scripts/sh.vim--Cla', { 'for' : 'sh' }
Plug 'zchee/deoplete-zsh', { 'for' : 'sh' }
Plug 'Shougo/neco-vim', { 'for' : 'vim' }

"" Rust
Plug 'rust-lang/rust.vim', { 'for' : 'rust' }
Plug 'rhysd/rust-doc.vim', { 'for' : 'rust' }
Plug 'racer-rust/vim-racer', { 'for' : 'rust' }

"" elixir / erlang
Plug 'elixir-lang/vim-elixir', { 'for' : 'elixir' }
Plug 'awetzel/elixir.nvim', { 'for' : 'elixir' }

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
set relativenumber
set number
set numberwidth=2
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

"" Tab
noremap <Leader>to :tabnew<CR>
noremap <Leader>tt :tabclose<CR>

"" Copy / Paste
map <Leader>yy "*y
map <Leader>pp "*p

"" quick save and quit
map qq :wqa!<CR>
map qa :qa!<CR>
map <leader>w :w<CR>

"" History settings
set history=500
set viminfo='1000,<500,f1
set viewoptions=cursor,folds

"" Recursively search for tagfiles
set tags=./tags;

"============================="
"      Plugin Options         "
"============================="


"" Neomake
augroup neomaketypes
    autocmd! BufWritePost *.c Neomake
    autocmd! BufWritePost *.cpp Neomake
    autocmd! BufWritePost *.vim Neomake
    autocmd! BufWritePost *.latex Neomake
    autocmd! BufWritePost *.hs Neomake
    autocmd! BufWritePost *.py Neomake
    autocmd! bufWritePost *.sh Neomake
    autocmd! bufWritePost *.rs Neomake
    autocmd! bufWritePost *.erl Neomake
    autocmd! BufWritePost *.exs Neomake
    autocmd! BufWritePost *.md Neomake
augroup END

map lo :lopen<CR>
map lc :lclose<CR>

"" search with incsearch.vim
nmap / <Plug>(incsearch-forward)
nmap ? <Plug>(incsearch-backward)

"" Omnifunc completions
set omnifunc=syntaxcomplete#Complete
let g:EclimCompletionMethod='omnifunc'


"" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.rust = '[(\.)(::)]'

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

imap <s-tab>     <Plug>(neosnippet_expand_or_jump)
smap <s-tab>     <Plug>(neosnippet_expand_or_jump)
xmap <s-tab>     <Plug>(neosnippet_expand_target)

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

let g:deoplete#sources#clang#libclang_path='/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/include/clang/'
let g:deoplete#sources#clang#std#cpp = 'c++11'
let g:deoplete#sources#clang#sort_algo = 'priority'

"" Chromatica
let g:chromatica#libclang_path='/usr/lib/libclang.so'

"" ESearch
let g:esearch = {
    \ 'adapter':    'ag',
    \ 'backend':    'nvim',
    \ 'out':        'win',
    \ 'batch_size': 1000,
    \ 'use':      ['visual', 'hlsearch', 'last'],
    \}

"" Unicode
map <F12> <Plug>(MakeDigraph)
nmap ga <Plug>(UnicodeGA)

"" Tagbar
map <F8> :TagbarToggle<CR>

"" mutt 
augroup mutt
    au BufRead /tmp/mutt-* set tw = 72
augroup END

"" rust
let g:rustfmt_autosave=1

"" operator highlight
let g:ophigh_color = 226

"" vim calendar
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

"" tabular
vmap a= :Tabularize /=<CR>
vmap a: :Tabularize /::<CR>
vmap a> :Tabularize /-><CR>
vmap a< :Tabularize /<-<CR>
vmap a( :Tabularize /(<CR>
vmap a[ :Tabularize /[<CR>

try
    source ~/.config/nvim/config/python.vim
    source ~/.config/nvim/config/lightline.vim
    source ~/.config/nvim/config/rainbow.vim
    source ~/.config/nvim/config/haskell.vim
    source ~/.config/nvim/config/terminal.vim
    source ~/.config/nvim/config/startify.vim
    source ~/.config/nvim/config/rust.vim
catch
endtry
