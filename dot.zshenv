## zsh settings ##

# utf8 setting
export LANG=ja_JP.UTF-8
export LC_TIME=C
export LC_MESSAGES=C

export PAGER=less
export EDITOR='emacs'

# Install path to JDK(for Linux)
export JAVA_HOME=/usr/local/jdk1.7.0_71

# Install path to Scala
export SCALA_DIR=/usr/local/scala-2.9.2

# Install path to Go
export GOPATH=$HOME/.go
export GOROOT=/usr/local/go
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH

# Install path to EC2 CLI tools
export EC2_HOME=/usr/local/ec2/ec2-api-tools-1.7.4.0
export EC2_JVM_ARGS="-Dhttps.proxyHost=proxy.occ.co.jp -Dhttps.proxyPort=8080"
export EC2_URL=https://ec2.ap-northeast-1.amazonaws.com

# Install path to Packer
export PACKER_DIR=$HOME/bin/packer

# Install path to Terraform
export TERRAFORM_DIR=$HOME/bin/terraform

# Install path settings
export PATH=$PATH:$GOPATH/bin:\
$JAVA_HOME/bin:\
$HOME/bin:$PACKER_DIR:$TERRAFORM_DIR:$EC2_HOME/bin

# Man path settings
export MANPATH=/usr/share/man:/usr/local/man:/usr/local/share/man:\
/usr/X11/man:/usr/X11/share/man

#X login settings
#export DISPLAY=":0.0"

#for proxy environment settings
export http_proxy="http://proxy.occ.co.jp:8080"
export https_proxy="http://proxy.occ.co.jp:8080"

#for gyazo setting at work
export GYAZO_HOST="gyazo.es.occ.co.jp"
export GYAZO_CGI_PATH="/"

#for SVN setup
export SVNEDITOR="emacs -nw"
export SVNROOT=""

#for mercurial setup
export HG_ROOT=""

#for github's git setup
export GIT_ROOT="git@github.com:analogeryuta"

# for linuxbrew setting
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

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
