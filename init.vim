
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
Plug 'rhysd/clever-f.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'junegunn/limelight.vim'

"" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"" Colourscheme(s)
Plug 'altercation/vim-colors-solarized'

"" Text Editing
Plug 'Raimondi/delimitMate'
Plug 'chrisbra/unicode.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

"" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"" General coding
Plug 'eugen0329/vim-esearch'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-rooter', { 'for' : ['c', 'python', 'rust', 'sh', 'elixir'] }
Plug 'benekastah/neomake' 
Plug 'majutsushi/tagbar',   { 'on' : 'TagbarToggle' }
Plug 'Konfekt/FastFold'

"" deoplete 
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'Shougo/neosnippet.vim' | Plug 'Shougo/neosnippet-snippets' 

"" C (and C++)
Plug 'critiqjo/lldb.nvim',        { 'for' : ['c', 'cpp' ] }
Plug 'zchee/deoplete-clang',      { 'for' : ['c', 'cpp' ] }
Plug 'arakashic/chromatica.nvim', { 'for' : ['c', 'cpp' ] }
Plug 'Shougo/neoinclude.vim',     { 'for' : ['c', 'cpp' ] }

"" Haskell
Plug 'parsonsmatt/intero-neovim',   { 'for' : 'haskell' }
Plug 'eagletmt/neco-ghc',           { 'for' : 'haskell' }
Plug 'Twinside/vim-haskellFold',    { 'for' : 'haskell' }
Plug 'Twinside/vim-hoogle',         { 'for' : 'haskell' }
Plug 'Twinside/vim-haskellConceal', { 'for' : 'haskell' }
Plug 'itchyny/vim-haskell-indent',  { 'for' : 'haskell' }

"" Idris
Plug 'idris-hackers/idris-vim', { 'for' : 'idris' }

"" Python
Plug 'zchee/deoplete-jedi', { 'for' : 'python' }
Plug 'hdima/python-syntax', { 'for' : 'python' }

"" JavaScript
Plug 'carlitux/deoplete-ternjs'

"" LaTeX
Plug 'LaTeX-Box-Team/LaTeX-Box', { 'for' : ['tex', 'latex', 'bib'] }

"" Shell Scripting & Vim
Plug 'vim-scripts/sh.vim--Cla', { 'for' : 'sh' }
Plug 'zchee/deoplete-zsh',      { 'for' : 'sh' }
Plug 'Shougo/neco-vim',         { 'for' : 'vim' }

"" Rust
Plug 'rust-lang/rust.vim',   { 'for' : 'rust' }
Plug 'rhysd/rust-doc.vim',   { 'for' : 'rust' }
Plug 'racer-rust/vim-racer', { 'for' : 'rust' }

"" elixir / erlang
Plug 'elixir-lang/vim-elixir', { 'for' : 'elixir' }
Plug 'awetzel/elixir.nvim',    { 'for' : 'elixir' }

call plug#end()

filetype plugin indent on


 "======================="
 "      Appearance       "
 "======================="

set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=1
colorscheme solarized

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

hi FoldColumn ctermbg=235
hi LineNr ctermfg=200


 "======================="
 "      Navigation       "
 "======================="

"" unbind ESC
inoremap fj <Esc>

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
set nowrap
set relativenumber
set number
set numberwidth=1
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
map yy "*y
map pp "*p

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
augroup Neomake
    autocmd! BufWritePost * Neomake
augroup END

"" location window
map lo :lopen<CR>
map lc :lclose<CR>

"" search with incsearch.vim
nmap / <Plug>(incsearch-forward)
nmap ? <Plug>(incsearch-backward)

"" Omnifunc completions
set omnifunc=syntaxcomplete#Complete

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
  set conceallevel=0 concealcursor=niv
endif

let g:deoplete#sources#clang#libclang_path='/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/include/clang/'
let g:deoplete#sources#clang#std#cpp = 'c++11'
let g:deoplete#sources#clang#sort_algo = 'priority'

let g:neosnippet#enable_snipmate_compatibility=1
let g:neosnippet#snippets_directory='~/.config/nvim/after/snippets'

"" Chromatica
let g:chromatica#libclang_path='/usr/lib/libclang.so'

"" limelight
let g:limelight_conceal_ctermfg = 240
map <Leader>l :Limelight<CR>
map <Leader>L :Limelight!<CR>

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

"" tern
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = 0

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
vmap a{ :Tabularize /{<CR>

"" microML
au BufRead,BufNewFile *.mml setfiletype mml

try
    source ~/.config/nvim/config/python.vim
    source ~/.config/nvim/config/lightline.vim
    source ~/.config/nvim/config/haskell.vim
    source ~/.config/nvim/config/terminal.vim
    source ~/.config/nvim/config/startify.vim
    source ~/.config/nvim/config/rust.vim
    source ~/.config/nvim/config/elixir.vim
catch
endtry
