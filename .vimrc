set list
set listchars=space:·,tab:→\
set relativenumber
set number
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
colorscheme industry
set colorcolumn=80,100
highlight Statement ctermfg=Red guifg=#ff00aa
"highlight ColorColumn ctermbg=25
inoremap ;; <Esc>
vnoremap ;; <Esc>
nnoremap qq :qa!<CR>
nnoremap qw :q!<CR>
nnoremap ss :wa!<CR>:qa!<CR>
nnoremap ff <C-w>w
nnoremap fh <C-w>h
nnoremap fj <C-w>j
nnoremap fk <C-w>k
nnoremap fl <C-w>l
nnoremap ` %
set timeoutlen=200
set wildignorecase
set hlsearch     " Highlight all matches
set incsearch    " Show matches as you type
set ignorecase   " Case-insensitive search
"set smartcase    " Case-sensitive if search includes uppercase

highlight Function ctermfg=Red
" Override Identifier (used often for variables, sometimes namespaces)
highlight Identifier ctermfg=Cyan guifg=#8be9fd





":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
"::::::::::::::::::::::|---------|::::::::::::::::::::::::::
"::::::::::::::::::::::|WINDOWING|::::::::::::::::::::::::::
"::::::::::::::::::::::|---------|::::::::::::::::::::::::::
":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
" Resize the left window (e.g., 30 columns wide)
" start_windows is just like the function name
" autocmd! means start clean when running function
" wincmd h (left) piped after vsp, set as explore, vertical resize 25, then
augroup start_windows
  autocmd!
augroup END

" Open files in a vertical split (like Ctrl-w v);
"0 - reuse window (default)
"1 - new tab
"2 - open horizontal
"3 - open vertical
"4 - open in previous window
let g:netrw_browse_split = 2

" Netrw config
" Don't auto-resize all windows on close
"set noequalalways

" Fix netrw window width when opened
"autocmd FileType netrw resize 10
