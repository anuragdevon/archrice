emulate sh -c 'source /etc/profile'
# ~/.zprofile
#!/bin/bash

#[[ -f ~/.zshrc ]] && . ~/.zshrc

# executables path
export PATH="$PATH:$HOME/.local/bin:$HOME/.local/bin/scripts"
export PATH="$PATH:$HOME/.local/bin/python"
export XCURSOR_PATH=${XCURSOR_PATH}:~/.local/share/icons
export PATH="$PATH:$HOME/.local/share/flutter/bin"
export PATH="$PATH:$HOME/.local/share/lite"
export PATH="$PATH:$HOME/.local/bin/kubectl"
export PATH="$PATH:$HOME/.config/rofi/bin/"
export PATH="$PATH:$HOME/docs/stegdetect/"
# default programs
export TERMINAL="st"
export BROWSER="brave"
export CHROME_EXECUTABLE=/usr/bin/brave
#export JAVA_HOME="/home/anurag/.local/bin/java-se-8u41-ri/"
#export PATH="$PATH:$HOME/.local/bin/java-se-8u41-ri/bin"
#export ANDROID_HOME=/opt/android-sdk
#export PATH=$PATH:$ANDROID_HOME/tools
#export PATH=$PATH:$ANDROID_HOME/platform-tools
#export JAVA_OPTS='-XX:+IgnoreUnrecognizedVMOptions --add-modules java.se.ee'

# XDG base directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc-2.0
export LESSHISTFILE=-
export ZDOTDIR=$HOME/.config/zsh
export HISTFILE="$XDG_DATA_HOME"/zsh/history
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export XAUTHORITY="$XDG_CACHE_HOME"/Xauthority

export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npmrc"
export NPM_CONFIG_PREFIX="$XDG_DATA_HOME/npm"
export NPM_CONFIG_CACHE="$NPM_CONFIG_PREFIX"

# PGDATA PATH
export PGDATA="$HOME/postgres/var"
export PGPORT="5432"

# XMPP Database Setup
export PATH="$PATH:$HOME/.local/share/openfire/bin"

# Alias
alias devon="sudo pacman -S"

#export VIMINIT='source "$XDG_CONFIG_HOME"/vim/vimrc'
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
export PATH=$PATH:$XDG_CONFIG_HOME/nvim/init.vim

# Kubernetes
export KUBE_EDITOR="nvim"

# System Editors
 export VISUAL=nvim;
 export EDITOR=nvim;

# Setup login GNOME-keyring activation
if [ -n "$DESKTOP_SESSION" ];then
	eval $(gnome-keyring-daemon --start)
	export SSH_AUTH_SOCK
fi

# Start XINITRC after login
[ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && echo "Starting Devon System..." && acpi && exec startx "$XINITRC" > /dev/null 2>&1
#	echo "Devon's Windows manager not found, check for sourcing errors in X config files"



