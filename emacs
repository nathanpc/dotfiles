; Set the LoadPath.
(add-to-list 'load-path "~/.emacs.d/plugins/")

; Some stuff that was added automatically.
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(quack-programs (quote ("mzscheme" "bigloo" "csi" "csi -hygienic" "gosh" "gracket" "gsi" "gsi ~~/syntax-case.scm -" "guile" "kawa" "mit-scheme" "racket" "racket -il typed/racket" "rs" "scheme" "scheme48" "scsh" "sisc" "stklos" "sxi"))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal :foundry "unknown" :family "Monaco"))))
 '(mode-line ((t (:foreground "#000000" :background "OliveDrab3" :box nil)))))


; UI styling.
(load "~/.emacs.d/ui_styling")

; Code styling.
(load "~/.emacs.d/code_styling")

; Modes and Hooks.
(load "~/.emacs.d/modes_and_hooks")


; Always highlight the text.
(global-font-lock-mode 1)

; Fix Cut/Copy/Paste.
(global-set-key (kbd "C-S-x") 'clipboard-kill-region)
(global-set-key (kbd "C-S-c") 'clipboard-kill-ring-save)
(global-set-key (kbd "C-S-v") 'clipboard-yank)

; Fix Undo/Redo.
(require 'undo-tree)
(global-undo-tree-mode)
(defalias 'redo 'undo-tree-redo)
(global-set-key (kbd "C-S-z") 'undo)
(global-set-key (kbd "C-y") 'redo)

; Prevent backup file creation.
(setq make-backup-files nil)

; Keep a list of recently opened files.
(recentf-mode 1)

; Make each file open in a new window.
;(setq pop-up-frames t)

