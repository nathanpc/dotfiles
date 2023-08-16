;; ~/.emacs.d/config/external-packages.el
;; Manages all of our external packages to improve our life.
;;
;; Author: Nathan Campos <nathan@innoveworkshop.com>

; Initialize Emacs's built-in package manager.
(require 'package)
(setq package-check-signature nil)  ; Fix for ELPA bug in Emacs 27.1.
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("user42" .
						"https://download.tuxfamily.org/user42/elpa/packages/"))
(package-initialize)

; Setup use-package.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))
(eval-when-compile
  (require 'use-package))

;;
;; Theming and User Interface
;;

; Nord theme (font face)
(use-package nord-theme
  :config (load-theme 'nord t))

; All the Icons
(use-package all-the-icons
  :if (display-graphic-p))

; Dashboard
(use-package dashboard
  :config
  (setq dashboard-startup-banner 'logo)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-set-navigator t)
  (setq dashboard-items '((recents  . 15)
                          (bookmarks . 8)
                          (registers . 8)))
  (dashboard-setup-startup-hook))

; Dimmer
(use-package dimmer
  :init (dimmer-mode)
  :config
  (setq dimmer-fraction 0.35))  ; Make other buffers dimmer.

;;
;; Indentation, Fringe, and other Editor Aesthetics
;;

; Highlight Escape Sequences
(use-package highlight-escape-sequences
  :hook (prog-mode-hook . hes-mode))

; Highlight Numbers
(use-package highlight-numbers
  :hook (prog-mode-hook . highlight-numbers-mode))

; Rainbow Mode
(use-package rainbow-mode
  :init
  (dolist (hook '(css-mode-hook html-mode-hook sass-mode-hook))
	(add-hook hook 'rainbow-mode)))

; Rainbow Delimiters
(use-package rainbow-delimiters
  :hook (prog-mode-hook . rainbow-delimiters-mode))

; Highlight Indent Guides
(use-package highlight-indent-guides
  :config
  (setq highlight-indent-guides-method 'character)           ; Thin line style.
  :init
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)   ; Show guides in code.
  (add-hook 'text-mode-hook 'highlight-indent-guides-mode))  ; Show guides in text.

; Git Gutter Fringe
(use-package git-gutter-fringe
  :init (global-git-gutter-mode t))

; NeoTree
(use-package neotree
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (global-set-key [f8] 'neotree-toggle))

;;
;; Programming Languages
;;

; Markdown
(use-package markdown-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode)))

; Perl POD Preview
(use-package perl-pod-preview
  :init
  (autoload 'perl-pod-preview "perl-pod-preview" nil t)
  (eval-after-load "cperl-mode"
    '(define-key cperl-mode-map [f8] 'perl-pod-preview)))

; Better Perl POD Editing
(use-package perl-pod-gt
  :init
  (autoload 'perl-pod-gt-double "perl-pod-gt" nil t)
  (autoload 'perl-pod-gt-single "perl-pod-gt" nil t)
  (autoload 'perl-pod-gt-enable "perl-pod-gt")
  (add-hook 'perl-mode-hook 'perl-pod-gt-enable)
  (add-hook 'cperl-mode-hook 'perl-pod-gt-enable)
  (add-hook 'pod-mode-hook   'perl-pod-gt-enable))

;;
;; Manually Installed Packages
;;

;; Man completion.
(require 'man-completion)

; Rich Text Format
(autoload 'rtf-mode "rtf-mode" "RTF mode" t)
(add-to-list 'auto-mode-alist '("\\.rtf$" . rtf-mode))

(provide 'external-packages)
