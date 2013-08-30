# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH

# Added by marquiz:
# start ssh-agent for non-graphical logins
if [ x$DISPLAY == x ] ; then
	eval `ssh-agent`
	ssh-add
fi
