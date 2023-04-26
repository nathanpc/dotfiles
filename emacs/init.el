;; ~/.emacs.d/init.el
;; Main Emacs configuration file.
;;
;; Author: Nathan Campos <nathanpc@dreamintech.net>

;; Fix paths in case we are unfortunately running under Windows.
(if (eq system-type 'windows-nt)
    (progn
      (setq default-directory "~/")))

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
(add-to-list 'load-path (concat user-emacs-directory "plugins"))

;; Load our configuration modules.
(add-to-list 'load-path (concat user-emacs-directory "config"))
(require 'external-packages)
(require 'custom-functions)
(require 'user-interface)
(require 'key-bindings)
(require 'code-styling)
(require 'mode-settings)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(neotree perl-pod-preview markdown-mode xref-js2 js2-mode company git-gutter-fringe highlight-indent-guides rainbow-delimiters rainbow-mode highlight-numbers highlight-escape-sequences dimmer doom-modeline nord-theme all-the-icons use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight ((t (:background "#454545" :foreground "#ffffff" :underline nil)))))
