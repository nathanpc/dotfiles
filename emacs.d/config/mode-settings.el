;; ~/.emacs.d/mode-settings.el
;; Configures programming and other modes settings.
;;
;; Author: Nathan Campos <nathanpc@dreamintech.net>

;; Markdown mode.
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(provide 'mode-settings)
