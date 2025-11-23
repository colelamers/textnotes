# Case-insensitive globbing (tab completion is case-insensitive)
shopt -s nocaseglob

# Enable bash completion
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Enable case-insensitive tab completion
bind "set completion-ignore-case on"

# App Paths
export PATH="$PATH:/usr/bin"
export PATH="$PATH:/usr/share/dotnet"
export PATH="$PATH:$HOME/repos/csharp/netcoredbg/build/src"
