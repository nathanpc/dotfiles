;; ~/.emacs.d/mode-settings.el
;; Configures programming and other modes settings.
;;
;; Author: Nathan Campos <nathanpc@dreamintech.net>

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
(add-to-list 'auto-mode-alist '("\\.psgi\\'" . cperl-mode))
(add-to-list 'auto-mode-alist '("cpanfile\\'" . cperl-mode))

(provide 'mode-settings)
