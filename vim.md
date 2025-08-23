# All characters have some sort of combination of lower case, uppercase, or 2x upper/lower acctions
# Move cursor ahead of current
a
# Move cursor behind current
i
# Move cursor down with \n
o
# Copy
y
# Paste
p
# Copy whole line
yy
# Delete
d
# Cut (Deletes and put in register (clipboard)). Use p and it will paste below
dd
# Undo
u
# Visual Mode (Highlight)
v
# Change Mode (Insert at location or overwrite line)
c
# Jump by words 
w or e and b
# Delete word
dw
# Move to start or end of line
$ or 0, ^ or g_
# Copy whole world without visual mode (so cursor in word, "Yank Inner Word")
yiw
# Change text inbetween characters like ""(){}[]
ci", ci(, ci{, ci[
# Open vertical window
:vsp, :vsplit ~/Downloads/filename.cpp
# Open horizontal window
:sp, :split ~/Downloads/filename.cpp
# Quit window
:q
# Traverse windows
C-w w, C-w hjkl
# Highlight whole file
ggVG
# File Explorer
:E, :Explore
# Close all windows
qa!
# Save all but don't close
wa
# Resize active window
:vertical 80, :horizontal 30
# Quick Quit and Save
ZZ
# Quick Quit
ZQ
# Open tab in Netrw
t
# Move tab right, left in Netrw
gt, gT
# Replace character
r
# Jump between {} [] () tags
%
# Insert/Overwrite mode (like hitting the insert key)
R
# Set ctags, run at project root
ctags -R
# Then run this in vim to route to tags file
:set tags=../path/to/tags
# Search forward
/type whatever you want after the / char
# Search backward
?type whatever you want after the ? char
# Replace text
:%s/cars\//vehicles\//g
  * %s - perform substitution on entire file, just replaces first occurrance on each line
  * /cars\// - replace word between /--/, but escape special char (/)
  * /vehicles\// - replace previous word with, again escape
  * g - replace globally of ALL occurances

# Settings - Modes that require ":"; Can be disabled with "no" prefix. "nonumber", "notabstop", etc.
set number
set tabstop=4
set shiftwidth=4
set expandtab
inoremap jj <Esc> # maps escape to jj for insert mode
vnoremap jj <Esc> # maps escape to jj for visual mode

" Resize the left window (e.g., 30 columns wide)
" start_windows is just like the function name
" autocmd! means start clean when running function
" wincmd h (left) piped after vsp, set as explore, vertical resize 25, then
augroup start_windows
  autocmd!
  autocmd VimEnter * :vsp | wincmd h | :Explore | vertical resize 25
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
set noequalalways

" Fix netrw window width when opened
autocmd FileType netrw vertical resize 25
