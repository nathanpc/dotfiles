;; ~/.emacs.d/config/external-packages.el
;; Manages all of our external packages to improve our life.
;;
;; Author: Nathan Campos <nathan@innoveworkshop.com>

;;
;; User Interface and Quality of Life
;;

; Highlight escape sequences.
(require 'highlight-escape-sequences)
(add-hook 'prog-mode-hook 'hes-mode)

; Highlight numbers.
(require 'highlight-numbers)
(add-hook 'prog-mode-hook 'highlight-numbers-mode)

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;;
;; Special Modes
;;

;; Man completion.
(require 'man-completion)

; Rich Text Format
(autoload 'rtf-mode "rtf-mode" "RTF mode" t)
(add-to-list 'auto-mode-alist '("\\.rtf$" . rtf-mode))

(provide 'external-packages)
