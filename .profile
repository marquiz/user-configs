# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
# Added by marquiz:
# start ssh-agent for non-graphical logins
if [ -z "$DISPLAY" -a -z "$TMUX" ] ; then
    # Kill on shell exit
    trap 'test -n "$SSH_AGENT_PID" && eval `ssh-agent -k`' 0
    # Launch the agent
    eval `ssh-agent`
    # Trap CTRL-C on ssh-add (and remove the trap)
    trap : SIGINT
    ssh-add
    trap - SIGINT
fi
