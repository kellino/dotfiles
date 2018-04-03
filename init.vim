scriptencoding=utf-8

"    d888888b d8b   db d888888b d888888b    db    db d888888b .88b  d88. 
"      `88'   888o  88   `88'      88       88    88   `88'   88'YbdP`88 
"       88    88V8o 88    88       88       Y8    8P    88    88  88  88 
"       88    88 V8o88    88       88       `8b  d8'    88    88  88  88 
"      .88.   88  V888   .88.      88    db  `8bd8'    .88.   88  88  88 
"    Y888888P VP   V8P Y888888P    YP    VP    YP    Y888888P YP  YP  YP 

call plug#begin('~/.config/nvim/bundle/')

"" general
Plug 'itchyny/lightline.vim'
Plug 'critiqjo/vim-bufferline'

Plug 'mhinz/vim-startify'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-eunuch' " unix commands
Plug 'tpope/vim-obsession' " save vim sessions
Plug 'vifm/neovim-vifm'
Plug 'justinmk/vim-sneak'
Plug 'haya14busa/incsearch.vim' 
Plug 'jamessan/vim-gnupg'
Plug 'eugen0329/vim-esearch'
Plug 'junegunn/fzf.vim'

"" Colourscheme(s)
Plug 'iCyMind/NeoSolarized'

"" Text Editing
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'beloglazov/vim-online-thesaurus', { 'for' : ['text', 'markdown', 'tex', 'latex'] }
Plug 'rhysd/vim-grammarous', { 'for' : ['text' , 'markdown', 'tex'] }

Plug 'plasticboy/vim-markdown', { 'for' : 'markdown' }

"" Git
Plug 'tpope/vim-fugitive' | Plug 'airblade/vim-gitgutter'

"" General coding
Plug 'w0rp/ale', { 'for' : [ 'python', 'c', 'latex' ] }
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar', { 'on' : 'TagbarToggle' }

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'Shougo/neosnippet.vim' | Plug 'Shougo/neosnippet-snippets' 
Plug 'Shougo/neco-syntax'

"" assembly
Plug 'Shirk/vim-gas', { 'for' : 'asm' }
Plug 'fidian/hexmode'

"" nix
Plug 'LnL7/vim-nix', { 'for' : 'nix' }

"" tmux syntax
Plug 'tmux-plugins/vim-tmux', { 'for' : 'tmux' }

"" Haskell
Plug 'Twinside/vim-haskellFold',      { 'for' : 'haskell' }
Plug 'Twinside/vim-hoogle',           { 'for' : 'haskell' }
Plug 'enomsg/vim-haskellConcealPlus', { 'for' : 'haskell' }
Plug 'itchyny/vim-haskell-indent',    { 'for' : 'haskell' }

"" Coq, Ott
Plug 'the-lambda-church/coquille', { 'branch' : 'pathogen-bundle', 'for' : 'coq' } | Plug 'let-def/vimbufsync', { 'for' : 'coq' }
Plug 'psosera/ott-vim',            { 'for' : 'ott' }

"" Agda
Plug 'derekelkins/agda-vim', { 'for' : 'agda' }

"" Idris
Plug 'idris-hackers/idris-vim', { 'for' : 'idris' }

"" Python
Plug 'zchee/deoplete-jedi', { 'for' : 'python' }

"" LaTeX
Plug 'lervag/vimtex',     { 'for' : ['tex', 'latex'] }

"" C
Plug 'arakashic/chromatica.nvim', { 'for' : 'c' }
Plug 'zchee/deoplete-clang', { 'for' : 'c' }
Plug 'Shougo/neoinclude.vim', { 'for' : 'c' }

"" Shell Scripting & Vim
Plug 'vim-scripts/sh.vim--Cla', { 'for' : 'sh' }
Plug 'Shougo/neco-vim',         { 'for' : 'vim' }
Plug 'dag/vim-fish',            { 'for' : 'fish' }

call plug#end()

 "======================="
 "      Appearance       "
 "======================="

set termguicolors
set background=dark
let g:neosolarized_termtrans=1
let g:neosolarized_contrast='high'
let g:neosolarized_italic = 1
colorscheme NeoSolarized

set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

hi SpellBad ctermfg=1
hi SpellCap ctermfg=9
hi SpellRare cterm=undercurl
hi SpellLocal cterm=undercurl
hi FoldColumn ctermbg=235
hi LineNr ctermfg=200
hi Comment cterm=italic


 "======================="
 "      Navigation       "
 "======================="

"" unbind ESC
inoremap fj <Esc>

"" undo undo (redo)
inoremap \U <c-r>

"" Switch between splits
set  splitbelow
set  splitright
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

set noequalalways  " don't allow vim to resize splits
set cmdheight=2
set nowrap
set relativenumber
set number
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
set wrapscan
set nohlsearch

set scrolloff=10

set hidden

"" Remove backups
set nobackup
set nowritebackup
set noswapfile

