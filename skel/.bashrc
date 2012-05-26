#! /bin/sh
# Exec in order to avoid problems when replaying .bashrc while in use.
exec ~/.bashrc_bootstrap "$0" "$-" "$@"
echo "Could not launch .bashrc bootstrap!" >& 2
read -p "Press [Enter] to despair! " dummy
