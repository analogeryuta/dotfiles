## zsh settings ##

# utf8 setting
export LANG=ja_JP.UTF-8
export LC_TIME=C
export LC_MESSAGES=C

export PAGER=less
export EDITOR='emacs -nw'

# Install path to Go
export GOPATH=$HOME/.go

# Man path settings
export MANPATH=/usr/share/man:/usr/local/man:/usr/local/share/man:\
/usr/X11/man:/usr/X11/share/man

#for proxy environment settings
#export http_proxy=""
#export https_proxy=""

#for github's git setup
export GIT_ROOT="git@github.com:analogeryuta"

#for ~/bin
export PATH=$PATH:$HOME/bin
