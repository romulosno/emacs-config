;;; prog.el --- Programming -*- lexical-binding: t; -*-

(add-hook 'prog-mode-hook #'electric-pair-local-mode)
(add-hook 'compilation-filter-hook #'ansi-color-compilation-filter)

(setq compilation-ask-about-save nil
      compilation-max-output-line-length nil
      compilation-scroll-output 'first-error
      compilation-auto-jump-to-first-error 'if-location-known)

(setq eldoc-documentation-strategy 'eldoc-documentation-compose-eagerly
      eldoc-echo-area-use-multiline-p 2)

(setq eglot-autoshutdown t
      eglot-sync-connect nil
      eglot-events-buffer-config '(:size 0))

(with-eval-after-load 'eglot
  (keymap-set eglot-mode-map "C-c c r" #'eglot-rename)
  (keymap-set eglot-mode-map "C-c c f" #'eglot-format)
  (keymap-set eglot-mode-map "C-c c a" #'eglot-code-actions))

(with-eval-after-load 'flymake
  (keymap-set flymake-mode-map "C-c e" #'flymake-show-project-diagnostics)
  (keymap-set flymake-mode-map "M-n" #'flymake-goto-next-error)
  (keymap-set flymake-mode-map "M-p" #'flymake-goto-prev-error))

(provide 'rom-prog)
