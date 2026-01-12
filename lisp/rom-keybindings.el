;;; keybindings.el --- Global & mode keys -*- lexical-binding: t; -*-

(keymap-global-set "<remap> <count-words-region>" #'count-words)
(keymap-global-set "<remap> <capitalize-word>" #'capitalize-dwim)
(keymap-global-set "<remap> <downcase-word>" #'downcase-dwim)
(keymap-global-set "<remap> <upcase-word>" #'upcase-dwim)

(keymap-global-set "M-o" #'other-window)
(keymap-global-set "C-c t" #'transpose-regions)
(keymap-global-set "C-c a" #'org-agenda)
(keymap-global-set "C-c n" #'find-name-dired)
(keymap-global-set "C-c o" #'multi-occur-match-in-all-buffers)
(keymap-global-set "C-c f" #'find-file-existing)
(keymap-global-set "C-c h" #'hl-line-mode)
(keymap-global-set "C-c k" #'kill-current-buffer)
(keymap-global-set "C-c l" #'org-store-link)
(keymap-global-set "C-c m" #'point-to-register)
(keymap-global-set "C-c '" #'jump-to-register)

(keymap-global-set "<f5>" #'compile)
(keymap-global-set "<f8>" #'open-literally)

(keymap-global-set "C-z" #'repeat)

(keymap-set Buffer-menu-mode-map "q" #'kill-buffer-and-window)

(with-eval-after-load 'org
  (keymap-set org-mode-map "C-M-<return>" #'org-insert-subheading))

(provide 'rom-keybindings)