set list
set listchars=tab:▸\ ,nbsp:%,extends:,precedes:
set linebreak
set completeopt=longest,menuone
set wildmode=longest,list:longest,full
set wildignore=*.o,*~,*.pyc,.git/*
set shortmess=aoOtT
set inccommand=split

"" Tab
noremap <Leader>to :tabnew<CR>
noremap <Leader>tt :tabclose<CR>

"" Copy / Paste
set clipboard+=unnamedplus
" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

""
let g:maplocalleader = ','

"" quick save and quit
map qq :wqa!<CR>
map qa :qa!<CR>
map <leader>w :w<CR>

"" History settings
set history=500

"" location window
map lo :lopen<CR>
map lc :lclose<CR>

"" Omnifunc completions
set omnifunc=syntaxcomplete#Complete

" conceal level
set conceallevel=2
set concealcursor=c

"" ctags / hasktags
set tags=./tags;

"" formatting and spelling
augroup formatting
    au BufEnter,BufRead *.md    setlocal formatprg = "par -w120"
    au BufEnter,BufRead *.md    setlocal equalprg  = "par -w120"
    au BufEnter,BufRead *.tex   setlocal formatprg = "par -w120"
    au BufEnter,BufRead *.tex   setlocal equalprg  = "par -w120"
augroup END


"============================="
"      Plugin Options         "
"============================="


"" Python location
let g:python3_host_prog='/home/david/.nix-profile/bin/python'

"" tmux
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> : TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> : TmuxNavigateDown<cr>
nnoremap <silent> <c-k> : TmuxNavigateUp<cr>
nnoremap <silent> <BS>  : TmuxNavigateRight<cr>
nnoremap <silent> <c-p> : TmuxNavigatePrevious<cr>

"" vim-sneak
let g:sneak#label = 1

"" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)

"----------------"
"    Deoplete    "
"----------------"

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#omni_patterns = {}
let g:deoplete#omni#input_patterns = {}

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" neosnippet
imap <s-tab> <Plug>(neosnippet_expand_or_jump)
smap <s-tab> <Plug>(neosnippet_expand_or_jump)
xmap <s-tab> <Plug>(neosnippet_expand_target)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
let g:neosnippet#enable_snipmate_compatibility=1
let g:neosnippet#snippets_directory='~/.config/nvim/after/snippets'

" latex
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = '\\(?:'
      \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
      \ . '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
      \ . '|hyperref\s*\[[^]]*'
      \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ . '|(?:include(?:only)?|input)\s*\{[^}]*'
      \ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|usepackage(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|documentclass(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|\w*'
\ .')'
let g:tex_flavor = 'latex'
let g:tex_stylish = 1
let g:vimtex_view_method = 'zathura'
let g:vimtex_index_split_pos = 'below'
let g:vimtex_fold_enabled=1

"" esearch
let g:esearch = {
  \ 'adapter':    'rg',
  \ 'backend':    'nvim',
  \ 'out':        'win',
  \ 'batch_size': 1000,
  \ 'use':        ['visual', 'hlsearch', 'last'],
  \}

"" Tagbar
map <F8> :TagbarToggle<CR>

"" hexmode
let g:hexmode_patterns = '*.bin,*.exe,*.dat,*.o'

"" easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"" gitgutter
let g:gitgutter_async=0

"" agda
let g:agda_extraincpaths = ['/home/david/.nix-profile/share/agda']
let g:NERDCustomDelimiters = { 'agda': { 'left': '{-', 'right': '-}', 'nested': 1, 'leftAlt': '--', 'nestedAlt': 1 } }

"" coq
let g:deoplete#omni#input_patterns.coq = '[^ \t]'
let g:highlight_coq_checked=1

"" idris
let g:idris_indent_if=3
let g:idris_indent_case=5
let g:idris_indent_let=4
let g:idris_indent_where=6
let g:idris_indent_do=3
let g:idris_indent_rewrite=8
let g:idris_conceal=1

"" C
let g:neoinclude#paths = {}
let g:neoinclude#paths.c = '/nix/store/fn2x7v3bs305xl55ynj698mjc0yfn1lh-glibc-2.26-131-dev/include/'
let g:chromatica#libclang_path='/nix/store/6gkylaxm6s553jh60al5mm1ykj3nf6g0-clang-6.0.0-lib/lib/libclang.so'
let g:chromatica#enable_at_startup=1
let g:deoplete#sources#clang#libclang_path='/nix/store/6gkylaxm6s553jh60al5mm1ykj3nf6g0-clang-6.0.0-lib/lib/libclang.so'
let g:deoplete#sources#clang#clang_header='/nix/store/lhkaxa2lfpa56icqbahxbxa3dfrman3j-clang-6.0.0/lib/clang/6.0.0/include/'


"" other stuff
try
    source ~/.config/nvim/config/lightline.vim
    source ~/.config/nvim/config/haskell.vim
    source ~/.config/nvim/config/terminal.vim
    source ~/.config/nvim/config/startify.vim
catch
endtry
