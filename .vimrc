set list
"set listchars=space:·
set listchars=tab:→\
set relativenumber
set number
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=0
set autoindent
set smartindent
set splitright
set colorcolumn=80,100
set statusline=2
set wrap
"set nowrap
syntax on
colorscheme industry
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
" Only insert the closing char if it's not already there
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
" Only insert the closing char if it's not already there
" Auto-skip closing parentheses/brackets/braces if already there
set timeoutlen=200
set wildignorecase
set hlsearch     " Highlight all matches
set incsearch    " Show matches as you type
set ignorecase   " Case-insensitive search
"set smartcase    " Case-sensitive if search includes uppercase

highlight Function ctermfg=Red
highlight Statement ctermfg=Red guifg=#ff00aa
" Override Identifier (used often for variables, sometimes namespaces)
highlight Identifier ctermfg=Cyan guifg=#8be9fd

" Remap 'o' in netrw to open file in vertical split
augroup netrw_vsplit
  autocmd!
  autocmd FileType netrw nmap <buffer> o <CR>   " default behavior
  autocmd FileType netrw nmap <buffer> o :vertical split<CR>
augroup END
":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
"::::::::::::::::::::::|---------|::::::::::::::::::::::::::
"::::::::::::::::::::::|WINDOWING|::::::::::::::::::::::::::
"::::::::::::::::::::::|---------|::::::::::::::::::::::::::
":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
" Resize the left window (e.g., 30 columns wide)
" start_windows is just like the function name
" autocmd! means start clean when running function
" wincmd h (left) piped after vsp, set as explore, vertical resize 25, then
" augroup start_windows
"  autocmd!
" augroup END

let g:netrw_browse_split = 3
let g:netrw_liststyle = 1
let g:netrw_winsize = 70
