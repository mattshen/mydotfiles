call plug#begin('~/.config/nvim/plugged')
" Airline
Plug 'ThePrimeagen/vim-be-good'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/vim-easy-align'
Plug 'janko/vim-test'             " Run Ruby and Elixir tests
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
" Plug 'lyuts/vim-rtags'
Plug 'git@github.com:kien/ctrlp.vim.git'
" Plug 'git@github.com:Valloric/YouCompleteMe.git'
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mbbill/undotree'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Code and files fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
call plug#end()

" set leader
let mapleader=" "

" clipboard
set clipboard=unnamed

" convenience shortcuts to edit and reload this file
nnoremap <silent><leader>e1 :e ~/.config/nvim/init.vim<CR>
nnoremap <silent><leader>e2 :e ~/.config/nvim/vsinit.vim<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>

set autoread                                                                                                                                                                                    
au CursorHold * checktime

syntax on

set signcolumn=yes
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set rnu
set nowrap
set smartcase
set noswapfile
set nobackup
set hlsearch 


" Toggle signcolumn. Works only on vim>=8.0 or NeoVim
function! ToggleSignColumn()
    if !exists("b:signcolumn_on") || b:signcolumn_on
        set signcolumn=no
        let b:signcolumn_on=0
    else
        set signcolumn=yes
        let b:signcolumn_on=1
    endif
endfunction

" toggle number
noremap <F3> :set invnumber invrelativenumber<CR>::call ToggleSignColumn()<CR>
nnoremap <F2> :set invpaste paste?<CR>

set colorcolumn=120
" highlight ColorColumn ctermbg=0 guibg=lightgrey

" styling
colorscheme gruvbox
set background=dark
set wildmenu " when opening a file with e.g. :e ~/.vim<TAB> there is a graphical menu of all the matches
set ttyfast
set lazyredraw
set updatetime=300

" Airline ------------------------------

let g:airline_powerline_fonts = 0
let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 0

if executable('rg')
    let g:rg_derive_root='true'
    " rg is fast enough that CtrlP doesn't need to cache "
    let g:ctrlp_use_caching = 0
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25


au FileType markdown vmap <Leader>,<Bslash> :EasyAlign*<Bar><Enter>

"fast save & exit
nnoremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>
vnoremap <c-s> <Esc>:w<CR>
nnoremap <silent><leader>q :q!<CR>
nnoremap <silent><leader>x :x<CR>

" nerdtree
" let NERDTreeMinimalUI = 1
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
nnoremap <Leader>pt :NERDTreeToggle<Enter>:vertical resize 40<Enter>
nnoremap <silent> <Leader>pv :NERDTreeFind<CR>

" For simple sizing of splits.
" Fzf ------------------------------

" file finder mapping
" nmap ,e :Files<CR>
" tags (symbols) in current file finder mapping
nmap <leader>,e :Files<CR>
nmap <leader>,g :BTag<CR>
" the same, but with the word under the cursor pre filled
nmap <leader>,wg :execute ":BTag " . expand('<cword>')<CR>
" tags (symbols) in all files finder mapping
nmap <leader>,G :Tags<CR>
" the same, but with the word under the cursor pre filled
nmap <leader>,wG :execute ":Tags " . expand('<cword>')<CR>
" general code finder in current file mapping
nmap <leader>,f :BLines<CR>
" the same, but with the word under the cursor pre filled
nmap <leader>,wf :execute ":BLines " . expand('<cword>')<CR>
" general code finder in all files mapping
nmap <leader>,F :Lines<CR>
" the same, but with the word under the cursor pre filled
nmap <leader>,wF :execute ":Lines " . expand('<cword>')<CR>
" commands finder mapping
nmap <leader>,c :Commands<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>m :marks<CR>

" lines and words
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" get out of bracets
" imap <C-K> <C-O>%<C-O>%<right>

" insert mode moving
" In insert or command mode, move normally by using Ctrl
inoremap <c-h> <Left>
inoremap <c-j> <Down>
inoremap <c-k> <Up>
inoremap <c-l> <Right>

" move to head/tail 
map <C-a> <ESC>^
imap <C-a> <ESC>I
map <C-e> <ESC>$
imap <C-e> <ESC>A

" ### programming specials
" move to end and open {}


" Remaps.  This is where the magic of vim happens
nmap <leader>h :wincmd h<CR>
nmap <leader>j :wincmd j<CR>
nmap <leader>k :wincmd k<CR>
nmap <leader>l :wincmd l<CR>
nnoremap <leader>wt :wincmd t<CR>
nnoremap <leader>wb :wincmd b<CR>

map - <C-W>-
map + <C-W>+
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>

" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <Leader>,m :ZoomToggle<CR>

" folder search 
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <Leader>wps :execute ":Rg " . expand('<cword>')<CR>

" YCM
" The best part.
" nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
" nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>
" nnoremap <silent> <Leader>gr :YcmCompleter GoToReferences<CR>
" nnoremap <silent> <Leader>gi :YcmCompleter GoToImplementation<CR>

" ### Coc START ###
" Show autocomplete when Tab is pressed
" Use <c-space> to trigger completion.
"
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" GoTo code navigation.
nmap <silent> <Leader>gd <Plug>(coc-definition)
nmap <silent> <Leader>gy <Plug>(coc-type-definition)
nmap <silent> <Leader>gi <Plug>(coc-implementation)
nmap <silent> <Leader>gr <Plug>(coc-references)
" Find symbol of current document."
nnoremap <silent> <space>co :<C-u>CocList outline<CR>
nnoremap <leader>cs :CocSearch 
nnoremap <leader>wcs :CocSearch <C-R>=expand("<cword>")<CR><CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nnoremap <C-T> :call CocActionAsync('rename')<CR>

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" CoC extensions
let g:coc_global_extensions = ['coc-tsserver', 'coc-json']

" Add CoC Prettier if prettier is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

" Add CoC ESLint if ESLint is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif
" ### Coc END ###

" vim-test shortcut for running tests
nnoremap <silent><leader>; :TestNearest<CR>
nnoremap <silent><leader>' :TestFile<CR>

