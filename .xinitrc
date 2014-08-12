#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

if test -z "$DBUS_SESSION_BUS_ADDRESS" ; then
    ## if not found, launch a new one
    eval `dbus-launch --sh-syntax --exit-with-session`
    echo "D-Bus per-session daemon address is: $DBUS_SESSION_BUS_ADDRESS"
    export DBUS_SESSION_BUS_PID
fi

# SSH agent (I use Gnome keyring, instead)
#eval `ssh-agent`
#ssh-add

# Gnome keyring stuff
eval `/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg`
export SSH_AUTH_SOCK
export GPG_AGENT_INFO
export GNOME_KEYRING_CONTROL
export GNOME_KEYRING_PID

# Bell off
xset -b
xrandr &> /dev/null
if [ -x /usr/bin/prlcc ]; then
    /usr/bin/prlcc &
fi

# Start screensaver
#xscreensaver &

test -r .Xmodmap && xmodmap .Xmodmap

exec awesome

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
