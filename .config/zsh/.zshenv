#####################################################################
# init
#####################################################################
# skip load /etc/z*
setopt no_global_rcs

#####################################################################
# Enviroment Variables
#####################################################################
# common
export LANG=en_US.UTF-8
export EDITOR=vim
export PAGER=less
export SHELL=zsh

# XDG Base Directory
export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.local/share
export XDG_CACHE_HOME=~/.cache

# zsh
export ZDOTDIR=$XDG_CONFIG_HOME/zsh

# PATH
typeset -U path MANPATH
path=(
    /usr/local/opt/coreutils/libexec/gnubin(N-/)
    /usr/local/bin
    /usr/bin
    /bin
    /usr/sbin
    /sbin
    $path
)

export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH

# ls
if [[ -f $XDG_CONFIG_HOME/dircolors/dir_colors && -x `which dircolors` ]]; then
    eval $(dircolors $XDG_CONFIG_HOME/dircolors/dir_colors)
else
    export LSCOLORS=gxfxcxdxbxegedabagacad
fi

# less
export LESS='-g -i -M -R -S -W -z-4 -x4'
export LESSHISTFILE=-

# fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 50% --layout=reverse --border'
