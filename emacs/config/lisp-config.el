;; ~/emacs.d/lisp-config.el
;; Lisp is the main language of Emacs, so let's turn it into a proper Lisp IDE.
;;
;; Author: Nathan Campos <nathan@innoveworkshop.com>

;; Load the SLIME package.
(add-to-list 'load-path (concat user-emacs-directory "slime"))
(require 'slime-autoloads)

;; Set SBCL as the default Lisp interpreter.
(setq inferior-lisp-program "sbcl")

;; Setup SLIME.
(require 'slime-company)
(slime-setup '(slime-fancy slime-asdf slime-mrepl slime-autodoc slime-fuzzy slime-company))

;; Set Lisp specific overrides.
(add-hook 'lisp-mode-hook
		  (lambda ()
			; Set line margin to 100 characters.
			(setq whitespace-line-column 100)

			; Fix some Common Lisp indents.
			(set (make-local-variable 'lisp-indent-function) 'common-lisp-indent-function)))

;; Set SLIME specific overrides.
(add-hook 'slime-mode-hook
		  (lambda ()
			(define-key slime-prefix-map (kbd "M-h") 'slime-documentation-lookup)

			(unless (slime-connected-p)
			  (save-excursion
				(split-window-horizontally)
				(windmove-right)
				(slime)))

			(set (make-local-variable 'company-backends)
                 '((company-slime company-dabbrev-code company-semantic)))

			(setq slime-company-completion 'fuzzy
                  slime-company-after-completion 'slime-company-just-one-space)))

(provide 'lisp-config)
