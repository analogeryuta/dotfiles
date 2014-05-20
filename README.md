## What is this?

使用するPCの環境設定を色々記述した設定ファイル
Linux(Ubuntu), OSX(10.9)上での利用を行っています.

## 構成

* Zsh
    * dot.zshenv
    * dot.zshrc
    * dot.zshlogin(obsolated)
    * dot.zshlogout(obsolated)

* Git
    * dot.gitconfig
    * dot.gitignore

* Emacs
    * dot.emacs.el(-> ~/.emacs.el/init.el へsymlink)

* X11(obsoleted)
    * dot.Xmodmap
    * dot.Xresources
    * dot.xinitrc*

## How to use?
利用したいdotfileへhome以下にsymlinkを張ってください.

(例: .gitconfig)

```
[~/]% ln -s ~/dotfiles/dot.gitconfig ~/.gitconfig
```
