;; ~/.emacs.d/user-interface.el
;; Configures the user interface, making Emacs look nice and pretty.
;;
;; Author: Nathan Campos <nathanpc@dreamintech.net>

;; GUI specific configuration.
(if window-system
    (tool-bar-mode -1))          ; Hide that horrible toolbar.
(setq frame-resize-pixelwise t)  ; No gaps.

;; Set default font.
(set-default-font "LiterationMono Nerd Font Mono 10")

;; Set default theme.
(load-theme 'monokai t)

;; Make Emacs look more like a normal text editor.
(transient-mark-mode 1)       ; Highlight selection.
(delete-selection-mode 1)     ; Replace selected text if I start typing.
(set-scroll-bar-mode 'right)  ; Put the scrollbar where it should be.
(line-number-mode 1)          ; Show line number in the mode line.
(column-number-mode 1)        ; Show column number in the mode line.
(size-indication-mode t)      ; Show file size in the mode line.
(global-linum-mode t)         ; Show line numbers in the left fringe.
(global-hl-line-mode 1)       ; Highlight the current line.

;; Syntax highlighting
(global-font-lock-mode 1)              ; Enable syntax highlighting.
(setq font-lock-maximum-decoration t)  ; Maximum decoration available.

;; Smooth scrolling.
(setq scroll-step 1)                    ; Keyboard scroll one line at a time.
(setq mouse-wheel-scroll-amount
      '(1 ((shift) . 1)))               ; Mouse wheel scrolls one line at a time.
(setq mouse-wheel-progressive-speed t)  ; Enable accelerated scrolling.
(setq mouse-wheel-follow-mouse t)       ; Only scroll the window under mouse.

;; Highlight when a line is greater than 80 characters.
(setq-default
 whitespace-line-column 80
 whitespace-style '(face lines-tail))
(add-hook 'prog-mode-hook #'whitespace-mode)

;; Highlight white spaces.
(setq whitespace-display-mappings
      '((space-mark 32 [183] [46])
	(newline-mark 10 [8629 10])
	(tab-mark 9 [8594 9] [92 9])))

;; Highlight TODOs.
(defun highlight-todos ()
  (font-lock-add-keywords nil
			  '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1
			     font-lock-warning-face t))))
(add-hook 'prog-mode-hook 'highlight-todos)

;; Miscellaneous.
(defalias 'yes-or-no-p 'y-or-n-p)  ; Use y or n instead of yes or no in prompts.
(setq echo-keystrokes 0.1)         ; Show key combination hints faster.

(provide 'user-interface)
