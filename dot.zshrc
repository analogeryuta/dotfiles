## zsh setting ##
fpath=(~/.zsh/completions $fpath)
autoload -Uz compinit
compinit
setopt auto_pushd
setopt correct
setopt share_history
setopt hist_ignore_dups
setopt autocd extendedglob
bindkey -e

HISTFILE=$HOME/.histfile
HISTSIZE=3000
SAVEHIST=3000

## for ssh-agent settings
SSH_ENV=$HOME/.ssh/environment
 
function start_ssh_agent {
     ssh-agent | sed 's/^echo/#echo/' > ${SSH_ENV}
     chmod 0600 ${SSH_ENV}
     . ${SSH_ENV} > /dev/null
     ssh-add
}

# Source SSH agent settings if it is already running, otherwise start
# up the agent proprely.
if [ -f "${SSH_ENV}" ]; then
     . ${SSH_ENV} > /dev/null
     # ps ${SSH_AGENT_PID} doesn't work under cywgin
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
         start_ssh_agent
     }
else
     start_ssh_agent
fi

##補完候補のカーソル選択を有効に
zstyle ':completion:*:default' menu select=1

#ターミナルに色を付ける
setopt printeightbit
if [[ $TERM == "xterm" ]]; then
    export TERM=xterm-color
fi

#プロンプトの表示
#深さ4以上のディレクトリは省略([login:~/.../current] user %)
setopt prompt_subst
PROMPT='[%n:%(2~,%-1~/.../%1~,%~)]%% '

#右側のプロンプトに時計表示
#RPROMPT=$'%{\e[31m%}<%t>%{\e[m%}'

#setting for vcs(git) infomations.
RPROMPT=""

autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'

precmd () { vcs_info }

RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

#プロンプトのカラー表示を有効
autoload -U colors
colors

#aliasの設定
alias rm="rm -i"
alias ls="ls -FGv"
alias df="df -m"
alias du="du -h"
alias editrst='$EDITOR `date +%Y%m%d`.rst'
#alias open="x-www-browser"
alias emacs="emacs -nw"

#java(とその他)の設定
if [[ $LANG == "ja_JP.UTF-8" ]]; then
    export LESSCHARSET=utf-8
    alias javac="javac -J-Dfile.encoding=UTF-8"
    alias java="java -Dfile.encoding=UTF-8"
fi

#for rbenv setting
export PATH=$HOME/.rbenv/bin:$PATH
export PATH=$HOME/.rbenv/shims:$PATH
#source $HOME/.rbenv/completions/rbenv.zsh
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

#for direnv setting.
#eval "$(direnv hook zsh)"

# add brew's installed sbin executes path.
export PATH="/opt/local/sbin:$PATH"

#autoload -U +X bashcompinit && bashcompinit
#complete -o nospace -C /opt/local/bin/terraform terraform

