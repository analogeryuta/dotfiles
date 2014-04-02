## zsh setting ##
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
PROMPT='[%n:%(4~,%-1~/.../%1~,%~)]%% '

#右側のプロンプト
RPROMPT=$'%{\e[31m%}<%t>%{\e[m%}'

#プロンプトのカラー表示を有効
autoload -U colors
colors

#aliasの設定
alias rm="rm -i"
alias ls="ls -FGv"
alias df="df -m"
alias du="du -h"
alias editrst='$EDITOR `date +%Y%m%d`.rst'

if [[ -f /usr/local/bin/less ]]; then
    alias less="/usr/local/bin/less"
fi
if [[ -f /usr/local/bin/grep ]]; then
    alias grep="/usr/local/bin/grep"
    alias egrep="/usr/local/bin/egrep"
    alias fgrep="/usr/local/bin/fgrep"
fi
if [[ -f /usr/local/bin/emacs ]]; then
    alias emacs="/usr/local/bin/emacs -nw"
    alias etags="/usr/local/bin/etags"
fi
if [[ -f /usr/local/bin/vim ]]; then
    alias vim="/usr/local/bin/vim"
    alias vi="/usr/local/bin/vim"
fi

#java(とその他)の設定
if [[ $LANG == "ja_JP.UTF-8" ]]; then
    export LESSCHARSET=utf-8
    alias javac="javac -J-Dfile.encoding=UTF-8"
    alias java="java -Dfile.encoding=UTF-8"
elif [[ $LANG == "ja_JP.eucJP" ]]; then
    export LESSCHARSET=euc-jp
    alias javac="javac -J-Dfile.encoding=euc-jp"
    alias java="java -Dfile.encoding=euc-jp"
fi
