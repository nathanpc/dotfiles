;; ~/.emacs.d/mode-settings.el
;; Configures programming and other modes settings.
;;
;; Author: Nathan Campos <nathanpc@dreamintech.net>

;; Enable Yasnippet.
(yas-global-mode)

;; Markdown mode.
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; Open header files in C++ mode.
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; Use a better Perl mode.
(defalias 'perl-mode 'cperl-mode)          ; Switch to the better Perl mode.
(setq cperl-invalid-face nil)              ; Stops the stupid _ from appearing.
(setq cperl-indent-level 4)                ; Indent with 4 spaces (or tab)
(setq cperl-continued-statement-offset 4)  ; Fix hash indentation.
(setq cperl-indent-parens-as-block t)      ; Fixes lines that end with comma.
(setq cperl-close-paren-offset -4)         ; Stupid indentation on close braces.
(setq cperl-hairy t)                       ; Enable everything.

;; Setup R mode.
(require 'ess-r-mode)
(setq ess-fancy-comments nil)       ; Disable weird comment indentation.
(setq comint-input-ring-size 1000)  ; Get a nice history.
(setq ess-indent-level 2)           ; Make sure everything is indented by
(setq ess-arg-function-offset 2)    ; 2 spaces.
(setq ess-else-offset 2)
(require 'ansi-color)               ; Enable colored output inside R shell.
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(provide 'mode-settings)
