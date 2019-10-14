#! /bin/false
# Defines an alias to display the shell's history,
# but remove the line numbers.
# This allows the statements to be directly executed as a script.

alias plain_history="history | sed -e 's/^[ ]*[1-9][0-9]*[ ]*//'"
