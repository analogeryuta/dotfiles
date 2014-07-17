## zsh settings ##

#utf8 setting
export LANG=ja_JP.UTF-8
export LC_TIME=C
export LC_MESSAGES=C

export PAGER=less
export EDITOR='emacs -nw'

# Install path to Scala
export SCALA_DIR=/usr/local/scala-2.9.2

# Install path to Android SDK
export ANDROID_SDK_DIR=/usr/local/android-sdk-macosx

# Install path to Go
export GOPATH=$HOME/.gocode

#Install path to Packer
export PACKER_DIR=$HOME/bin/Packer

#Install path settings
export PATH=$PATH:$ANDROID_SDK_DIR/tools:\
$ANDROID_SDK_DIR/platform-tools:$GOPATH/bin:\
$SCALA_DIR/bin:\
$HOME/bin:$PACKER_DIR

#Man path settings
export MANPATH=/usr/share/man:/usr/local/man:/usr/local/share/man:\
/usr/X11/man:/usr/X11/share/man:$SCALA_DIR/man

#X login settings
#export DISPLAY=":0.0"

#for proxy environment settings
export http_proxy="http://proxy.occ.co.jp:8080"
export https_proxy="http://proxy.occ.co.jp:8080"

#for SVN setup
export SVNEDITOR="emacs -nw"
export SVNROOT=""

#for mercurial setup
export HG_ROOT=""

#for github's git setup
export GIT_ROOT="git@github.com:analogeryuta"

#for rbenv setting
export PATH=$HOME/.rbenv/bin:$PATH
export PATH=$HOME/.rbenv/shims:$PATH
source $HOME/.rbenv/completions/rbenv.zsh
export RBENV_SHELL=zsh

# rbenv command wrapper
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
