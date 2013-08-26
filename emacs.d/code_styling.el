; code_styling.el
; All about code styling.

; Set the color theme.
(require 'color-theme-tomorrow)
(color-theme-initialize)
(color-theme-tomorrow-night)

; Highlight parenthesis.
(setq show-paren-delay 0
	  show-paren-style 'parenthesis)
(show-paren-mode 1) ; Turn on paren match highlighting.
;(setq show-paren-style 'expression) ; Highlight entire bracket expression.

; Set indentation.
(global-set-key "\C-m" 'newline-and-indent)
(setq-default standard-indent 4)
(global-visual-line-mode 1)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
(setq-default c-basic-indent 4)
(setq c-default-style "user")