;; ~/.emacs.d/custom-functions.el
;; Some customized functions to make Emacs even better.
;;
;; Author: Nathan Campos <nathanpc@dreamintech.net>

(defun indent-buffer ()
  "Indent a whole buffer"
  (interactive)
  (indent-region (point-min) (point-max)))

(defun c-doc-block-comment-return ()
  "Auto-completion of documentation comment blocks after RET"
  (interactive)
  (setq last (point))
  (setq is-inside                         ; Check if inside a valid comment.
        (if (search-backward "*/" nil t)  ; Check if there are endings before.
            (search-forward "/*" last t)  ; Check if it's a new comment block.
          (goto-char last)                ; Go back to the original point.
          (search-backward "/*" nil t)))  ; Check if we are really inside.
  (goto-char last)                        ; Reset cursor position again.
  (if is-inside
      (progn
		(insert "\n* ")                   ; Insert "* " with the newline.
		(indent-for-tab-command))         ; Indent comment properly.
    (insert "\n")                         ; Not inside, insert the newline only.
	(indent-for-tab-command)))            ; Indent the line normally.

(defun c-doc-block-comment-end-slash ()
  "End documentation comment blocks easily after hitting '/'"
  (interactive)
  (setq last (point))
  (setq is-inside                         ; Check if inside a valid comment.
        (if (search-backward "*/" nil t)  ; Check if there are endings before.
            (search-forward "/*" last t)  ; Check if it's a new comment block.
          (goto-char last)                ; Go back to the original point.
          (search-backward "/*" nil t)))  ; Check if we are really inside.
  (goto-char last)                        ; Reset cursor position again.
  (if is-inside
	  ; TODO: Check if this is really a empty line.
	  (if (search-backward "* " nil t)            ; At an empty comment block line.
		  (progn
			(goto-char last)                      ; Reset cursor after search.
			(backward-delete-char-untabify 1))))  ; Delete the trailling whitespace.
  (insert "/"))                                   ; Insert the typed character.

(defun inhibit-startup-screen-for-file ()
  "Startup screen inhibitor for `command-line-functions`.
Inhibits startup screen on the first unrecognised option which
names an existing file."
  (ignore
   (setq inhibit-startup-screen
         (file-exists-p
          (expand-file-name argi command-line-default-directory)))))

(defun c-toggle-header ()
  "Toggles between source and a header file"
  (interactive)
  (setq filename (buffer-file-name))
  (setq filename (if (string-match "cp?" (file-name-extension filename))
					 (progn
					   (setq newfile (concat (file-name-sans-extension filename) ".h"))
					   (if (file-exists-p newfile)
						   newfile
						 (replace-regexp-in-string "\/src\/" "/include/" newfile)))
				   (progn
					 (setq newfile (replace-regexp-in-string "\/include\/" "/src/" filename))
					 (setq newfile (concat (file-name-sans-extension newfile) ".c"))
					 (if (file-exists-p newfile)
						 newfile
					   (concat (file-name-sans-extension newfile) ".cpp")))))
  (if (file-exists-p filename)
	  (find-file filename)
	(error (concat "Header or source file that you tried to switch to doesn't exist: " filename))))

(provide 'custom-functions)
