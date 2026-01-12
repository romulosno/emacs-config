;;; dired.el --- Dired -*- lexical-binding: t; -*-

(require 'dired-aux)
(require 'dired-x)

(setq dired-kill-when-opening-new-dired-buffer t
      dired-create-destination-dirs 'ask
      dired-recursive-copies 'always
      dired-recursive-deletes 'always
      dired-vc-rename-file t)

(setq ls-lisp-dirs-first t
      ls-lisp-use-insert-directory-program nil)

(provide 'rom-dired)
