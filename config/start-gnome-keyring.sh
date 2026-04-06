
#!/bin/sh
export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-/run/user/$(id -u)}
mkdir -p "$XDG_RUNTIME_DIR"
eval $(/usr/bin/gnome-keyring-daemon --start --components=secrets,ssh)
echo "export SSH_AUTH_SOCK=$SSH_AUTH_SOCK" > "$XDG_RUNTIME_DIR/gnome-keyring-env"
