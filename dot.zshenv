## zsh settings ##

# utf8 setting
export LANG=ja_JP.UTF-8
export LC_TIME=C
export LC_MESSAGES=C

export PAGER=less
export EDITOR='emacs -nw'

# Install path to Go
export GOPATH=$HOME/.go
export GOROOT=/usr/local/go
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH

# Install path to Packer
export PACKER_DIR=$HOME/bin/packer

# Install path to Terraform
export TERRAFORM_DIR=$HOME/bin/terraform

# Install path settings
export PATH=$PATH:$GOPATH/bin:\
$HOME/bin:$PACKER_DIR:$TERRAFORM_DIR

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

# for linuxbrew setting
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

#for rbenv setting
export PATH=$HOME/.rbenv/bin:$PATH
export PATH=$HOME/.rbenv/shims:$PATH
source $HOME/.rbenv/completions/rbenv.zsh
export RBENV_SHELL=zsh

#for pyenv setting
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/.pyenv/shims:$PATH"


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

# pyenv eval function for command wrapping settings.
eval "$(pyenv init -)"
