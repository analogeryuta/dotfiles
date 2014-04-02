## zsh settings ##

#utf8の設定
export LANG=ja_JP.UTF-8
export LC_TIME=C
export LC_MESSAGES=C

export PAGER=less

#for cygwin settings
export CYGROOT=/cygdrive/c

#for vagrant settings
export http_proxy="http://proxy.occ.co.jp:8080"
export https_proxy="http://proxy.occ.co.jp:8080"
export VAGRAND_PATH=$CYGROOT/HashiCorp/Vagrant/bin
export PACKER_PATH=$CYGROOT/HashiCorp/Packer
export VBOX_PATH=$CYGROOT/Program\ Files/Oracle/VirtualBox
export RENV_PATH=$HOME/.rbenv/bin

export MANPATH=/usr/share/man:/usr/local/man:/usr/local/share/man:\
/usr/X11/man:/usr/X11/share/man:$SCALA_DIR/man

path=(/usr/local/bin $path)
export PATH=$PATH:$PACKER_PATH:~/bin:$VBOX_PATH:$RENV_PATH

# Xログインの設定
#export DISPLAY=":0.0"

#for mh and mnews setup
export EDITOR=emacs
export DOMAINNAME=ie.u-ryukyu.ac.jp
export NNTPSERVER=news.ie.u-ryukyu.ac.jp

#for cr's CVS and SVN setup
export CVS_RSH=ssh
export CVS_ROOT=""
export CVSEDITOR="emacs -nw"
export CVSIGNORE=".svn .deps .libs .DS_Store"
export SVNEDITOR="emacs -nw"
export SVNROOT=""

#for cr's mercurial setup
export HG_ROOT=""

#for github's git setup
export GIT_ROOT="git@github.com:analogeryuta"

export PATH="/home/akamine/.rbenv/shims:${PATH}"
export RBENV_SHELL=zsh
source '/home/akamine/.rbenv/libexec/../completions/rbenv.zsh'
rbenv rehash 2>/dev/null
rbenv() {
  local command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "`rbenv "sh-$command" "$@"`";;
  *)
    command rbenv "$command" "$@";;
  esac
}
