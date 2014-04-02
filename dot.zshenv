## zsh settings ##

#utf8の設定
export LANG=ja_JP.UTF-8
export LC_TIME=C
export LC_MESSAGES=C

export PAGER=less
export EDITOR='emacs -nw'

#macportの設定
#export MACPORT_DIR=/opt/local

#Scalaのインストール先
export SCALA_DIR=/usr/local/scala-2.9.2

#android SDKのインストール先
export ANDROID_SDK_DIR=/usr/local/android-sdk-macosx

#Packer(Vagrant Boxのパッケージツール)のインストール先
export PACKER_DIR=~/bin/0.5.2_darwin_amd64

export MANPATH=/usr/share/man:/usr/local/man:/usr/local/share/man:\
/usr/X11/man:/usr/X11/share/man:$SCALA_DIR/man

path=(/usr/local/bin $path)
#path=($path /usr/X11/bin)
export PATH=$PATH:$ANDROID_SDK_DIR/tools:$ANDROID_SDK_DIR/platform-tools:$SCALA_DIR/bin:~/bin:$PACKER_DIR

# Xログインの設定
#export DISPLAY=":0.0"

#for mh and mnews setup
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
