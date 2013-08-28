if [ -s ~/.Xmodmap ]; then
    echo "Reading .Xmodmap"
    xmodmap ~/.Xmodmap
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
prlcc &

