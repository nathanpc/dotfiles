;; ~/.emacs.d/custom-functions.el
;; Some customized functions to make Emacs even better.
;;
;; Author: Nathan Campos <nathanpc@dreamintech.net>

(defun indent-buffer ()
  "Indent a whole buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(provide 'custom-functions)
