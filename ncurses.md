# Start ncurses
initscr();

# Prints text to the window at default location
printw(string);

# Whatever was done, needs a refresh to show up on the screen
# Note: the refresh functions only refresh the pieces that updated, it does NOT update everything
refresh();

wrefresh(win);
* Refresh the window, not the screen:

# This gets x a char from the user. THIS REFRESHES THE SCREEN!
getch();

wgetch();
* Get char from window

* Options:
KEY_UP
KEY_DOWN
KEY_LEFT
KEY_RIGHT

# This gets strings from the user. getnstr() prevents buffer overflows
getnstr(str, sizeof(str) - 1);

# Closes out ncurses and frees up memory
endwin();

# Window object stdscr, a standard window
stdscr

# Get window boundaries. Because we know top left is (0,0), this get's the bottom right.
int rows, cols;
getyx(stdscr, rows, cols);
getbegyx(stdscr, rows, cols);
getmaxyx(stdscr, rows, cols);
getmaxy(stdscr);
getmaxx(stdscr);

LINES
COLS
* This is the global ncurses variable that gets the max number of lines or cols in a stdscr

# Move cursor to coordinates
move(int, int);

# Move coordinates and print
mvprintw(0, 0, "%d", int_var);

# Add window headers
mvwprintw(WINDOW, 0, 7, "TEXT");

# Clears stdscr entirely
clear();
wclear();
* This erases the window and marks it for a full refresh

# Create window with size and coordinates, then place a box and it's coordinates
WINDOW* win = newwin(height, width, starty, startx);

# This is how you create a box to display for your window.
box(win, 0, 0);
box(win, 100, 104); # 2nd arg is left and right borders, 3rd arg is top and bottom borders 

* Notes:
1. win: the window on which to operate
2. ls: character to be used for the left side of the window
3. rs: character to be used for the right side of the window
4. ts: character to be used for the top side of the window
5. bs: character to be used for the bottom side of the window
6. tl: character to be used for the top left corner of the window
7. tr: character to be used for the top right corner of the window
8. bl: character to be used for the bottom left corner of the window
9. br: character to be used for the bottom right corner of the window
wborder(local_win, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ');

# Print into window based on it's coordinates
wprintw(win, string);
mvwprintw(win, 0, 0, string);

# Shows all and any input print to screen
raw();

# Doesn't display the text when typed for getch or getnstr; put at start
noecho();

# Turn attributes on and off
attron(ARG_PROVIDED); 
attroff(ARG_PROVIDED);

* Options:
A_NORMAL
A_STANDOUT
A_REVERSE
A_BLINK
A_DIM
A_BOLD
A_PROTECT
A_INVIS
A_ALTCHARSET
A_CHARTEXT

* Windowing
wattron(WINDOW, OPTION);
wattroff(WINDOW, OPTION);

# Checks if the terminal can use colors and can change them too
# These return a BOOL T/F
has_colors();
can_change_color();

start_color();
* Set colors and let it start using colors

# Ways to set the coloring
# 1 in init_pair is actually the "id" given to it. When enabling the color with the attron/off
# you need to pass in COLOR_PAIR(1);
init_pair(1, COLOR_RED, COLOR_WHITE);
init_color(COLOR_TANG, 0-999, 0-999, 0-999);
* Make your own color, #DEFINE VAR, R, G, B
attron(COLOR_PAIR(1));

COLOR_PAIR(N)
COLOR_BLACK
COLOR_RED
COLOR_GREEN
COLOR_YELLOW
COLOR_BLUE
COLOR_MAGENTA
COLOR_CYAN
COLOR_WHITE

# Colors and Color Pairs info
COLORS 
* Provides the number of colors you can create beyond the 0-7..255, indexed items
COLOR_PAIRS

# Get keypad input from arrow keys
keypad(WINDOW, true);

# Input modes that basically prevent input or wait
halfdelay(tenths);
nodedlay(stdscr, true);
timeout(delay);

# Ctrl-c to exit ncurses program; but at start of app
cbreak();

# Attributes
attr_t thing = A_REVERSE | COLOR_PAIR(2);
attro(thing);
chtype c = '@' | A_REVERSE | COLOR_PAIR(2);
mvaddch(9, 8, c);

# Move cursor on stdscr and add character
mvaddch(y, x, ch);

mvwaddch(win, y, x, ch);
* Move cursor in window and add character

mvaddstr(y, x, str);
* Move cursor on stdscr and add string

mvwaddstr(win, y, x, str);
* Move cursor in window and add string

# Move cursor on stdscr and print formatted string
mvprintw(y, x, fmt, ...);

mvwprintw(win, y, x, fmt, ...);
* Move cursor in window and print formatted string

move(y, 0);
* Move cursor to line y on stdscr

# Clear to end of line
clrtoeol();

# Move cursor to line y in window
wmove(win, y, 0);

# Clear to end of line in window
wclrtoeol(win);

# Move cursor on stdscr and insert character
mvinsch(y, x, ch);

# Move cursor in window and insert character
mvwinsch(win, y, x, ch);

# Move cursor on stdscr and delete character
mvdelch(y, x);

# Move cursor in window and delete character
mvwdelch(win, y, x);

# Basically reset the window to it's original state
werase(WIN);

# Changes attributes of something already printed on screen
# 1 is the color pair, 0 is the default one used
mvchgat(WIN, 0, 0, NUM_OF_CHARS_TO_CHANGE_LENGTH, A_NORMAL, 1, NULL);

# Clear routines, these can have a "w" in front too
clrtoeol();
* clear to end of line

cleartobot();
* clear to bottom of window

erase();
clear();
* erase is more of a "soft" clear, clear is more of a "hard" clear

# Output/refresh options
clearok();
* Basically sets it to redraw the entire screen. Erase just erases everything that needs to be updated.

scrollok();
* Okay to scroll past the last line. Basically it continues to output text pushing older text upward. Not really "scrolling" but scrolls the window to not just output at the last char in the window/screen.

leaveok();
* Basically says when redraw the window, it doesn't need to redraw the cursor. Basically just leaves the cursor in it's original spot.

immedok();
* Basically is a forced setting to always refresh ANY TIME a print, move, add char event occurs. VERY BAD FOR PERFORMANCE.

# Delete chars
delch();
wdelch();
mvdelch();
mvwdelch();

# Insert and delete lines
insertln();
deleteln();
insdelln();

# Hide cursor
curs_set(0);
curs_set(1);
* 1 is show cursorcurs_set(1);




