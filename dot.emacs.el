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
(setq load-path (cons "~/.emacs-el" load-path))
(setq load-path (cons "~/.emacs-el/yatex" load-path))
(setq load-path (cons "~/.emacs-el/scala" load-path))

;;; Cocoa Emacs用(window-systemがns(MacOSX)の時)の設定
(if window-system
    (progn
      (if (eq window-system 'ns)
	  (progn 
	    ;;バックスラッシュ入力対策
	    (define-key global-map [165] nil)
	    (define-key global-map [67109029] nil)
	    (define-key global-map [134217893] nil)
	    (define-key global-map [201326757] nil)
	    (define-key function-key-map [165] [?\\])
	    (define-key function-key-map [67109029] [?\C-\\])
	    (define-key function-key-map [134217893] [?\M-\\])
	    (define-key function-key-map [201326757] [?\C-\M-\\])

	    ;;カーソルを点滅させる
	    (blink-cursor-mode t)
	    ;; Cocoa Emacs ウィンドウ透過度の設定
	    ;; 透明度の下限 (50%)
	    (setq frame-alpha-lower-limit 0.5)
	    ;; デフォルトの透明度を設定 (100%)
	    (add-to-list 'default-frame-alist '(alpha . (1.0 0.8)))))
      (setq initial-frame-alist '((width . 90) (height . 50)))))

;;; 言語環境の指定
(set-language-environment "Japanese")
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8-unix)
(set-clipboard-coding-system 'utf-8)

;;; 一行が 80 字以上になった時には自動改行する
(setq fill-column 80)
(setq text-mode-hook 'turn-on-auto-fill)
(setq default-major-mode 'text-mode)

;;; デフォルトでの追加設定．
(global-set-key "\M-g" 'goto-line)
(global-set-key "\M-r" 'replace-string)
(global-set-key "\C-x\C-m" 'buffer-menu)

;;; threat escape sequence
(autoload 'ansi-color-for-comint-mode-on "ansi-color"
	"Set 'ansi-color-for-comint-mode' to t." t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;;; フォントに色をつけない。
(global-font-lock-mode nil)

;;; cc-modeでのインデント幅を変更．4文字分のスペースに．
(setq c-basic-offset 4)

;;; gtags(global)の設定
(autoload 'gtags-mode "gtags" "" t)
(setq gtags-mode-hook
      '(lambda ()
         (local-set-key "\M-t" 'gtags-find-tag)
         (local-set-key "\M-r" 'gtags-find-rtag)
         (local-set-key "\M-s" 'gtags-find-symbol)
         (local-set-key "\C-t" 'gtags-pop-stack)))

;;; texファイルopen時のbufferの文字コード指定
(setq auto-coding-alist
      (append '(("\\.tex\\'" . utf-8)) auto-coding-alist))

;;; Yatex の設定
(setq YaTeX-kanji-code 4)
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq auto-mode-alist
      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))

;;; Scala-mode の設定
(require 'scala-mode-auto)

;;; Google Go の設定
(setq auto-mode-alist
      (cons (cons "\\.go$" 'c-mode) auto-mode-alist))

;;; Mode Check Template
;; (setq auto-insert-directory "~/.emacs-el/templates/")
;; (auto-insert-mode t)
;; (setq auto-insert-query t) ;; テンプレート挿入時に尋ねる
;; (setq auto-insert-alist
;;       (append
;;        '(
;;  	 ("\\.\\(c$\\)\\'" . "default.c")
;; 	 ("\\.\\(pl$\\|cgi$\\)\\'" . "default.pl")
;; 	 ("\\.\\(rst$\\)\\'" . "default.rst")
;; 	 ("\\.\\(java$\\)\\'" . "default.java")
;; 	 auto-insert-alist))
;;       )

;;このファイルに間違いがあった場合に全てを無効にする。
(put 'eval-expression 'disabled nil)