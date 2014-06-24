; ui_styling.el
; UI Styling Stuff.

; Hide the GUI tool bar.
(if window-system
	(tool-bar-mode -1))

; Enable human-mode.
;(cua-mode 1)
(transient-mark-mode 1) ; Highlight text selection.
(delete-selection-mode 1) ; Delete seleted text when typing.
(set-scroll-bar-mode 'right)

; Enable tabs.
(require 'elscreen)
(require 'elscreen-color-theme)
(require 'elscreen-dired)
(require 'elscreen-speedbar)
(elscreen-start)
;(load "elscreen" "ElScreen" t)
;(global-set-key (kbd "C-c t c") 'elscreen-create)
;(global-set-key (kbd "C-c t q") 'elscreen-kill)
;(global-set-key (kbd "s-left") 'elscreen-previous)
;(global-set-key (kbd "s-right") 'elscreen-kill)

; Set the font.
(set-default-font "Monaco 9")

; The awesome powerline!
(require 'powerline)

; Enable line and column numbering.
(line-number-mode 1)
(column-number-mode 1)
(require 'nlinum)
(global-linum-mode t)

; Enable the awesome Git gutter.
; For TTY: (require 'git-gutter)
(require 'git-gutter-fringe)
; Using the Tomorrow-Night color scheme.
(set-face-background 'git-gutter:modified "#81a2be")
(set-face-foreground 'git-gutter:added "#b5bd68")
(set-face-foreground 'git-gutter:deleted "#cc6666")
(global-git-gutter-mode t)

; Highlight the current line.
(global-hl-line-mode 1)

; Smooth scrolling.
(setq scroll-step 1)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ; One line at a time.
(setq mouse-wheel-progressive-speed nil) ; Don't accelerate scrolling.
(setq mouse-wheel-follow-mouse 't) ; Scroll window under mouse.
(setq scroll-step 1) ; Keyboard scroll one line at a time.

; whitespace-mode enhancements.
(setq whitespace-display-mappings
	  '((space-mark 32 [183] [46])
		(newline-mark 10 [8629 10])
		(tab-mark 9 [8594 9] [92 9])))

; Sublime Text-like indentation highlight.
;(require 'highlight-indentation)  ; Sadly this shit only works with spaces.

; Highlight TODOs.
;(defun highlight-todos (font-lock-add-keywords nil
;	'(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t))))
;(add-hook 'prog-mode-hook 'highlight-todos)
