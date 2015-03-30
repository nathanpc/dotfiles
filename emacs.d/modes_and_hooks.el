; modes_and_hooks.el
; Modes and Hooks.

; dirtree mode.
(require 'dirtree)


;;
;; Lisp
;;

(require 'slime)
(add-hook 'lisp-mode-hook (lambda ()
							(slime-mode t)))
(add-hook 'inferior-lisp-mode-hook (lambda ()
									 (inferior-slime-mode t)))
(setq inferior-lisp-program "clisp")


;;
;; PHP
;;

(require 'php-mode)
(autoload 'php-mode "php-mode" "Major mode for editing PHP code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
(add-hook 'php-mode-hook
		  '(lambda ()
			 ;(define-abbrev php-mode-abbrev-table "ex" "extends")
			 (show-all)))



;;
;; Javascript
;;

;(autoload 'js2-mode "js2" nil t)
;(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)


;;
;; Web development stuff.
;;

; Rainbow mode.
(require 'rainbow-mode)
(defun all-css-modes() (css-mode) (rainbow-mode))
(add-to-list 'auto-mode-alist '("\\.css$" . all-css-modes))

; HTML mode hook.
(add-hook 'html-mode-hook
  (lambda ()
    (setq indent-tabs-mode t)
    (set (make-local-variable 'sgml-basic-offset) 4)))


;;
;; Markdown
;;

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


;;
;; YAML
;;

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-hook 'yaml-mode-hook
      '(lambda ()
        (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;;
;; GNUplot
;;

(require 'gnuplot-mode)
(setq auto-mode-alist
	  (append '(("\\.\\(gp\\|gnuplot\\)$" . gnuplot-mode)) auto-mode-alist))

;;
;; Octave
;;
(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
	  (cons '("\\.m$" . octave-mode) auto-mode-alist))
(add-hook 'octave-mode-hook
          (lambda ()
            (abbrev-mode 1)
            (auto-fill-mode 1)
            (if (eq window-system 'x)
                (font-lock-mode 1))))


;;
;; Others.
;;

; CSV mode.
(require 'csv-mode)

; Arduino mode.
;(require 'arduino-mode)

; SPICE mode.
(require 'spice-mode)
;(autoload 'spice-mode "spice-mode" "Spice/Layla Editing Mode" t)
;(setq auto-mode-alist (append (list (cons "\\.sp$" 'spice-mode)
;				       (cons "\\.cir$" 'spice-mode)
;				       (cons "\\.ckt$" 'spice-mode)
; 				       (cons "\\.mod$" 'spice-mode)
; 				       (cons "\\.cdl$" 'spice-mode)
; 				       (cons "\\.chi$" 'spice-mode) ;eldo outpt
; 				       (cons "\\.inp$" 'spice-mode))
; 				 auto-mode-alist))

; ESS
(require 'ess-site)

; Enable rainbow-delimiters.
(require 'rainbow-delimiters)
(add-hook 'scheme-mode-hook 'rainbow-delimiters-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)

; Extension hooks.
(add-to-list 'auto-mode-alist '("\\.rkt\\'" . scheme-mode))

; Mode Hooks.
(add-hook 'scheme-mode-hook
		  (lambda ()
			(require 'quack)
			(require 'scribble)))
(add-hook 'c-mode-common-hook
	  (lambda ()
	    (setq indent-tabs-mode t)))

; Set the default program to run Scheme files.
(setq scheme-program-name "mzscheme")
