#!/bin/bash
#
# Sample .xinitrc for SuSE Linux
# This script is called from 'startx' when you start an X session
#

#
# In case everything goes wrong, we at least fall back to a plain xterm
#
failsafe="xterm -ls -T Failsafe -geometry 80x24-0-0"
trap "exec $failsafe" EXIT SIGHUP SIGINT SIGPIPE SIGTERM SIGIO

#
# Some bash (1 and 2) settings to avoid trouble on a
# failed program call.
#
set +e > /dev/null 2>&1
set +u > /dev/null 2>&1
set +o posix  > /dev/null 2>&1
if type shopt > /dev/null 2>&1 ; then
    shopt -s execfail
else
    no_exit_on_failed_exec=1
fi

#
# Source common code shared between the
# X session and X init scripts
#
. /etc/X11/xinit/xinitrc.common

#
# Special for twm
#
case "$WINDOWMANAGER" in
    *twm) xsetroot -solid darkslateblue
esac

#
# Uncomment next lines to activate asking for ssh passphrase
#
# if test -S "$SSH_AUTH_SOCK" -a -x "$SSH_ASKPASS"; then
#       ssh-add < /dev/null
# fi

#
# Add your own lines here...
#
if test -z "$DBUS_SESSION_BUS_ADDRESS" ; then
    ## if not found, launch a new one
    eval `dbus-launch --sh-syntax --exit-with-session`
    echo "D-Bus per-session daemon address is: $DBUS_SESSION_BUS_ADDRESS"
    export DBUS_SESSION_BUS_PID
fi

# Gnome keyring stuff
eval `/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg`
#export SSH_AUTH_SOCK
export GPG_AGENT_INFO
export GNOME_KEYRING_CONTROL
export GNOME_KEYRING_PID

# SSH agent
eval `ssh-agent`
ssh-add

# Bell off
xset -b

# Start screensaver
xscreensaver &

# Set dual screen
xrandr --output DVI-D-1 --right-of DVI-I-1 --mode 1920x1200

# Start udisks-glue for automounting
if [ -x /usr/bin/udisks-glue ]; then
    /usr/bin/udisks-glue
fi

# day planer deamon
# pland &

# Rotate right display
xrandr --output DVI-D-1 --rotate left
xrandr --output DVI-D-1 --pos 1920x-430

# 
# finally start the window manager
#
unset WINDOW_MANAGER STARTUP
exec $WINDOWMANAGER ${1+"$@"}

# call failsafe
exit 0
