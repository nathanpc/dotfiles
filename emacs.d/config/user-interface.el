;; ~/.emacs.d/user-interface.el
;; Configures the user interface, making Emacs look nice and pretty.
;;
;; Author: Nathan Campos <nathanpc@dreamintech.net>

;; GUI specific configuration.
(if (display-graphic-p)
    (tool-bar-mode -1))          ; Hide that horrible toolbar.
(setq frame-resize-pixelwise t)  ; No gaps.
(setq auto-window-vscroll nil)   ; Improves performance.

;; Set default font.
(set-default-font "LiterationMono Nerd Font Mono 10")

;; Inhibit the startup screen only when appropriate.
(add-hook 'command-line-functions #'inhibit-startup-screen-for-file)

;; Import the special icons for Emacs.
(require 'all-the-icons)

;; Set default theme.
(require 'doom-themes)               ; Import the awesome theme.
(setq doom-themes-enable-bold t)     ; Enable bold in the theme.
(setq doom-themes-enable-italic t)   ; Enable italic in the theme.
(load-theme 'doom-tomorrow-night t)  ; Load the theme.
(doom-themes-visual-bell-config)     ; Flash the mode-line as a bell replacement.
(doom-themes-treemacs-config)        ; Enable custom theme for Treemacs.
(doom-themes-org-config)             ; Improves org-mode native fontification.

;; Make Emacs look more like a normal text editor.
(transient-mark-mode 1)             ; Highlight selection.
(delete-selection-mode 1)           ; Replace selected text if I start typing.
(set-scroll-bar-mode 'right)        ; Put the scrollbar where it should be.
(line-number-mode 1)                ; Show line number in the mode line.
(column-number-mode 1)              ; Show column number in the mode line.
(size-indication-mode t)            ; Show file size in the mode line.
(global-display-line-numbers-mode)  ; Show line numbers in the left fringe.
(global-hl-line-mode 1)             ; Highlight the current line.

;; Syntax highlighting
(global-font-lock-mode 1)              ; Enable syntax highlighting.
(setq font-lock-maximum-decoration t)  ; Maximum decoration available.

;; Smooth scrolling.
(setq scroll-step 1)                      ; Keyboard scroll one line at a time.
(setq scroll-conservatively 10000)        ; Move minimum when cursor exits view.
(setq scroll-preserve-screen-position 1)  ; Cursor stays in place when scrolling.
(setq mouse-wheel-scroll-amount '(1))     ; Mouse scroll moves 1 line at a time.
(setq mouse-wheel-progressive-speed nil)  ; Disable accelerated scrolling.
(setq mouse-wheel-follow-mouse t)         ; Only scroll the window under mouse.
(setq redisplay-dont-pause nil)           ; Prioritize events instead of redraw.
(setq jit-lock-defer-time 0)              ; Should improve performance.
(setq fast-but-imprecise-scrolling t)     ; Supposed to improve performance.

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

;; Nice dashboard.
(require 'dashboard)
(setq dashboard-startup-banner 'logo)
(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)
(setq dashboard-set-navigator t)
(setq dashboard-items '((recents  . 15)
                        (bookmarks . 8)
                        (registers . 8)))
(dashboard-setup-startup-hook)

;; Miscellaneous.
(defalias 'yes-or-no-p 'y-or-n-p)  ; Use y or n instead of yes or no in prompts.
(setq echo-keystrokes 0.1)         ; Show key combination hints faster.

;; Doom Modeline.
(require 'doom-modeline)
(doom-modeline-mode t)
(setq doom-modeline-buffer-file-name-style
	  'relative-from-project)                  ; Show path relative to project.
(setq doom-modeline-indent-info t)             ; Show indentation information.
(setq doom-modeline-minor-modes
	  (featurep 'minions))                     ; Display minor modes.
(defun show-word-count-doom-modeline ()
  (setq doom-modeline-enable-word-count t))    ; Display word count text mode.
(add-hook 'text-mode-hook 'show-word-count-doom-modeline)

;; Smex.
(smex-initialize)  ; Start Smex.

;; Git Gutter.
(require 'git-gutter-fringe)  ; Adds a nice Git gutter to the left fringe.
(global-git-gutter-mode t)    ; Enables it globally.

;; Indent guides.
(setq highlight-indent-guides-method 'character)          ; Thin line style.
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)  ; Show guides in code.
(add-hook 'text-mode-hook 'highlight-indent-guides-mode)  ; Show guides in text.

;; Dimmer.
(setq dimmer-fraction 0.35)  ; Make other buffers dimmer.
(dimmer-mode)                ; Initialize the dimmer.

;; Rainbow mode.
(dolist (hook '(css-mode-hook html-mode-hook sass-mode-hook))
  (add-hook hook 'rainbow-mode))                     ; Highlight color strings.
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)  ; Highlight delimiters.

;; Auto-completion.
(setq company-idle-delay 0)                       ; Auto-complete instantly.
(add-hook 'after-init-hook 'global-company-mode)  ; Enable company-mode.

;; Jump to definition.
(add-hook 'prog-mode-hook 'dumb-jump-mode)
(add-hook 'dumb-jump-after-jump-hook 'recenter)

;; Highlight numbers and escape sequences.
(add-hook 'prog-mode-hook 'highlight-numbers-mode)
(add-hook 'prog-mode-hook 'hes-mode)

;; Man completion.
(require 'man-completion)

(provide 'user-interface)
