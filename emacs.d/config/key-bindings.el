;; ~/.emacs.d/key-bindings.el
;; Defines some key bindings to make things easier on us.
;;
;; Author: Nathan Campos <nathanpc@dreamintech.net>

;; Better Cut/Copy/Paste.
(global-set-key (kbd "C-M-x") 'clipboard-kill-region)
(global-set-key (kbd "C-M-c") 'clipboard-kill-ring-save)
(global-set-key (kbd "C-M-v") 'clipboard-yank)

;; Better Undo/Redo.
(global-set-key (kbd "C-z") 'undo)
;(global-set-key (kbd "C-y") 'redo)

;; Smex.
(global-set-key (kbd "M-x") 'smex)

;; C/C++ mode.
(add-hook 'c-mode-common-hook
		  (lambda ()
			; Toggle between C source and header files.
			(local-set-key (kbd "C-c h") 'header-tracker-toggle-header)

			; Better C comment documentation blocks.
			(local-set-key "\r"
						   'c-doc-block-comment-return)
			(local-set-key (kbd "/")
						   'c-doc-block-comment-end-slash)))

;; Interpret whole buffer when in Lisp Interaction.
(add-hook 'lisp-interaction-mode-hook
		  (lambda ()
			(local-set-key (kbd "C-c r") 'eval-buffer)))

;; ESS mode.
(add-hook 'ess-mode-hook
		  (lambda ()
			; Load file.
			(local-set-key (kbd "C-c r") 'ess-load-file)

		    ; Switch between source and interactive console.
			(local-set-key (kbd "C-c s")
						   'ess-switch-to-inferior-or-script-buffer)))
(add-hook 'inferior-ess-mode-hook
		  (lambda ()
			 (define-key inferior-ess-mode-map (kbd "<up>")
			   'comint-previous-matching-input-from-input)
			 (define-key inferior-ess-mode-map (kbd "<down>")
			   'comint-next-matching-input-from-input)))

(provide 'key-bindings)
