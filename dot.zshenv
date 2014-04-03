## zsh settings ##

#utf8の設定
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
export GO_DIR=/usr/local/go

#Packer(Vagrant Boxのパッケージツール)のインストール先
export PACKER_DIR=~/bin/0.5.2_darwin_amd64

export MANPATH=/usr/share/man:/usr/local/man:/usr/local/share/man:\
/usr/X11/man:/usr/X11/share/man:$SCALA_DIR/man

#path=(/usr/local/bin $path)
#path=($path /usr/X11/bin)
export PATH=$PATH:$ANDROID_SDK_DIR/tools:\
$ANDROID_SDK_DIR/platform-tools:$GO_DIR/bin:\
$SCALA_DIR/bin:~/bin:$PACKER_DIR

# X login settings
#export DISPLAY=":0.0"

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

#for rbenv setting
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/Users/freddie/.rbenv/shims:${PATH}"
export RBENV_SHELL=zsh
source '/Users/freddie/.rbenv/libexec/../completions/rbenv.zsh'
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
