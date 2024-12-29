;;; my-keybindings.el --- Keybindings configuration  -*- lexical-binding: t; -*-

(global-set-key [remap count-words-region] #'count-words)
(global-set-key [remap capitalize-word] #'capitalize-dwim)
(global-set-key [remap downcase-word] #'downcase-dwim)
(global-set-key [remap upcase-word] #'upcase-dwim)
(global-set-key [remap list-buffers] #'electric-buffer-list)

;;; Ctrl-c prefix
(global-set-key (kbd "C-c f") #'find-name-dired)
(global-set-key (kbd "C-c k") #'kill-current-buffer)
(global-set-key (kbd "C-c r") #'recentf)

(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c l") #'org-store-link)

;;; Misc
(global-set-key (kbd "M-o") #'other-window)
(global-set-key (kbd "M-O") #'other-frame)
(global-set-key (kbd "C-z") #'repeat)
(global-set-key (kbd "<f6>") #'outline-minor-mode)
(global-set-key (kbd "<f5>") #'compile)

;;; Completions
(define-key completion-in-region-mode-map (kbd "M-v") #'switch-to-completions)

;;; Eglot
(with-eval-after-load 'eglot
  (define-key eglot-mode-map (kbd "C-c c r") #'eglot-rename)
  (define-key eglot-mode-map (kbd "C-c c f") #'eglot-format)
  (define-key eglot-mode-map (kbd "C-c c a") #'eglot-code-actions))

;;; Flymake
(with-eval-after-load 'flymake
  (define-key flymake-mode-map (kbd "C-c e") #'flymake-show-project-diagnostics)
  (define-key flymake-mode-map (kbd "<f7>") #'flymake-goto-next-error)
  (define-key flymake-mode-map (kbd "<f8>") #'flymake-goto-prev-error))

;;; Org
(with-eval-after-load 'org
  (define-key org-mode-map (kbd "C-M-<return>") #'org-insert-subheading))

(provide 'my-keybindings)
;;; my-keybindings.el ends here
