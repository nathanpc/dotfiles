;; ~/emacs.d/code-styling.el
;; Customize the way code looks and is structured.
;;
;; Author: Nathan Campos <nathanpc@dreamintech.net>

;; Code indentation.
(global-visual-line-mode 1)        ; Soft wrap lines.
(setq-default indent-tabs-mode t)  ; Indent with tabs.
(setq-default standard-indent 4)   ; Standard indent will be 4 spaces-long.
(setq-default tab-width 4)         ; Set tab width to 4 spaces.
(setq-default c-basic-offset 4)    ; C offset set to 4 spaces.
(setq-default c-basic-indent 4)    ; Indent C code with 4 spaces.
(setq c-default-style "java")      ; The only way C code should look like.

;; Highlight parenthesis.
(setq show-paren-delay 0)             ; Instantly show the matching paren.
(setq show-paren-style 'parenthesis)  ; Highlight the matching paren only.
(show-paren-mode 1)                   ; Turn on paren match highlighting.

;; Remove trailling whitespace.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(provide 'code-styling)
