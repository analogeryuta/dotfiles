## zsh settings ##

# utf8 setting
export LANG=ja_JP.UTF-8
export LC_TIME=C
export LC_MESSAGES=C

export PAGER=less
export EDITOR='emacs -nw'

# Man path settings
export MANPATH=/usr/share/man:/usr/local/man:/usr/local/share/man:\
/usr/X11/man:/usr/X11/share/man

#for proxy environment settings
export http_proxy="http://proxy.occ.co.jp:8080"
export https_proxy="http://proxy.occ.co.jp:8080"

#for gyazo(and gyazo-cli) setting at work
export GYAZO_SERVER_URL="http://gyazo.es.occ.co.jp"
export GYAZO_CGI_PATH="/"

#for github's git setup
export GIT_ROOT="git@github.com:analogeryuta"

#for ~/bin
export PATH=$PATH:$HOME/bin

