;; ~/.emacs.d/init.el
;; Main Emacs configuration file.
;;
;; Author: Nathan Campos <nathanpc@dreamintech.net>

;; Package management.
(load "~/.emacs.d/packman")

;; Automatically generated stuff.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#1d1f21" "#cc6666" "#b5bd68" "#f0c674" "#81a2be" "#c9b4cf" "#8abeb7" "#c5c8c6"])
 '(custom-safe-themes
   (quote
	("427fa665823299f8258d8e27c80a1481edbb8f5463a6fb2665261e9076626710" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "6d589ac0e52375d311afaa745205abb6ccb3b21f6ba037104d71111e7e76a3fc" "93a0885d5f46d2aeac12bf6be1754faa7d5e28b27926b8aa812840fe7d0b7983" "10461a3c8ca61c52dfbbdedd974319b7f7fd720b091996481c8fb1dded6c6116" "d1b4990bd599f5e2186c3f75769a2c5334063e9e541e37514942c27975700370" "43c808b039893c885bdeec885b4f7572141bd9392da7f0bd8d8346e02b2ec8da" "100e7c5956d7bb3fd0eebff57fde6de8f3b9fafa056a2519f169f85199cc1c96" "8aca557e9a17174d8f847fb02870cb2bb67f3b6e808e46c0e54a44e3e18e1020" "6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" "5f27195e3f4b85ac50c1e2fac080f0dd6535440891c54fcfa62cdcefedf56b1b" "3380a2766cf0590d50d6366c5a91e976bdc3c413df963a0ab9952314b4577299" default)))
 '(dimmer-mode t nil (dimmer))
 '(fci-rule-color "#5c5e5e")
 '(jdee-db-active-breakpoint-face-colors (cons "#0d0d0d" "#81a2be"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#0d0d0d" "#b5bd68"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#0d0d0d" "#5a5b5a"))
 '(jdee-server-dir "~/.emacs.d/jdee-server")
 '(objed-cursor-color "#cc6666")
 '(package-selected-packages
   (quote
	(cmake-mode basic-mode web-mode xref-js2 js2-mode dashboard doom-modeline header-tracker package-lint yasnippet jdee markdown-mode highlight-escape-sequences highlight-numbers dumb-jump company rainbow-delimiters rainbow-mode dimmer smex highlight-indent-guides doom-themes git-gutter-fringe)))
 '(sml/theme (quote respectful))
 '(vc-annotate-background "#1d1f21")
 '(vc-annotate-color-map
   (list
	(cons 20 "#b5bd68")
	(cons 40 "#c8c06c")
	(cons 60 "#dcc370")
	(cons 80 "#f0c674")
	(cons 100 "#eab56d")
	(cons 120 "#e3a366")
	(cons 140 "#de935f")
	(cons 160 "#d79e84")
	(cons 180 "#d0a9a9")
	(cons 200 "#c9b4cf")
	(cons 220 "#ca9aac")
	(cons 240 "#cb8089")
	(cons 260 "#cc6666")
	(cons 280 "#af6363")
	(cons 300 "#936060")
	(cons 320 "#765d5d")
	(cons 340 "#5c5e5e")
	(cons 360 "#5c5e5e")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; Environment settings.
(setq user-full-name "Nathan Campos")
(setq user-mail-address "nathan@innoveworkshop.com")
(set-language-environment "English")   ; Default to English.
(recentf-mode 1)                       ; Keep a list of recently opened files.
(setq load-prefer-newer t)             ; Only load *.elc when they are the newest versions.
(setq debug-on-error t)                ; Make errors more noticeable.
(setq apropos-do-all t)                ; Include non-interactive functions in the help search.
(setq gc-cons-threshold 20000000)      ; Set the garbage colletor threshold to 20MB.

;; Use UTF-8 everywhere.
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Put backup files in their right place.
(setq delete-by-moving-to-trash t
	  backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups"))))
      backup-by-copying t
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t
      tramp-backup-directory-alist backup-directory-alist
      auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t))
      create-lockfiles nil)

;; Files should always end with a newline.
(setq require-final-newline t)
(setq mode-require-final-newline t)

;; Load non-ELPA plugins.
(add-to-list 'load-path "~/.emacs.d/plugins")

;; Set the Yasnippet snippet folder.
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))

;; Load our configuration modules.
(add-to-list 'load-path "~/.emacs.d/config")
(require 'custom-functions)
(require 'user-interface)
(require 'key-bindings)
(require 'code-styling)
(require 'mode-settings)
