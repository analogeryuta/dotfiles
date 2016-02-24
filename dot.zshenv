## zsh settings ##

# utf8 setting
export LANG=ja_JP.UTF-8
export LC_TIME=C
export LC_MESSAGES=C

export PAGER=less
export EDITOR='emacs -nw'

# Install path to Go
export GOPATH=$HOME/.go

# Install path to EC2 CLI tools
export EC2_HOME=/usr/local/ec2/ec2-api-tools-1.7.4.0
export EC2_JVM_ARGS=""
export EC2_URL="https://ec2.ap-northeast-1.amazonaws.com"

# Docker(for OSX) setting.
if [[ `uname` == 'Darwin' ]]; then
   export DOCKER_HOST=tcp://192.168.59.103:2376
   export DOCKER_CERT_PATH=$HOME/.boot2docker/certs/boot2docker-vm
   export DOCKER_TLS_VERIFY=1
fi

# Install path settings
export PATH=$PATH:$GOPATH/bin:\
$HOME/bin:$EC2_HOME/bin

# Man path settings
export MANPATH=/usr/share/man:/usr/local/man:/usr/local/share/man:\
/usr/X11/man:/usr/X11/share/man

#X login settings
#export DISPLAY=":0.0"

#for proxy environment settings
#export http_proxy=""
#export https_proxy=""

#for gyazo setting at work
export GYAZO_HOST=""
export GYAZO_CGI_PATH="/"

#for mercurial setup
#export HG_ROOT=""

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

#for pyenv setting
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"

