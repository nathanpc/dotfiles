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

;; Setup Scheme mode.
(require 'geiser)
(setq geiser-active-implementations '(guile))

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

;; Setup R mode.
(require 'ess-r-mode)
(setq ess-fancy-comments nil)       ; Disable weird comment indentation.
(setq comint-input-ring-size 1000)  ; Get a nice history.
(setq ess-indent-level 2)           ; Make sure everything is indented by
(setq ess-arg-function-offset 2)    ; 2 spaces.
(setq ess-else-offset 2)
(require 'ansi-color)               ; Enable colored output inside R shell.
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; Setup Javascript mode.
(require 'js2-mode)                                      ; Use the best JS mode.
(require 'xref-js2)                                      ; Better code jumps.
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))  ; Attach to extension.
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)        ; Better imenu.
(add-hook 'js2-mode-hook (lambda ()
						   (add-hook 'xref-backend-functions
									 #'xref-js2-xref-backend nil t)))

;; Setup C# mode.
(defun cs-mode-hook ()
  (omnisharp-mode)  ; Use omnisharp mode.
  (company-mode)    ; Enable auto completion.
  (flycheck-mode)   ; Enable syntax checking.

  ; Enable electric pairs depending on the Emacs version.
  (if (version< emacs-version "25.0")
	  (electric-pair-local-mode 1)
	(electric-pair-mode 1))

  ; Setup some useful key bindings.
  (local-set-key (kbd "C-c r r") 'omnisharp-run-code-action-refactoring)
  (local-set-key (kbd "C-c C-c") 'recompile))
(add-hook 'csharp-mode-hook 'cs-mode-hook)

(provide 'mode-settings)
