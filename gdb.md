# Run debug the executable
gdb executable
# Run with gui
gdb -tui executable
# Print variable value (you can use * and & operators too)
p varName
# Run debugger
r
# Exit debugger
exit(), ctrl+D, q
# Print Pretty output
set print prettty on
# List code
l
# Print all local vars
info locals
# Set breakpoint (where the number is the line number)
b 20
# Set breakpoint in another file (so long as it is in the sources)
b config.cpp:16
# Continue to next breakpoint
c
# Backtrace to line that caused the crash
bt
# Next line
n
# Step into function
s
# Finish/exit current function
finish
# Fix tui (normally you can only run it once and then it gets funky. just how tui works)
tui enable, tui disable
# Get info of stuff
info
# Get file sources you can debug with
info sources
# Get list of breakpoints
info breakpoint
# Remove breakpoint, delete breakpoint #
d 5
