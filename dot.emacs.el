;;; *scratch* を勝手に保存しないようにする。
(add-hook 'emacs-startup-hook
	  (lambda ()
 	    (setq buffer-offer-save nil)
 	    (auto-save-mode -1)))


;;; 時計をウィンドウ下のステータスバーに表示する
(display-time)

;;; ctl-spaceでmarkした場所からカーソルまでの領域に色をつけない
(transient-mark-mode -1)

;;; load-pathの設定
;; ~/emacs-el に関する設定
;;(setq load-path (cons "~/.emacs-el" load-path))

;;; 言語環境の指定
(set-language-environment "Japanese")
(set-default-coding-systems 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-buffer-file-coding-system 'utf-8-unix)
(set-clipboard-coding-system 'utf-8-unix)

;;; 一行が 80 字以上になった時には自動改行する
(setq fill-column 80)
(setq text-mode-hook 'turn-on-auto-fill)
(setq default-major-mode 'text-mode)

;;; デフォルトでの追加設定．
(global-set-key "\M-g" 'goto-line)
(global-set-key "\M-r" 'replace-string)
(global-set-key "\C-x\C-m" 'buffer-menu)

;;----------------------------------------
;; 全角スペースとタブを可視化
;;
;;   ref. http://d.hatena.ne.jp/syohex/20110119/1295450495
;;----------------------------------------
(require 'whitespace)
(setq whitespace-style '(face tabs tab-mark spaces space-mark))
(setq whitespace-display-mappings
      '((space-mark ?\x3000 [?\u25a1])
	(tab-mark  ?\t  [?\xBB ?\t] [?\\ ?\t])))
(setq whitespace-space-regexp "\\(\x3000+\\)")
(setq-default show-trailing-whitespace t)

(set-face-foreground  'whitespace-tab "#700000")
(set-face-background  'whitespace-tab 'nil)
(set-face-underline   'whitespace-tab t)
(set-face-foreground  'whitespace-space "#700000")
(set-face-background  'whitespace-space 'nil)
(set-face-background  'trailing-whitespace "purple4")
(global-whitespace-mode 1)

;;----------------------------------------
;; 検索でマッチした箇所をハイライト表示
;;----------------------------------------
(setq search-highlight t)


;;; threat escape sequence
(autoload 'ansi-color-for-comint-mode-on "ansi-color"
	"Set 'ansi-color-for-comint-mode' to t." t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; インデントにtab を使わない
(setq-default tab-width 2 indent-tabs-mode nil)

;;; フォントに色をつけない。
(global-font-lock-mode nil)

;;; cc-modeでのインデント幅を変更．4文字分のスペースに．
(setq c-basic-offset 4)

;;; javascript modeでのインデント幅を変更. 2文字分のスペースへ
(setq js-indent-level 2)

;;; org mode (拡張子が".org")でひらく
(setq auto-mode-alist
      (cons (cons "\\.org$" 'org-mode) auto-mode-alist))

;;; ruby-mode (拡張子が".rake")でひらく
(setq auto-mode-alist
      (cons (cons "\\.rake$" 'ruby-mode) auto-mode-alist))

;;; ruby-mode (ファイル名が"Rakefile")でひらく
(setq auto-mode-alist
      (cons (cons "Rakefile" 'ruby-mode) auto-mode-alist))

;;; ruby-mode (ファイル名が"Capfile")でひらく
(setq auto-mode-alist
      (cons (cons "Capfile" 'ruby-mode) auto-mode-alist))

;;このファイルに間違いがあった場合に全てを無効にする。
(put 'eval-expression 'disabled nil)
