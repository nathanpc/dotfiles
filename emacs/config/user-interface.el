;; ~/.emacs.d/user-interface.el
;; Configures the user interface, making Emacs look nice and pretty.
;;
;; Author: Nathan Campos <nathanpc@dreamintech.net>

;; Load our color theme modules.
(add-to-list 'load-path (concat user-emacs-directory "themes"))

;; Select a pretty theme.
(require 'tomorrow-night-theme)
(color-theme-tomorrow-night)

;; GUI specific configuration.
(if (display-graphic-p)
    (tool-bar-mode -1))          ; Hide that horrible toolbar.
(setq frame-resize-pixelwise t)  ; No gaps.
(setq auto-window-vscroll nil)   ; Improves performance.

;; Set default font.
(cond ((eq system-type 'windows-nt) (set-frame-font "LiterationMono NF-10.0"))
	  ((eq system-type 'darwin) (set-frame-font "LiterationMono Nerd Font Mono 12"))
	  (t (set-frame-font "LiterationMono Nerd Font Mono 9")))

;; Inhibit the startup screen only when appropriate.
(add-hook 'command-line-functions #'inhibit-startup-screen-for-file)

;; Make Emacs look more like a normal text editor.
(setq-default cursor-type 'bar)     ; Use the common, thin style cursor.
(transient-mark-mode 1)             ; Highlight selection.
(delete-selection-mode 1)           ; Replace selected text if I start typing.
(set-scroll-bar-mode 'right)        ; Put the scrollbar where it should be.
(line-number-mode 1)                ; Show line number in the mode line.
(column-number-mode 1)              ; Show column number in the mode line.
(size-indication-mode t)            ; Show file size in the mode line.
(global-display-line-numbers-mode)  ; Show line numbers in the left fringe.
(global-hl-line-mode 1)             ; Highlight the current line.
(define-key global-map              ; Mouse Shift-Click selection.
  (kbd "<S-down-mouse-1>") 'mouse-save-then-kill)

;; Syntax highlighting
(global-font-lock-mode 1)              ; Enable syntax highlighting.
(setq font-lock-maximum-decoration t)  ; Maximum decoration available.

;; Smooth scrolling.
(setq scroll-step 1)                        ; Keyboard scroll one line at time.
(setq scroll-conservatively 10000)          ; Move minimum when cursor exits view.
(setq mouse-wheel-scroll-amount '(1))       ; Mouse scroll moves 1 line at time.
(setq mouse-wheel-progressive-speed nil)    ; Disable accelerated scrolling.
(setq mouse-wheel-follow-mouse t)           ; Only scroll the window under mouse.
(setq fast-but-imprecise-scrolling t)       ; Supposed to improve performance.
(unless (eq system-type 'darwin)
  (setq redisplay-dont-pause nil)             ; Prioritize events instead of redraw.
  (setq jit-lock-defer-time 0))               ; Should improve performance.

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

;; Setup company-mode.
(add-to-list 'load-path (concat user-emacs-directory "company-mode"))
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(provide 'user-interface)
