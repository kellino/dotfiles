

"   dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
"   ddd  dddddddddddd  dd  ddddddddddddddddd  dddddddddddddddddddd
"   ddddddddddddddddddddd  ddddddddddddddddddddddddddddddddddddddd
"   ddd  dd  dd   ddd  dd     dddd   dddddd   dd  dd   ddd   ddddd
"   ddd  dd   ddd  dd  dd  dddddddd  ddddd    dd   dddd   ddd  ddd
"   ddd  dd  dddd  dd  dd  ddddddddd  ddd  d  dd  ddddd  dddd  ddd
"   ddd  dd  dddd  dd  dd  ddd  ddddd  d  dd  dd  ddddd  dddd  ddd
"   ddd  dd  dddd  dd  ddd     dd  ddd   ddd  dd  ddddd  dddd  ddd
"   dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
"   dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd

call plug#begin('~/.config/nvim/bundle/')

"" general
Plug 'Shougo/vimproc.vim', { 'do' : 'make' }
Plug 'itchyny/lightline.vim'

Plug 'mhinz/vim-startify'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-eunuch'
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
Plug 'Valloric/vim-operator-highlight'
Plug 'luochen1990/rainbow', { 'for' : ['c', 'java', 'python', 'sh', 'rust', 'vim', 'haskell'] }
Plug 'chrisbra/unicode.vim'
Plug 'vim-pandoc/vim-pandoc', { 'for' : 'markdown' }
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for' : 'markdown' }
Plug 'godlygeek/tabular'
Plug 'ervandew/regex', { 'for' : ['java', 'python'] }

"" Git
Plug 'tpope/vim-fugitive', { 'for' : ['c', 'java', 'haskell', 'python', 'sh', 'rust', 'vim'] }
Plug 'airblade/vim-gitgutter', { 'for' : ['c', 'java', 'haskell', 'python', 'sh', 'rust', 'vim'] }
Plug 'junegunn/gv.vim', { 'for' : ['c', 'java', 'haskell', 'python', 'sh', 'rust', 'vim'] } " git source tree viewer

"" General coding
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-rooter'
Plug 'benekastah/neomake', { 'for' : ['c', 'tex', 'latex', 'haskell', 'vim', 'python', 'sh', 'rust'] }
Plug 'majutsushi/tagbar', { 'on' : 'TagbarToggle' }

"" YouCompleteMe, Snippets & Tags
Plug 'SirVer/ultisnips', { 'on' : [] } | Plug 'honza/vim-snippets', { 'on' : [] }

Plug 'Valloric/YouCompleteMe', { 'on': [] , 'do' : './install.py --system-libclang --clang-completer --racer-completer --gocode-completer'}

augroup load_us_ycm
  autocmd!
  autocmd InsertEnter * call plug#load('ultisnips', 'YouCompleteMe', 'vim-snippets')
                     \| call youcompleteme#Enable() | autocmd! load_us_ycm
augroup END

"" C 
Plug 'critiqjo/lldb.nvim', { 'for' : 'c' }
Plug 'bbchung/Clamp', { 'for' : ['c', 'h'] }
Plug 'justinmk/vim-syntax-extra', { 'for' : ['c', 'lex', 'bison'] }

"" Haskell
Plug 'neovimhaskell/haskell-vim', { 'for' : 'haskell' }
Plug 'eagletmt/ghcmod-vim', { 'for' : 'haskell' }
Plug 'eagletmt/neco-ghc', { 'for' : 'haskell' }
Plug 'Twinside/vim-haskellFold', { 'for' : 'haskell' }
Plug 'Twinside/vim-hoogle', { 'for' : 'haskell' }

"" Java
Plug 'starcraftman/vim-eclim', { 'for' : 'java' }

"" Python
Plug 'klen/python-mode', { 'for' : 'python' }
Plug 'hdima/python-syntax', { 'for' : 'python' }

"" LaTeX
Plug 'LaTeX-Box-Team/LaTeX-Box'

"" Shell & Scripting
Plug 'vim-scripts/sh.vim--Cla', { 'for' : 'sh' }

"" Rust
Plug 'rust-lang/rust.vim', { 'for' : 'rust' }
Plug 'rhysd/rust-doc.vim', { 'for' : 'rust' }

"" Go
Plug 'fatih/vim-go'

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

let g:c_syntax_for_h=1
" let g:tex_conceal=''


"============================="
"      Plugin Options         "
"============================="

"" Neomake
augroup neomaketypes
    autocmd! BufWritePost *.vim Neomake
    autocmd! BufWritePost *.latex Neomake
    autocmd! BufWritePost *.hs Neomake
    autocmd! BufWritePost *.py Neomake
    autocmd! bufWritePost *.sh Neomake
    autocmd! bufWritePost *.rs Neomake
augroup END

"" search with incsearch.vim
nmap / <Plug>(incsearch-forward)
nmap ? <Plug>(incsearch-backward)

"" Omnifunc completions
set omnifunc=syntaxcomplete#Complete
let g:EclimCompletionMethod='omnifunc'

"" Unicode
map <F12> <Plug>(MakeDigraph)
nmap ga <Plug>(UnicodeGA)

"" Tagbar
map <F8> :TagbarToggle<CR>

"" mutt 
augroup mutt
    au BufRead /tmp/mutt-* set tw=72
augroup END

"" rust
let g:ycm_rust_src_path='/usr/src/rust/src'
let g:rustfmt_autosave=1

"" operator highlight
let g:ophigh_color = 226

try
    source ~/.config/nvim/config/python.vim
    source ~/.config/nvim/config/ultisnips.vim
    source ~/.config/nvim/config/ycm.vim
    source ~/.config/nvim/config/lightline.vim
    source ~/.config/nvim/config/rainbow.vim
    source ~/.config/nvim/config/haskell.vim
    source ~/.config/nvim/config/terminal.vim
    source ~/.config/nvim/config/startify.vim
    source ~/.config/nvim/config/rust.vim
catch
endtry
