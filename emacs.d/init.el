;; ~/.emacs.d/init.el
;; Main Emacs configuration file.
;;
;; Author: Nathan Campos <nathanpc@dreamintech.net>

;; Environment settings.
(setq user-full-name "Nathan Campos")
(setq user-mail-address "nathanpc@dreamintech.net")
(set-language-environment "English")   ; Default to English.
(recentf-mode 1)                       ; Keep a list of recently opened files.

;; Load our configuration modules.
(require 'user-interface)
(require 'key-bindings)
(require 'code-styling)
