;;; outline-imenu-sync.el --- Sync imenu and outline regex  -*- lexical-binding: t; -*-
(defun outline-imenu-sync--apply ()
  "Sync Imenu with `outline-regexp` in the current buffer."
  (setq-local imenu-generic-expression
              `((nil ,outline-regexp 0))))

(defun outline-imenu-sync--enable ()
  (outline-imenu-sync--apply))

(defun outline-imenu-sync--disable ()
  (kill-local-variable 'imenu-generic-expression))

;;;###autoload
(define-minor-mode outline-imenu-sync-mode
  "Sync Imenu with outline headers in the current buffer."
  :lighter " OutIm"
  (if outline-imenu-sync-mode
      (outline-imenu-sync--enable)
    (outline-imenu-sync--disable)))

;;;###autoload
(define-minor-mode global-outline-imenu-sync-mode
  "Enable `outline-imenu-sync-mode` in all outline buffers."
  :global t
  (if global-outline-imenu-sync-mode
      (progn
        (add-hook 'outline-mode-hook #'outline-imenu-sync-mode)
        (add-hook 'outline-minor-mode-hook #'outline-imenu-sync-mode))
    (remove-hook 'outline-mode-hook #'outline-imenu-sync-mode)
    (remove-hook 'outline-minor-mode-hook #'outline-imenu-sync-mode)))

(provide 'outline-imenu-sync)
;;; outline-imenu-sync.el ends here
