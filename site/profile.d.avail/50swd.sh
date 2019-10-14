#! /bin/false
swd() { eval "$1=\"`pwd`\"";}
swdx() { export "$1"; swd "$1"; }
