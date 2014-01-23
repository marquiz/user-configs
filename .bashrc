# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
# Added by marquiz
export EMAIL="markus.lehtonen@linux.intel.com"
export PATH="/sbin:/usr/sbin:$PATH:/home/marquiz/scripts"

# Remove colon from bash autocompletion delimiters
# makes navigating in obs project structure a lot nicer
export COMP_WORDBREAKS="`echo "$COMP_WORDBREAKS" | sed -e s/://`"

# Use development versions of GBP and GBS
export PYTHONPATH=~/src/git-buildpackage/:~/src/gbs:~/src/otctools/obs-service-git-buildpackage:~/src/otctools/obs-service-gbs
#:~/src/mic

# Hack to make vim use 256 colors in terminator terminal
# Remove when https://bugs.launchpad.net/terminator/+bug/794561 is deployed
if [ "$TERM" == "xterm" ]; then
    export TERM=xterm-256color
fi

# Git branch to prompt
GIT_COMPLETION_SH=""
if [ -e /etc/bash_completion.d/git-prompt* ]; then
    GIT_COMPLETION_SH="/etc/bash_completion.d/git-prompt*"
fi
if [ -e /usr/share/git-core/contrib/completion/git-prompt* ]; then
    GIT_COMPLETION_SH="/usr/share/git-core/contrib/completion/git-prompt*"
fi
if [ -n "$GIT_COMPLETION_SH" ]; then
    source $GIT_COMPLETION_SH
    GIT_PS1_SHOWCOLORHINTS=1
    PROMPT_COMMAND='__git_ps1 "\[\033[32;1m\]\u@\h \[\033[34m\]\w\[\033[0m\]" "\\\$ "'
fi
#PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
export GIT_CEILING_DIRECTORIES=$HOME
