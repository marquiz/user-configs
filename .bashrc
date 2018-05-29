# Sample .bashrc for SuSE Linux
# Copyright (c) SuSE GmbH Nuernberg

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
#export EDITOR=/usr/bin/vim
#export EDITOR=/usr/bin/mcedit

# For some news readers it makes sense to specify the NEWSSERVER variable here
#export NEWSSERVER=your.news.server

# If you want to use a Palm device with Linux, uncomment the two lines below.
# For some (older) Palm Pilots, you might need to set a lower baud rate
# e.g. 57600 or 38400; lowest is 9600 (very slow!)
#
#export PILOTPORT=/dev/pilot
#export PILOTRATE=115200

test -s ~/.alias && . ~/.alias || true

# Added by marquiz
export GOPATH=$HOME/go
export EMAIL="markus.lehtonen@linux.intel.com"
export PATH="/sbin:/usr/sbin:$PATH:/home/marquiz/scripts:$GOPATH/bin"

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
if [ -e /etc/bash_completion.d/git-prompt.sh ]; then
    source /etc/bash_completion.d/git-prompt.sh
    GIT_PS1_SHOWCOLORHINTS=1
    PROMPT_COMMAND='__git_ps1 "\[\033[32;1m\]\u@\h \[\033[34m\]\w\[\033[0m\]" "\\\$ "'
fi
#PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
export GIT_CEILING_DIRECTORIES=$HOME
