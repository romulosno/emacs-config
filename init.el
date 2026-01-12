;;; init.el --- Emacs config -*- lexical-binding: t; -*-

(add-to-list 'load-path (locate-user-emacs-file "lisp"))

(require 'rom-core)
(require 'rom-functions)
(require 'rom-ui)
(require 'rom-completion)
(require 'rom-prog)
(require 'rom-dired)
(require 'rom-vc)
(require 'rom-keybindings)

(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file t)

;;; init.el ends here
(put 'upcase-region 'disabled nil)
