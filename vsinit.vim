call plug#begin('~/.config/nvim/plugged')
call plug#end()

nnoremap <silent><leader>e1 :e ~/.config/nvim/vsinit.vim<CR>
nnoremap <silent><leader>e2 :e ~/.config/nvim/init.vim<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/vsinit.vim<CR>

set autoread                                                                                                                                                                                    
au CursorHold * checktime

" set leader
let mapleader=" "

nmap <leader>b :Buffers<CR>
nmap <leader>m :marks<CR>

" move insert mode
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" move to head/tail 
map <C-a> <ESC>^
imap <C-a> <ESC>I
map <C-e> <ESC>$
imap <C-e> <ESC>A


" Remaps.  This is where the magic of vim happens
nmap <leader>h :wincmd h<CR>
nmap <leader>j :wincmd j<CR>
nmap <leader>k :wincmd k<CR>
nmap <leader>l :wincmd l<CR>

map - <C-W>-
nnoremap <Leader>+ :vertical resize +10<CR>
nnoremap <Leader>- :vertical resize -10<CR>

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

" vim-test shortcut for running tests
nnoremap <silent><leader>; :TestNearest<CR>
nnoremap <silent><leader>' :TestFile<CR>

