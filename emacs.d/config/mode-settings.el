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
(defalias 'perl-mode 'cperl-mode)

;; Setup R mode.
(require 'ess-r-mode)
(setq comint-input-ring-size 1000)  ; Get a nice history.
(setq ess-indent-level 2)           ; Make sure everything is indented by
(setq ess-arg-function-offset 2)    ; 2 spaces.
(setq ess-else-offset 2)

(provide 'mode-settings)

