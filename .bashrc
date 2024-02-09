# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

# Added by marquiz
export EDITOR=vim
export GOPATH=$HOME/go
export EMAIL="markus.lehtonen@intel.com"
if ! [[ "$PATH" =~ "/usr/local/go/bin:$HOME/scripts:$GOPATH/bin" ]]; then
    export PATH="/usr/local/go/bin:$PATH:$HOME/scripts:$GOPATH/bin"
fi

# Hack to make vim use 256 colors in terminator terminal
# Remove when https://bugs.launchpad.net/terminator/+bug/794561 is deployed
if [ "$TERM" == "xterm" ]; then
    export TERM=xterm-256color
fi

# Git branch to prompt
GIT_PROMPT_SH=""
if [ -e /etc/bash_completion.d/git-prompt* ]; then
    GIT_PROMPT_SH="/etc/bash_completion.d/git-prompt*"
fi
if [ -e /usr/share/git-core/contrib/completion/git-prompt* ]; then
    GIT_PROMPT_SH="/usr/share/git-core/contrib/completion/git-prompt*"
fi
if [ -n "$GIT_PROMPT_SH" ]; then
    source $GIT_PROMPT_SH
    GIT_PS1_SHOWCOLORHINTS=1
    PROMPT_COMMAND='__git_ps1 "\[\033[32;1m\]\u@\h \[\033[34m\]\w\[\033[0m\]" "\\\$ "'
fi

if [ -e /usr/share/bash-completion/completions/git ]; then
    source /usr/share/bash-completion/completions/git
fi

if [ "$ASCIINEMA_REC" == "1" -o -n "$DEMO_PROMPT" ]; then
    unset PROMPT_COMMAND
    PS1='\[\033[32;1m\]\u@marquiz\[\033[0m\] $ '
fi

export GIT_CEILING_DIRECTORIES=$HOME

alias k=kubectl
