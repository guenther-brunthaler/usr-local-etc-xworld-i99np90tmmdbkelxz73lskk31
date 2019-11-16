#! /bin/false
# Re-enable bash completions for local usage only.
# Version 2019.320

test -z "$BASH_VERSION" && return

# The "/etc/profile.d" script provides a configuration file hook that can be
# used to prevent loading "bash_completion" on per user basis when it's
# installed system wide. To do this:

: echo 'mkdir -p -- "${XDG_CONFIG_HOME:=$HOME/.config}"'
: echo 'shopt -u progcomp >> "$XDG_CONFIG_HOME"/bash_completion'

# Turn it back on (for example in `~/.bashrc`) if you want to use
# programmable completion for other purposes.
shopt -s progcomp
