#!/usr/bin/env bash

# Load RVM, if you are using it
#[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# Add rvm gems and nginx to the path
#export PATH=$PATH:~/.gem/ruby/1.8/bin:/opt/nginx/sbin

# Path to the bash it configuration
export BASH_IT=$HOME/.bash_it

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='powerline'

# Your place for hosting Git repos. I use this for private repos.
#export GIT_HOSTING='git@git.domain.com'

# Set my editor and git editor
export EDITOR="/usr/bin/vim"
export GIT_EDITOR='/usr/bin/vim'

# Set the path nginx
#export NGINX_PATH='/opt/nginx'

# Don't check mail when opening terminal.
unset MAILCHECK


# Change this to your console based IRC client of choice.

export IRC_CLIENT='weechat'

# Set this to the command you use for todo.txt-cli

export TODO="t"

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/xvzf/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# Load Bash It
if [ -f $BASH_IT/bash_it.sh ]; then
    source $BASH_IT/bash_it.sh
fi

# Export Less options
# Highlight source code
#export LESSOPEN="| ~/.lessfilter %s"
# Show colors and line numbers
export LESS='-R -N'
# Show colored man pages
export LESS_TERMCAP_mb=$(printf '\e[01;31m') # enter blinking mode
export LESS_TERMCAP_md=$(printf '\e[01;32;5;75m') # enter double-bright mode
export LESS_TERMCAP_me=$(printf '\e[0m') # turn off all appearance modes (mb, md, so, us)
export LESS_TERMCAP_se=$(printf '\e[0m') # leave standout mode
export LESS_TERMCAP_so=$(printf '\e[01;34m') # enter standout mode
export LESS_TERMCAP_ue=$(printf '\e[0m') # leave underline mode
export LESS_TERMCAP_us=$(printf '\e[04;36;5;200m') # enter underline mode

export TERM=screen-256color-bce

# Call Homeshick
HOMESHICK="$HOME/.homesick/repos/homeshick/homeshick.sh"
HS_COMPL="$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"
if [ -f $HOMESHICK ]; then
    source $HOMESHICK
fi
if [ -f $HS_COMPL ]; then
    source $HS_COMPL
fi

# Call Machine Specific Function/Envs/Aliases
if [ -f "$HOME/.bash_computer" ]; then
    source "$HOME/.bash_computer"
fi

# Add local to path
if [ -d "$HOME/.local/bin" ]; then
    export PATH="$PATH:$HOME/.local/bin"
fi
