;; ~/.emacs.d/packman.el
;; A very simple pacakge management solution.
;;
;; Author: Nathan Campos <nathanpc@dreamintech.net>

; Setup package archives.
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("marmalade" . "http://marmalade-repo.org/packages/")
        ("melpa" . "http://melpa.org/packages/")))

; Initialize the package plugin.
(require 'package)
(package-initialize)

; Declare packages.
(setq package-list
      '(doom-modeline package-lint yasnippet jdee markdown-mode highlight-escape-sequences highlight-numbers dumb-jump company rainbow-delimiters rainbow-mode dimmer smex highlight-indent-guides doom-themes git-gutter-fringe))

; Fetch the list of available packages. 
(unless package-archive-contents
  (package-refresh-contents))

; Iterate on packages and install missing ones
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(provide 'packman)